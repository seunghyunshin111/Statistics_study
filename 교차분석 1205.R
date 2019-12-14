###### 1장 교차분석

setwd("c:/Rwork/data")
data <- read.csv("cleanDescriptive.csv", header=TRUE)
data # 확인
head(data) # 변수 확인
str(data)
x <- data$level2 # 부모의 학력 수준
y <- data$pass2  # 자녀의 대학 진학 여부

table(x, y)

#install.packages("gmodels")  # crossTable
#install.packages("ggplot2")  # diamond

library(gmodels)
library(ggplot2)

data("diamonds")
diamonds

CrossTable(x = diamonds$color, y = diamonds$cut)

# 163: 관측치
# 3번째줄 : 행의 비율, 4번째: 열 기준으로의 비율


head(diamonds)
summary(diamonds)

