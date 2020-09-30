# 인공신경망 이론

library(caret)
idx <- createDataPartition(iris$Species, p = 0.7, list = F)
iris_train <- iris[idx, ] # 생성된 인덱스를 이용, 70%의 비율로 학습용 데이터 세트 추출
iris_test <- iris[idx, ] # 생성된 인덱스를 이용, 30%의 비율로 평가용 데이터 세트 추출
table(iris_train$Species)


library(nnet) # 인공신경망 기법을 사용하기 위해 nnet 패키지 로딩
iris_train_scale <- as.data.frame(sapply(iris_train[,-5], scale)) # 데이터 표준화
iris_test_scale <- as.data.frame(sapply(iris_test[,-5], scale))
iris_train_scale$Species <- iris_train$Species
iris_test_scale$Species <- iris_test$Species

nnet.result <- nnet(Species~., iris_train_scale, size = 3)
# size = ' ' (노드 수)

# 훈련데이터 통한 모형 적합
nnet.pred <- predict(nnet.result, iris_test_scale, type = "class") # 테스트 데이터 평가
table(nnet.pred, iris_test$Species) # 분류 결과도출


# 실습 1-2
# 인공 신경망 이론

prob <- read.csv("problem.csv", header = T, stringsAsFactors = F)
head(prob)

#지역해결정방지-방법1
for(i in 1:30){
  # 0에서 1 사이의 값으로 전환
  prob[i] <- prob[i] * (1/5)

}
head(prob)


#정규화-방법2
normalize <- function(x){
  return((x-min(x)) / diff(range(x)))
}

#sigmoid-방법3(0.0 ~ 1.0 확률을 리턴하므로 정규화에도 사용가능하다)
sigmoid <- function(x){
  return(1 / (1 + exp(-x)))
}
#사고를 친 병사는 "1", 아닌 병사는 "0"으로 대체

prob$accident2 <- with(prob, ifelse(accident == "suicide" | accident == "violence", 1, 0))
head(prob)

library(nnet)
prob <- prob[-31]
m1 <- nnet(accident2 ~ . , data = prob, size = 10) #노드 10개
r1 <- predict(m1, prob)
head(r1)

cbind(prob$accident, r1 > 0.5)
sum(as.numeric(r1 > 0.5) != prob$accident2)

#같은 방법, 다른 패키지
library(neuralnet)
install.packages("neuralnet")
xnam <- paste0("ans", 1:30)
fmla <- as.formula(paste("accident2 ~ ", paste(xnam, collapse = "+")))
m2 <- neuralnet(fmla, data = prob, hidden = 10)
plot(m2)
