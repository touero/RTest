library(ROCR)
trIn<-c(sample(1:50,40),sample(51:100,40),sample(101:150,40))
data<-iris
traindata<-data[trIn,]
testdata<-data[-trIn,]
data$Species=as.numeric(data$Species)
install.packages("neuralnet")
library(neuralnet)
net<-neuralnet(Species~.,data=traindata,hidden=10,threshold = 0.01,err.fct = 'sse')
plot(net)
predict<-compute(net,testdata[,-5])
data.frame(预测结果=predict$net.result,真实结果=testdata[,5])

