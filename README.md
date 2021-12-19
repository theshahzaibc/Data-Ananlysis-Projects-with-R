# Data-Ananlysis-Projects-with-R
Data Ananlysis Projects with R
# [Water Quality Analysis](https://github.com/theshahzaibc/Data-Ananlysis-Projects-with-R/blob/main/README.md#1-water-quality-analysis)
# [Squid Game Sentiment Analysis](https://github.com/theshahzaibc/Data-Ananlysis-Projects-with-R/blob/main/README.md#2-squid-game-sentiment-analysis)
# [Twitter Sentiment Analysis](https://github.com/theshahzaibc/Data-Ananlysis-Projects-with-R/blob/main/README.md#3-twitter-sentiment-analysis)


# 1. Water Quality Analysis

For the analysis of water quality i will be using the kaggle data set: https://www.kaggle.com/adityakadiwal/water-potability

## Few libraries to plot and cleaning the data

```
library(DataCombine)
library(ggplot2)
library(plyr)

```

## Loading and cleaning the dataset

```
df = read.csv('water_potability.csv')
head(df)

df = DropNA(df)
sum(is.na(df))

fdf = data.frame(table(df$Potability)) 
head(fdf)

```
![image](https://i.imgur.com/dRDUcSP.jpg)

## Distribution of Unsafe and Safe Water

```
ggplot(fdf, aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  labs(title="Distribution of Unsafe and Safe Water") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Potability") +
  ylab("Count") + 
  geom_text(aes(label = Freq), vjust = 2)+
  scale_fill_manual("Potability", values = c("0" = "#E74C3C", "1" = "#2ECC71"))

```
![image](https://i.imgur.com/yG0junJ.png)

## Factors Affecting Water Quality: PH

```
ggplot(df, aes(x = ph, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: PH") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Ph") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/CYEnF7n.png)


## Factors Affecting Water Quality: Hardness

```
ggplot(df, aes(x = Hardness, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: Hardness") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Hardness") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/9dc2jBp.png)

## Factors Affecting Water Quality: Solids

```
ggplot(df, aes(x = Solids, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: Solids") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Solids") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/SJRQgIk.png)


## Factors Affecting Water Quality: Chloramines

```
ggplot(df, aes(x = Chloramines, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: Chloramines") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Chloramines") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/VL2mowD.png)

## Factors Affecting Water Quality: Sulfate

```
ggplot(df, aes(x = Sulfate, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: Sulfate") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Sulfate") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/KSKINgl.png)

## Factors Affecting Water Quality: Conductivity

```
ggplot(df, aes(x = Conductivity, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: Conductivity") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Conductivity") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/cPGUfpp.png)

## Factors Affecting Water Quality: Organic Carbon

```
ggplot(df, aes(x = Organic_carbon, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: Organic Carbon") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Organic Carbon") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/zffc9b7.png)

## Factors Affecting Water Quality: Trihalomethanes

```
ggplot(df, aes(x = Trihalomethanes, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: Trihalomethanes") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Trihalomethanes") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/p7xOG1N.png)

## Factors Affecting Water Quality: Turbidity

```
ggplot(df, aes(x = Turbidity, fill = as.factor(df$Potability))) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  labs(title="Factors Affecting Water Quality: Turbidity") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Turbidity") +
  ylab("Count") + 
  scale_fill_manual("Potability", values = c("0" = "#C0392B", "1" = "#1D8348"))

```
![image](https://i.imgur.com/6x3C9iQ.png)


# 2. Squid Game Sentiment Analysis
So, we will need the dataset for Squid Game and we can find it on twitter in the form of tweets. You can scrape the data according to needs but i will be using https://www.kaggle.com/deepcontractor/squid-game-netflix-twitter-data/download

## Loading useful libraries

```
library(tm)
library(tidytext)
library(dplyr)
library(wordcloud2)
library(tidyverse)
library(glue)
library(stringr)
```
## Loading and cleaning Tweets data
```
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
```

## Make wordcloud
```
tweets_words <-  tweets %>%
  select(text) %>%
  unnest_tokens(word, text)
words <- tweets_words %>% count(word, sort=TRUE)
df <- data.frame(word = words$word,freq=words$n)
head(df)

set.seed(1234)
wordcloud2(data=df, size=1.6, color='random-dark')
```
![image](https://i.imgur.com/kc5ZCEv.png)
![image](https://i.imgur.com/FBcQpQ3.png)

## Getting the sentiments
```
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
```
## Most of people think?

![image](https://i.imgur.com/7wPl3Pg.jpg)

## People thinking Nature about the Squid Game

```
dfs = data.frame(nature=c('Positive', 'Negative'), scores=c(setn$positive, setn$negative))
ggplot(dfs, aes(x = nature, y = scores, fill = nature)) +
  geom_bar(stat = "identity") +
  labs(title="People thinking Nature about the Squid Game") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Nature") +
  ylab("Frequancy") + 
  geom_text(aes(label = scores), vjust = 2)+
  scale_fill_manual("Nature", values = c("Negative" = "#E74C3C", "Positive" = "#2ECC71"))
  
  ```
  ![image](https://i.imgur.com/Anv2AeL.png)
  
  
# 3. Twitter Sentiment Analysis

## Loading useful libraries

```
library(tm)
library(tidytext)
library(dplyr)
library(wordcloud2)
library(tidyverse)
library(glue)
library(stringr)
```
## Loading and cleaning Tweets data
```
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

```
![image](https://i.imgur.com/ZanVjWD.jpeg)

## Make wordcloud
```
tweets_words <-  tweets %>%
  select(tweet) %>%
  unnest_tokens(word, tweet)
words <- tweets_words %>% count(word, sort=TRUE)
df <- data.frame(word = words$word,freq=words$n)
head(df)

set.seed(1234)
wordcloud2(data=df, size=1.6, color='random-dark')

```
![image](https://i.imgur.com/mxys13E.jpeg)

## Getting the sentiments
```
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
```
## Most of people tweets?

![image](https://i.imgur.com/VUTLxrp.jpeg)

## Tweets Nature on Twitter

```
dfs = data.frame(nature=c('Positive', 'Negative'), scores=c(setn$positive, setn$negative))
ggplot(dfs, aes(x = nature, y = scores, fill = nature)) +
  geom_bar(stat = "identity") +
  labs(title="Tweets Nature on Twitter") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Nature") +
  ylab("Frequancy") + 
  geom_text(aes(label = scores), vjust = 2)+
  scale_fill_manual("Nature", values = c("Negative" = "#E74C3C", "Positive" = "#2ECC71"))
  
  ```
  ![image](https://i.imgur.com/RXLqDbg.png)
  
  # 4. Movie Rating Analysis for Beginners
  Download the dataset from here: https://www.kaggle.com/tunguz/movietweetings/download
  
  ## Loading libraries
  ```
library(tidyr)
library(tidyverse)
library(dplyr)
  ```
## Loading datasets
  
```
movies_df <- read.table('movies.dat', sep = ":",colClasses = c(NA, "NULL"),header = FALSE, fill = TRUE)
names(movies_df) = c('ID', 'Title', 'Genre')
head(movies_df)
```
 ![image](https://i.imgur.com/PDtwTte.jpg)
 
```
rating_df <- read.table('ratings.dat', sep = ":",colClasses = c(NA, "NULL"),header = FALSE, fill = TRUE)
names(rating_df) = c('User', 'ID', 'Ratings', 'Timestamp')
head(rating_df)
  ```
   ![image](https://i.imgur.com/thoIT9D.jpg)
  ```
merged_df <- merge(movies_df, rating_df, by = "ID")
head(merged_df)
  ```
  ![image](https://i.imgur.com/PKyMbKA.jpg)
 
 ## Getting most rated movies by the users
 
 ``` 
fdf = table(merged_df$Ratings)
df_prob <- fdf / sum(fdf)
perc_df <- df_prob * 100
perc_df2 <- round(perc_df, 2) 
names(perc_df2) <- names(perc_df)
final_df <- data.frame(perc = perc_df2)
Rating <- final_df$perc.Var1
ggplot(final_df, aes(x=1, y=final_df$perc.Freq, fill=Rating)) +
  labs(title = "Most rated movies pie chart") +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) + 
  geom_text(aes(label = paste0(final_df$perc.Freq, '%')), position = position_stack(vjust = 0.5)) +
  theme_void()
 ```
![image](https://github.com/theshahzaibc/Data-Ananlysis-Projects-with-R/blob/main/m4.png?raw=true)

## Top 10 Movies having rating 10
 ```
df10 <- merged_df[merged_df$Ratings == 10, ]
title_df = data.frame(table(df10$Title))
title_df = title_df[order(title_df$Freq, decreasing = TRUE),][1:10, ]
head(title_df)
ggplot(title_df, aes(x=title_df$Var1, y=title_df$Freq)) + 
  geom_bar(stat="identity", width=.5, fill="tomato3") + 
  labs(title="Top 10 Movies having rating 10", x="Title", y="Count") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
 ```
 ![image](https://github.com/theshahzaibc/Data-Ananlysis-Projects-with-R/blob/main/m7.jpg?raw=true)
 
 
  ![image](https://github.com/theshahzaibc/Data-Ananlysis-Projects-with-R/blob/main/m5.png?raw=true)
 
