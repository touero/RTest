states<- as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])#导入数据集
fit <- lm(Murder ~ Population+Illiteracy+Income+Frost,data = states)
summary(fit)
par(mfrow=c(2,2))
plot(fit)
