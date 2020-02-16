# Decision Tree
# R party

# install.packages("party")
library(party)
str(airquality)
summary(airquality)

air_ctree <- ctree(Temp ~ solar.r + wind + ozone, data = airquality)
air_ctree


# Random Forest 
install.packages("randomForest")
library(randomForest)
rf <- randomForest(Species ~. , data = iris)
rf

rf3 <- randomForest(Species ~., data = iris, importance = TRUE)
importance(rf3)
# MeanDecreaseAccuracy 평균 정확도를 개선, 숫자가 높을수록 정확도가 높다.
# MeanDecreaseGini 불순도를 개선, 숫자가 높은 것이 중요함.



# 변수 중요도 평가 함수
varImpPlot(rf3, main = "")

