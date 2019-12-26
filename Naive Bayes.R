# 나이브 베이즈 기법

# 데이터 분할(훈련, 테스트)
data(iris)


#install.packages("caret")
library(caret)


# 150건 --> 70% (105건 ==> 3)
idx <- createDataPartition(iris$Species, p = 0.7, list = F)
?createDataPartition


# 70%로 학습용 데이터 세트 추출
iris_train <- iris[idx,]

table(iris_train$Species)
table(iris_test$Species)


# 나이브 베이즈 기법 적용하기 위한 패키지 로드
library(e1071)


# 나이브 베이즈 적합
naive.result <- naiveBayes(iris_train, iris_train$Species, laplace = 1)


# 테스트 데이터 평가
naive.pred <- predict(naive.result, iris_test, type = "class")


#분류 결과 도출
table(naive.pred, iris_test$Species)


confusionMatrix(naive.pred, iris_test$Species)



# 실습
# Naive Bayes

setwd("c:/Rwork/data/실습용데이터모음/")
movie <- read.csv("movie.csv", header = T)

library(e1071)
nm <- naiveBayes(movie[1:5], movie$장르, laplace = 0)
head(movie)

result <- predict(nm, movie[1:5])
sum(movie$장르 != result)
result


### 전체 소스코드

movie <- read.csv("movie.csv", header = T)
#library(e1071)
nm <- naiveBayes(movie[1:5], movie$장르, laplace = 0)
head(movie)

result <- predict(nm, movie[1:5])
sum(movie$장르 != result)
result


# 문제2
library(e1071)
mail <- read.csv("spam.csv", header = T)
mail[is.na(mail)] <- 0
nm2 <- naiveBayes(mail[2:13], mail$메일종류, laplace = 0)
head(mail)

result2 <- predict(nm2, mail[2:13])
sum(mail$메일종류 != result2)
result2

nm2


# 추가코드 - 핵심키워드 추출

library(KoNLP)
txt <- readLines('spam.txt')
