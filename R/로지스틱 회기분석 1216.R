# 로지스틱 회귀분석

data(iris)
d <- subset(iris, Species == 'virginica' | Species == 'versicolor')
str(d)
head(d)

# m <- glm(종속변수 y ~ )
?glm


# binomial: 이항분포
m <- glm(Species ~., data = d, family = 'binomial')


summary(m)
m


# 적합한 모델 정보 피팅해줌
fitted(m)[c(1:5, 51:55)]
as.numeric(d$Species)


# 0 ~ 1 (실패할 확률 대비 성공 확률)
# vergicolor = 2, virginica = 3
f <- fitted(m)

#
fm <- ifelse(f >.5, 1, 0)

# 버지니카가 1이 될 확률 리턴 받기
is_correct <- ifelse(f > .5, 1, 0) == (as.numeric(d$Species) - 2)
head(is_correct)


# 98: 정확도 98% 
sum(is_correct)

as.numeric(d$Species) - 1



