library(tm)
library(tidytext)
library(dplyr)
library(tidyverse)
library(glue)
library(stringr)
library(wordcloud2)
tweets <- read.csv("twitter.csv")
head(tweets)

tweets = DropNA(tweets)
sum(is.na(tweets))

clean_text <- function(uncleaned_text){
  uncleaned_text <- gsub("https\\S*", "", uncleaned_text) 
  uncleaned_text <- gsub("@\\S*", "", uncleaned_text) 
  uncleaned_text <- gsub("amp", "", uncleaned_text) 
  uncleaned_text <- gsub("[\r\n]", "", uncleaned_text)
  uncleaned_text <- gsub("[[:punct:]]", "", uncleaned_text)
  return (uncleaned_text)
}

tweets$tweet = clean_text(tweets$tweet)

tweets_words <-  tweets %>%
  select(tweet) %>%
  unnest_tokens(word, tweet)
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
  print("Most people tweeted on twitter")
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
  labs(title="Tweets Nature on Twitter") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Nature") +
  ylab("Frequancy") + 
  geom_text(aes(label = scores), vjust = 2)+
  scale_fill_manual("Nature", values = c("Negative" = "#E74C3C", "Positive" = "#2ECC71"))

