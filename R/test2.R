# kmeans对iris进行聚类分析 

iris2<-iris[,1:4]
iris.kmeans<-kmeans(iris2,3)
iris.kmeans

table(iris$Species,iris.kmeans$cluster)

plot(iris2$Sepal.Length,iris2$Sepal.Width,col=iris.kmeans$cluster,pch="*")

points(iris.kmeans$centers,pch="X",cex=1.5,col=4)

#---基于密度的聚类分析
library(fpc)
iris2<-iris[-5]
ds<-dbscan(iris2,eps=0.42,MinPts = 5)
table(ds$cluster,iris$Species)

#打印出ds和iris2的聚类散点图
plot(ds,iris2)