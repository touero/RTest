library(tibble,ggplot)
dt <- as_tibble(data(iris))
dt %>% filter(Sepal.Length >=5,Petal.Length >=2) %>%
  group_by(Species) %>% filter(Species=="virginica") %>%
ggplot(aes(Sepal.Length,Petal.Length))+
dt %>% group_by(Species) %>% 
  summarize(m = mean(Sepal.Length,na.rm=T))



