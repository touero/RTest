#环境变量
rm(list = ls());#清空变量空间

#载入所需R Rackages
library(rattle)
library(rpart)
library(rpart.plot)
library(RWeka)
library(party)
library(partykit)
library(C50)
library(export)

#--------------------------------------
# 数据导入与预处理
#--------------------------------------
#载入内嵌数据
dataname <- "iris"

#载入预处理后的洁净数据
puredata <- datasets::iris

#获取数据集列数-->class.id
idcol.y <- ncol(puredata)

#--------------------------------------
# 划分训练集、测试集、验证集
#--------------------------------------
set.seed(1010) #随机抽样设置种子
(id.train<-sample(nrow(puredata),0.7*nrow(puredata))) #抽样函数
ds.train <- puredata[ id.train,] #生成训练集
ds.test  <- puredata[-id.train,] #生成测试集


#--------------------------------------
#    > 2 <  【 ID3算法 】 
#    using 'rpart' package
#--------------------------------------
if( ! require('rpart'))
  install.packages('rpart')
library(rpart)

model.ID3 <- rpart( Species~., 
                    data=ds.train, 
                    method="class", 
                    parms=list(split="information")) #使用ID3算法时候, split = “information”
printcp( model.ID3 )
#绘制决策树图形
#rpart.plot( model.ID3, branch=1, type=1, fallen.leaves=T, cex=1, sub="决策树模型-ID3")
#fancyRpartPlot更漂亮些，library(rattle)
fancyRpartPlot( model.ID3, 
                main = paste("ID3 of", dataname, "\n(", Sys.time(),")", sep = " "), 
                sub = "zhengcf@ysu.edu.cn")
#导出决策树至PNG文件
graph2png(file = paste("ID3 of", dataname))
#利用预测集进行预测
pred.ID3 <- predict(model.ID3, 
                    newdata=ds.test, 
                    type="class")   #利用预测集进行预测
pred.ID3
length(pred.ID3)
#输出混淆矩阵
table( ds.test$Species, pred.ID3, dnn=c("真实值","预测值") )    #输出混淆矩阵



#--------------------------------------
#    > 1 < 【 CART算法 】
#    using 'rpart' package
#--------------------------------------
if( ! require('rpart'))
  install.packages('rpart')
library(rpart)
model.cart<-rpart(Species ~., 
                  data=ds.train, 
                  method="class", 
                  parms=list( split="gini" ) ) # 使用CART算法的时候, split = “gini”
printcp( model.cart )
#绘制决策树图形
#rpart.plot( model.cart, branch=1, type=2, fallen.leaves=F, cex=1, sub="决策树模型-CART")
#fancyRpartPlot更漂亮些
if( ! require('rattle'))
  install.packages('rattle')
library(rattle)
fancyRpartPlot( model.cart, 
                main = paste("CART of", dataname, "\n(", Sys.time(),")", sep = " "), 
                sub = "zhengcf@ysu.edu.cn")
#导出决策树至PNG文件
graph2png(file = paste("CART of", dataname))

#利用预测集进行预测
pred.cart <- predict( model.cart, 
                      newdata=ds.test, 
                      type="class" )   
#预测结果输出
pred.cart
length( pred.cart )
#输出混淆矩阵
table( ds.test$Species, pred.cart, dnn=c("真实值","预测值") )    #输出混淆矩阵