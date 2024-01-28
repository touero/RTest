library("leafletCN")
regionNames("桂林市")
library(rgeos)
demomap("china")
demomap("桂林市")
pal <- substr(rainbow(17),1,7)  #颜色，彩虹色
dat = data.frame(name = regionNames("桂林市"),
                 value = 1:34)
geojsonMap(dat,"桂林市",pal=pal,fillOpacity = 0.2)
leaflet() %>%
amap() %>%  
addMarkers(lng=108.296367, lat=22.844154 ,popup="广西大学")
iconList = awesomeIconList(
  "home" = makeAwesomeIcon(icon = "home",markerColor = "skyblue"),
  "weixin" = makeAwesomeIcon(icon = "cutlery",markerColor = "red"),
  "bank" = makeAwesomeIcon(icon = "plus-sign",markerColor = "orange"),
  "automobile" = makeAwesomeIcon(icon = "trash",markerColor = "purple"),
  "coffee" = makeAwesomeIcon(icon = "book")
)
geo = data.frame(lon = rep(108.296367, 5),
                 lat = rep(22.844154, 5),
                 city = rep("广西", 5))
geo$lon = geo$lon+rnorm(5,0,0.003)
geo$lat = geo$lat+rnorm(5,0,0.003)
geo$type = c("home",
             "weixin",
             "bank" ,
             "automobile", 
             "coffee" )
leaflet(geo) %>% amap() %>%
addMiniMap() %>% 
addAwesomeMarkers(icon = ~iconList[type])

