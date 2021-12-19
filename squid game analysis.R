library(tm)
library(tidytext)
library(dplyr)
library(wordcloud2)
library(tidyverse)
library(glue)
library(stringr)

tweets <- read.csv('squid_game.csv')
tweets = subset(tweets, select = -c(user_location) )
head(tweets)

tweets = DropNA(tweets)
sum(is.na(tweets))

tweets$text <- gsub("https\\S*", "", tweets$text) 
tweets$text <- gsub("@\\S*", "", tweets$text) 
tweets$text <- gsub("amp", "", tweets$text) 
tweets$text <- gsub("[\r\n]", "", tweets$text)
tweets$text <- gsub("[[:punct:]]", "", tweets$text)

tweets_words <-  tweets %>%
  select(text) %>%
  unnest_tokens(word, text)
words <- tweets_words %>% count(word, sort=TRUE)
df <- data.frame(word = words$word,freq=words$n)
head(df)

set.seed(1234)
wordcloud2(data=df, size=1.6, color='random-dark')


setn <- tweets_words %>%
  inner_join(get_sentiments("bing")) %>%
  count(sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

sentiments_scores <- function(pos, neg){
  print("Most people think about the Squid Game")
  if (pos > neg){
    print("Positive 😊")
  }
  else if (neg > pos){
    print("Negative 😠 ")
  }else{
    print("Neutral 🙂 ")
  }
}


sentiments_scores(setn$positive, setn$negative)

dfs = data.frame(nature=c('Positive', 'Negative'), scores=c(setn$positive, setn$negative))
ggplot(dfs, aes(x = nature, y = scores, fill = nature)) +
  geom_bar(stat = "identity") +
  labs(title="People thinking Nature about the Squid Game") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Nature") +
  ylab("Frequancy") + 
  geom_text(aes(label = scores), vjust = 2)+
  scale_fill_manual("Nature", values = c("Negative" = "#E74C3C", "Positive" = "#2ECC71"))
