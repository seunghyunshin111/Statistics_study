################# 회기분석 / 회기식

ta(cars)  # R에서 제공하는 data인 cars
head(cars)
m <- lm(dist~speed, data = cars)
m
summary(m)

fitted(m)[1:4]   # 1부터 4까지 예측치
residuals(m)[1:4]
?fitted

predict(m, newdata = data.frame(speed = 3))
# dataframe으로 바꿔서 올려야 함.
# m 모형

summary(m)


################## 회기분석

data(Boston)
head(Boston)

#install.packages("mlbench")
library(mlbench)

data("BostonHousing")
head(BostonHousing)
str(BostonHousing)

m2 <- lm(medv~., data = BostonHousing)
m2


# 나머지 데이터: . (여러개의 변량 표시)


m3 <- step(m2, direction = "both")
m3











