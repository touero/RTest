rvest包抓取网页内容

library("rvest")
url <- 'https://www.thepaper.cn/'
web <- read_html(url)
news <- web %>% html_nodes('h2 a')
title <- news %>% html_text()
link <- news %>% html_attrs()
link1 <- c(1:length(link))
for(i in 1:length(link))
{
  link1[i] <- link[[i]][1]
}
link2 <- paste("https://www.thepaper.cn/",link1,sep ="")
news_content <- c(1:length(link2))
for(i in 1:length(link2))
{
  news_content[i] <-  read_html(link2[i]) %>% html_nodes('div.news_txt') %>% html_text()
}
news_01 <- data.frame(title,url=link2,news_content)
write.csv(news_01,file = "C:\\Users\\WeiEnsong\\Desktop\\data.csv")
