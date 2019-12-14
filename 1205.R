
###########단일집단 평균검정(단일표본 T검정)
###########단일 집단의 평균이 어떤 특정한 집단의 평균과 차이가 있는지를 검정


setwd("c:/Rwork/")
data <- read.csv("one_sample.csv", header=TRUE)
str(data) # 150
head(data)
x <- data$time
summary(x)
head(x)


# 시계열 분석: 시간의 흐름에 따라 필요하기 때문에 무조건 NA를 지우는 것은 아님
# NA가 많을 경우 다 줄이면 데이터가 줄 수 있어서, 대체할 것이 필요.
# 패턴의 영향을 주지 않기 위해 '평균'으로 대체.
# 온도의 경우는 앞의 것을 주로 따름.

mean(x, na.rm = T)
x1 <- na.omit(x)
summary(x1)

shapiro.test(x1)
#인수에 전달된 데이터셋이 (귀무가설이 정규성을 따른다.)
# p-value가 72% 넘게 나왔기 때문! 귀무가설 채택!
# X1은 귀무가설을 따른다.

hist(x1)
# 대략적인 흐름이 정규분포 모양을 따름.

qqnorm(x1)
#Q-Q Plot: 정규성을 따르면 직선 모양이 됨. 

t.test(x1, mu = 5.2)
# t검정! mu(평균)값
# x1 이라는 데이터 표본의 모집단 평균이 5.2이다라는 가설검정.
# p-value 값이 매우 작기 때문에 기각! x1, 모집단 평균인 5.2가 아니다.


t.test(x1, mu = 5.2, alter = "greater", comf.level = 0.95)
# 극히 작음. 대립가설 선택.


###########두 집단 검정
###########독립된 두 집단 간의 비율 차이 검정과 평균 차이 검정에

setwd("c:/Rwork/data")
data2 <- read.csv("two_sample.csv", header=TRUE)
data2
head(data2) # 변수명 확인

x <- data2$method
y <- data2$survey
  
table(x)
table(y)
table(x, y)
table(x, y, useNA="ifany") # useNA="ifany" : 결측치 까지 출력


prop.test(c(110, 135), c(150, 150))
# 두 집단 이상일 때! prop.test
# 한 집단이면 binom.test
# 110/150, 135/150   150명 중에서 110 만족 A 집단 vs 135명 만족한 B집단

# p-value가 0.0005보다 작기 때문에 대립가설 채택! 
# 결론: 두 집단의 교육 만족율 차이가 있다.


prop.test(c(110, 135), c(150, 150), alter = 'two.sided')
#양측검정

prop.test(c(110, 135), c(150, 150), alter = 'greater')
# 귀무가설 선택. (110이 더 크다는 것은 잘못.)
# '둘 사이에 차이가 없다'라는 오류 발생.

prop.test(c(110, 135), c(150, 150), alter = 'less')
# 대립가설 채택.



############## 두 집단의 평균검정


data3 <- read.csv("c:/Rwork/data/two_sample.csv", header=TRUE)
data
head(data3) #4개 변수 확인
summary(data3) # score - NA's : 73개

result <- subset(data, !is.na(score), c(method, score))
# subset(데이터, 조건! 스코어가 NA가 아닌 것(행 기준), 행에서 두 변수(열)만 뽑기)
# c(method, score) : data의 전체 변수 중 두 변수만 추출
# !is.na(score) : na가 아닌 것만 추출
# subset (행 단위 추출) *가로가 원칙

head(result)

length(result$score)
a <- subset(result, method == 1)
a
b <- subset(result, method == 2)
b

length(a)  # 컬럼(열) 수
length(a$score)
length(b$score)

a1 <- a$score
b1 <- b$score
mean(a1)
mean(b1)

var.test(a1, b1)
# 두 집단의 동질성 검사!
# 귀무가설 채택: 두 집단 간 분산 값의 차이가 없다. (H0)
# p-value 오류율이 30% 입니다.


t.test(a1, b1)
# 두 집단의 평균 검정!
# 대립가설 채택: 두 집단 간 평균이 차이가 있다. (H1)


t.test(a1, b1, var.equal = F)
# Welch Two: 동질집단에 쓰더라도 결과가 달라지지 않음.

t.test(a1, b1, var.equal = T)
#



###########대응 두 집단 평균검정(대응표본 T검정)
#대응표본 평균검정((Paired Samples t-test)은동일한 표본을 대상으로 측정된
#두 변수의 평균 차이를 검정


setwd("c:/Rwork/data")
data4 <- read.csv("paired_sample.csv", header=TRUE)
head(data4)
str(data4)
summary(data4)

result <- subset(data4, !is.na(after), c(before, after))
head(result)

x <- result$before
y <- result$after
x; y

mean(x)
mean(y)

var.test(x, y, paired = T)
# 동질집단이라 공식이 약간 달라짐. (개수 평준화)
# 두 집단은 동질하다. H0


t.test(x, y, paired = T)
# H1, 차이가 있다.
# less, greater -> 더 정확한 결과가 나옴.
