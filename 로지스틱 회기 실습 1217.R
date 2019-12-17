# 로지스틱 회귀 실습
# 로지스틱 회귀는 무조건 'Y'값이 '범주형'이어야 함.


install.packages("aod")
library(aod)
library(ggplot2)
# view the first few rows of the data
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata) # 데이터의 대략적인 분포 확인 
summary(mydata) # 데이터 구조 확인
str(mydata) # 변수별 표준편차 확인
sapply(mydata, sd) # contingency table : xtabs(~ x + y, data)



# ~이면 y가 없음. 분류된 각각의 값이 Y
xtabs(~admit+rank, data=mydata)



# admit: 합격, 불합격 여부
# glm(): 범주형으로 되어 있는 admit의 확률을 구하기 위해 사용
# 반드시 팩터형으로 변경
mydata$rank <- factor(mydata$rank)



# 회귀분석 요청
mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
summary(mylogit)



# 다중 로지스틱 회귀

require(foreign)
require(nnet)
require(ggplot2)
require(reshape2)

m1 <- read.dta("http://stats.idre.ucla.edu/stat/data/hsbdemo.dta")
m1


# 오즈, 오즈비


