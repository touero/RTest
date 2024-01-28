
#ts方法构建时间序列
a<-ts(1:30,frequency = 12,start = c(2011,3))
print(a)

str(a)
attributes(a)

#在ts函数的参数中，1：30代以1-30为基础建立30个时间序列值，frequence=7代表以周循环，=12代表以月循环，=4代表以季度循环
#start 代表起始的日期

#将时间序列拆分成趋势成分、季节成分、随机成分
#所谓的趋势成分是指长时间间隔的大体运动方向，季节成分是指季节性的变化，随机成分是指重复但非周期的波动，最终是随机成分
#R自带的AirPassengers中很好演示了时间序列
plot(AirPassengers)
install.packages("tseries")
install.packages("forecast")
library(tseries)
library(forecast)
#同样可以使用tsdisplay函数显示ACF和PACF图，用来确定arima函数的参数
tsdisplay(AirPassengers)
#使用decompose()函数将其拆分为不同成分
dc<-decompose(AirPassengers)

#打印出四种趋势图
plot(dc)

#打印出关于季节性趋势的图表
season<-dc$figure
plot(season,type = "b",xaxt="n",xlab = "")

#构建arima模型，我们首先使用forcast包里的auto.arima进行参数估计，然后再使用arima
a<-auto.arima(AirPassengers)
print(a)
# > print(a)
# Series: AirPassengers 
# ARIMA(2,1,1)(0,1,0)[12] 
# 
# Coefficients:
#   ar1     ar2      ma1
# 0.5960  0.2143  -0.9819
# s.e.  0.0888  0.0880   0.0292
# 
# sigma^2 estimated as 132.3:  log likelihood=-504.92
# AIC=1017.85   AICc=1018.17   BIC=1029.35


fit<-arima(AirPassengers,order = c(2,1,1),seasonal = list(order=c(0,1,0),period=12))
print(fit)
fore=predict(fit,n.head=24)
U<-fore$pred+2*fore$se
L<-fore$pred-2*fore$se
ts.plot(AirPassengers,fore$pred,U,L,col=c(1,2,4,4),lty=c(1,1,2,2))

install.packages("urca")
library(urca)
ur.df(AirPassengers)
