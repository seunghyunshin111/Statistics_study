# Decision Tree
# Cart Algorithm; Algorism

install.packages("rpart")
library(rpart)

?rpart

# CART: 목적변수가 범주형(지니지수), 연속형(분산 이용)
#집단 내의 분산값이 큰 값들을 묶어주고, 나머지는 벌어지게.

m <- rpart(Species~., data = iris)
m
plot(m)
text(m, cex = 1)

install.packages("rpart.plot")
library(rpart.plot)
prp(m, type = 4, extra = 2, digits = 3)


# 정확도가 떨어지기 때문에 모양 만들 때는 잘 쓰지 않음.
# ctree는 안정적이나 속성은 30개 이하만 가능.

install.packages("party")
library(party)

m2 <- ctree(Species~., data = iris)
m2

plot(m2)
