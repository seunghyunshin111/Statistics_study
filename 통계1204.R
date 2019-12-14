# 만 7세 남자 어린이의 키의 평균이 1220mm 라는 기존에 알려진 모수의 상태를
# 현재에도 받아들일 수 있는지 알아봅시다. 

# 모수의 참값을 구하는 것이 아니라 모수의 상태가 

xdata <- c(1196, 1340, 1232, 1184, 1295, 1247, 1201, 1182, 1192, 1287, 1159,
           1160, 1243, 1264, 1276)
t.test(xdata, mu=1220)


binom.test(c(136, 14), p = 0.8)
binom.test(c(136, 14), p = 0.8, alternative = "two.sided", conf.level = 0.95)



setwd("C:/Rwork")
# setwd("C:\\Rwork)
data = read.csv("one_sample.csv", head = TRUE)
head(data)
x = data$survey
str(x)
#class(x)
summary(x) # 만능함수 ( NA 결측치가 있는지 없는지 확인할 때)
table(x)  
#= summary(as.factor(x))
summary(data)
data$survey <- as.factor(data$survey)
summary(data)

#install.packages("prettyR")
library(prettyR)
freq(x)

# 양측검정 H0: 만족비율이 80%이다. , H1:대립가설은 만족비율이 80%가 아니다.

# 단측검정(크다, 작다), H0: 만족비율이 80%이다. ,
#크다-> **H1: 대립가설이 80% 이상이다,   작다-> H1: 대립가설이 80% 이하다.


binom.test(c(136, 4), p = 0.8) # 아무것도 설정x면, 양측검정

?binom.test

binom.test(c(136, 14), p = 0.8, alternative = "greater", conf.level = 0.95)

# alternative = "greater" 대립가설이 크다라고 적용되어 있는 상태.
# conf.level = 0.95 ; 기본 값으로 설정. 바꾸고 싶으면 conf.level 지정! 

binom.test(c(14, 136), p = 0.2, alternative = "less", conf.level = 0.95)
# 불만율이 20% 미만인 것을 알고 싶어요.
# H0: 14가 20%다.   -> p-value가 0.05 이하이기 때문에 H1 채택.
# H1: 14가 20% 미만이다. 
# 오직 두가지만 있으면 첫번째가 20%에 속하는지(14가 20%에 속하는지)
# alternative 설정 -> 단측검정만.


#Class_code

setwd("C:\\rwork\\Part-III")
data<-read.csv("one_sample.csv", head=TRUE)
head(data)
x<-data$survey
data$survey<-as.factor(data$survey)
summary(data)

install.packages("prettyR")
library(prettyR)
freq(x)
#양측검정 H0:만족비율이 80%이다., 대립가설 만족비율이 80%가 아니다.
#단측검정(크다. 작다) H0:만족비율이 80%이다. H1 : 만족비율이 80% 이상이다. 
binom.test(c(136,14),p=0.8)

binom.test(c(136,14), p=0.8, alternative="greater", conf.level = 0.95)
binom.test(c(14,136), p=0.2, alternative="less", conf.level = 0.95)











