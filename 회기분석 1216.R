# 회기분석

setwd("c:/Rwork/data")
m <- lm(dist~speed, data=cars)
summary(m)


par(mfrow = c(2, 2), mar = c(2, 2, 2, 2))
plot(m)

'''
Residuals vs Fitted : 양호한 편
-> 0에 가까울수록 좋은 것. 

Normal Q-Q
-> 좋은편

Residuals vs Leverage
-> 평균에 가까운 애들은 0에 가깝게 나옴(잔차에 영향력이 없음)
-> 우측으로 갈수록(Distance가 뒤로 갈 수록) 오차가 큰 애들을 말함.  : 오차의 영향력이 크다.
-> 정규분포의 영향력(우측 상단의 빨간색)
-> 거리로 따졌을 때, 왼쪽에 몰려있는 모델이 괜찮은 모델.(오차가 적음)
'''


# 더벤 왓슨 d = 2(p = 0: 상관관계 없음), 보통 d = 1~3 정상판
install.packages("lmtest")
library(lmtest)
dwtest(m)
























