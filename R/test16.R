#导入数据
dat <- read.csv("",header = FALSE)
#将读入数据转化为向量
dat <-as.vector(dat[,1])
#1912-1917年气温时间序列
dat<-nhtemp
#转化为时间
is.ts(dat)
#min最小年限
ts(dat,start = min(202005))
plot.ts(dat,xlab = '时间', ylab = '气温', col = 'blue')
install.packages('forecast')
library(forecast)
#纯随机性HO：白噪声
#看的是六阶
Box.test(dat,type = 'Ljung-Box',lag = 6)
#循环看到十二阶
for (i in 1:6){
  print(Box.test(dat,type = 'Ljung-Box',lag = 2*i ))
}
#单位根检验H0：非平稳
install.packages('fUnitRoots')
library(fUnitRoots)
unitrootTest(dat)
#差分
dat1 <- diff(dat)
#看一下差分后的散点图
plot.ts(dat1,xlab ='时间',ylab = '气温',type='o',col='blue')
par(mfrow=c(1:2))
acf(dat1)
acf(dat1,plot = FALSE)
pacf(dat1)
pacf(dat1,plot = FALSE)
#系统自动为您推荐模型
auto.arima(dat1,trace=T)
#模型参数估计
model <- arima(dat1,order=c(0,0,1),method = 'ML')
model
#x3 = a*x1+b*y2+e
accuracy(model)
#模型评价
qqnorm(model$residuals,col = 'red')
qqline(model$residuals,col = 'blue')
Box.test(model$residuals,type = 'Ljung-Box')
#预测
pre1<- forecast(model,h=10,level=c(99.5))
pre1
plot(forecast(model,h=10,level=c(99.5),xlab ='时间',ylab = '气温'))
