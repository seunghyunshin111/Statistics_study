# Decision Tree

library(caret)

# iris 코드 정제 O, 분할부터 시작
idx <- createDataPartition(iris$Species, p = 0.7, list = F)
idx

iris_train[idx, ]
iris_test[-idx, ]

library(rpart)

model <- rpart(Species~., data = iris_train)
plot(model)
text(model, use.n = T, col = "blue")

# 모형 예측
# '분류' 예측 (   cf) '확률'도 있음  )
result <- predict(model, iris_test, type = "class")
result

# 총계

confusionMatrix(result, iris_test$Species)


# 의사결정나무


setwd("C:/Rwork/data/실습용데이터모음")
skin <- read.csv("skin.csv", header = T)
head(skin) 
skin <- skin[-1]
head(skin)
str(skin)

tree1 <- rpart(쿠폰반응여부~., data = skin, control = rpart.control(minsplit = 2))
plot(tree1, compress = T, uniform = T, margin = 0.1)
text(tree1, use.n = T, col = "purple")
tree1


# RandomForest - Ensemble

library(e1071)
library(randomForest)
idx <- createDataPartition(iris$Species, p = 0.7, list = F)
iris_train[idx, ]
iris_test[-idx, ]

rdf <- randomForest(Species~., data = iris_train, importance = T)
rdf

# 랜덤 포레스트의 모든 객체를 rdf가 관리하도록 함
rdf.pred <- predict(rdf, newdata = iris_test, type = "response")
rdf.pred


# 두 예측지 간에 실측지가 어느정도 차이 있는지 알 수 있는 함수
confusionMatrix(rdf.pred, iris_test$Species, positive = "versicolor")

