# Data-Ananlysis-Projects-with-R
Data Ananlysis Projects with R

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
