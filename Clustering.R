# 군집화(Clustering)
# 군집화가 너무 많으면 그래프가 보기 어려워질 수 있다.
# 1000개부터 해서 조금씩 늘려보세요.
# 계층적 모델

library(ggplot2)
head(diamonds)
str(diamonds)


t <- sample(1:nrow(diamonds), 1000)
t  # 인덱스 숫자가 1000개 뽑힌다.

test <- diamonds[t, ]   # 1000건만 test에 넣고, 열은 열만큼! 
dim(test)  # (1000, 10)
test


#다시 열 추출
mydia <- test[c("price", "carat", "depth", "table")]
mydia  # subset() 


# hclust() : 계층적 군집화, 원본 데이터X, 'dist(원본데이터)' <- 매트릭스로
# dist() : 거리 매트릭스
# "ave" : average

result <- hclust(dist(mydia), method = "ave") # 거리값을 이용해서 군집화
plot(result, hang = -1)



# 비계층적 모델


