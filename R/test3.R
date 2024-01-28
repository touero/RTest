library(ggplot2)
str(diamonds)    # diamonds是ggplot2里的数据集
summary(diamonds)
plot(density(diamonds$price), main = "Distribution of Diamond Price")
polygon(density(diamonds$price), col = "pink")  # polygon()用于曲线内填充颜色
abline(v = 2400, lwd = 3, col = "skyblue")  # abline（a, b）表示在图上添加一条y=a+bx的直线
diamonds$isExpensive <- diamonds$price > 2400
summary(diamonds$isExpensive)
set.seed(1)
isTest <- runif(nrow(diamonds)) > 0.70  
#生成和样本数量相同的[0, 1]的均匀分布随机数
train <- diamonds[isTest == F, ]
test <- diamonds[isTest == T, ]
fit1 <- glm(isExpensive ~ cut, data = train, family = binomial())
prob1 <- predict(fit1, newdata = test, type = "response")

# type = "link", 缺省值，给出线性函数预测值 
# type = "response", 给出概率预测值
# type = "terms"，给出各个变量的预测值

library(ROCR)     # ROCR包提供多种评估分类执行效果的方法及可视化


pred1 <- prediction(prob1, test$isExpensive)  # 转换prob1的格式
performance(pred1, "auc")@y.values[[1]]
fit2 <- glm(isExpensive ~ clarity, data = train, family = binomial())
prob2 <- predict(fit2, newdata = test, type = "response")
pred2 <- prediction(prob2, test$isExpensive)
performance(pred2, "auc")@y.values[[1]]
plot(performance(pred1, "tpr", "fpr"), colorize = T, lwd = 3, main = "ROC Curves")
plot(performance(pred2, "tpr", "fpr"), add = T, colorize = T, lwd = 3)
plot(performance(pred3, "tpr", "fpr"), add = T, colorize = T, lwd = 3)
abline(a = 0, b = 1, lty = 2, lwd = 3, col = "black")