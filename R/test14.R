data <- read.csv("C:\\Users\\WeiEnsong\\Desktop\\iris.csv",encoding="utf-8")
names(data)
library(ggplot2)
p1 <- ggplot(data,mapping = aes(x=Sepal.Length,y=Sepal.Width,colour = Species))+
  geom_point()
p2<-p1+stat_smooth(method=lm,formula=y~x)
ggplot(data, aes(x=Petal.Length)) + geom_histogram()
ggplot(data, aes(Sepal.Width, colour = Species)) +
  geom_freqpoly(binwidth = 0.5)
ggplot(data, aes(Sepal.Length, Sepal.Width)) +
  geom_line()
ggplot(data, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_boxplot()
pp <- ggplot(data, aes(1,fill=Species)) +geom_bar()
pp + coord_polar(theta = "y")
pp + coord_polar(theta = "y")
ggplot(data, aes(Sepal.Length, Sepal.Width)) + 
  geom_point() +
  facet_grid(. ~ Species )
