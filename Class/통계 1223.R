# NCS 기반

iris_train<-iris[1:105, ] # 데이터의 첫 행부터 105행까지 총 70%를 학습용으로 할당
iris_test<-iris[106:150, ] # 106행부터 마지막 행까지 총 30%를 평가용으로 할당


# catet packages
install.packages("caret")
library(caret)
idx <- createDataPartition(iris$Species, p = 0.7, list = F)
idx

iris_train <- iris[idx, ]
iris_test <- iris[-idx, ]
table(iris_train$Species)
table(iris_test$Species)


# Logistic Regression
library(nnet)
model <- multinom(Species~., data = iris)
summary(model)


# Predict
result <- predict(model, iris_test)
result


# 모형 평가매트릭스 ( Accuracy : 0.9778 )
confusionMatrix(result, iris_test$Species)










