# 실습
# SVM

setwd("c:/Rwork/data/실습용데이터모음")
set1 <- read.csv("set1.csv", header = T, stringsAsFactors = F)
head(set1)
plot(set1)

#Status가 '1'이면 '중산층', 아니면  '0'

library(MASS)

# x축 food, Y축 book
density <- kde2d(set1$food, set1$book, n = 400)
head(density)
?kde2d
image(density, xlab = "food", ylab = "book")

# 가운데 평균점 근처에 모여 있는 데이터: 보통 사람 데이터


# 이를 분류하기 위해 -> SVM 사용! 
library(e1071)
# install.packages("Epi")
library(Epi)
m1 <- svm(status ~ food + book + cul + cloth + travel, type = "C-classification", data = set1)
m1
tune.svm(m1,
        
predict(m1, set1)
sum(set1$status != predict(m1, set1))

# SVM -> RBF 커널(가우시안 함수) 사용
# install.packages("kernlab")
library(kernlab)
m2 <- ksvm(status ~., kernel = "rbfdot", data = set1)
m2

sum(as.numeric(m2, cet1) > 0.5 != set1$status)


# OVA (One Versus All)
# Multi-class SVM 알고리즘; N개의 클래스가 있다면 1개와 나머지 (n-1)개 클래스의 합집합을 비교하여 선형판별경계를 구함

# OVO (Ine Versus One)
# 모든 2개의 class의 짝의 경우의 수를 구해서 선형판별경계를 구하는 방식
# 한 클래스당 총 n개의 판별경계에 해당하는 클래스에 라벨을 부여하여 OVO 방식은 2개의 클래스 간 모든 경우의 수(n(n-1)/2)만큼 만들어지는 판별 경계에 대하여 가장 많이 해당하는 클래스에 라벨을 부여하는 방식.




# 머신러닝기반의 빅데이터 분석 실전 예제
# 문제 1
# 건물에 입주해있는 상가끼리의 연관성 분석

building <- read.csv("building.csv", header = T)
head(building)
building[is.na(building)] <- 0
building <- building[-1]
building

install.packages("arules")
library(arules)

# 연관성 규칙 분석을 위해 transaction 타입으로 전환
trans <- as.matrix(building, "Transaction")
head(trans)

rules1 <- apriori(trans, parameter = list(supp = 0.2, conf = 0.6, target = "rules"))
rules1

inspect(sort(rules1))


rules2 <- subset(rules1, subset = lhs %pin% '보습학원' & confidence > 0.7)
inspect(sort(rules2))


# 라그랑지이론: 