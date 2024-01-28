data(iris)
head(iris)
library(dplyr)
library(sqldf)
iris$id <- c(1:nrow(iris))
iris_train <- sample_frac(iris, 0.7, replace = TRUE)
iris_test <- sqldf("
               select *
               from iris
               where id not in (
               select id
               from iris_train
               )
               ")
iris_train <- iris_train[,-6]
iris_test <- iris_test[,-6]
iris_train_pca <- princomp(iris_train[,1:4])
screeplot(iris_train_pca, npcs = ncol(iris_train),type="lines")
summary(iris_train_pca)
iris_train_pca$loadings
