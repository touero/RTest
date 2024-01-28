library(dplyr)
data(airquality)
dim(airquality)
library(VIM)
aggr(airquality,prop=FALSE,numbers=TRUE)
x <- as.data.frame(abs(is.na(airquality)))
head(x,10)
y <- x[which(apply(x, 2, sum)>0)]
cor(y)
airquality[complete.cases(airquality),]
a <- na.omit(airquality )