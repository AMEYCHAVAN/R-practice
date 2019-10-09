library(ggplot2)
library(reshape2)
library(tidyr)
library(dplyr)

setwd('/home/b2xcare.intern/achavan/R-sabd')

getwd() # prints current working directory
mydata = read.csv("CSVForMonth.csv", header = TRUE)

mydata$Month <- as.Date(mydata$Month, '%d-%B-%Y')
head(mydata)

sensexData <- data.frame(mydata$Month,
                         amt.Change = mydata$Sensex.1000)

gsecData <- data.frame(mydata$Month,
                       amt.Change = mydata$Gsec.1000)

cols = c("dates", "Amount")
colnames(sensexData) = cols
colnames(gsecData) = cols

ggplot() +
  geom_line(data = sensexData, aes(x = dates, y = Amount), color = "blue") +
  geom_line(data = gsecData, aes(x = dates, y = Amount), color = "red") +
  xlab('Dates') +
  ylab('Amount') +
  ggtitle("1000 Rupees Invested In Equity Vs Debt Market") +
  theme(legend.position = "bottom")
