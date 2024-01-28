attach(mtcars);plot(mpg,wt);fm<-lm(wt~mpg)
summary(fm)
abline(fm)#加拟合曲线
coef(fm)#查截距与斜率（经济：回归系数）
resid(fm)#查残差

par(mfrow=c(2,2));plot(fm)

n<-length(mpg);res<-resid(fm);b<-coef(fm)[2];s<-sqrt(sum(res^2)/(n-2))
SE<-s/sqrt(sum((mpg-mean(mpg))^2));t<-(b-(-1))/SE;pt(t,n-2,lower.tail = FALSE)
bo<-coef(fm)[1];SEbo<-s*sqrt(sum(mpg^2)/(n*sum((mpg-mean(mpg))^2)));t<-(bo-7)/SEbo;pt(t,n-2)
predict(fm,data.frame(mpg=23))
par(mfrow=c(1,1));plot(mpg,wt);abline(fm);lines(sx,pred[,2],lty=3);lines(sx,pred[,3],lty=3)
detach(mtcars)