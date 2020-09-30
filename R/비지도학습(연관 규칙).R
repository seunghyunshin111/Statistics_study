# 비지도 학습
# 연관 규칙

install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)
data(Groceries)
str(Groceries)

inspect(Groceries)
summary(Groceries)

# 막대그래프로 워드클라우드처럼 많이 쓰인 횟수 보여줌.
# "absolute": 몇 번 등장했는지, 횟수 확인! (원래 횟수 그대로!)
# "relative": %, 상대적인 비율로 보여줘
sort(itemFrequency(Groceries, type = "absolute",decreasing = T))
itemFrequencyPlot(Groceries, topN = 10, type = "absolute")
itemFrequencyPlot(Groceries, topN = 10, type = "relative")


# 연관성 분석 코드
apriori(Groceries) #support=0.1, confidence=0.8
result_rules<-apriori(Groceries,
                      parameter=list(support=0.005,confidence=0.5,minlen=2))
result_rules
summary(result_rules) # {lhs} --> {rhs}
inspect(result_rules[1:10])


plot(result_rules,method="graph",control=list(type="items"))
plot(result_rules, method="grouped")


