apr14 <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/uber-tlc-foil-response/master/uber-trip-data/uber-raw-data-apr14.csv")
colnames(apr14)

write.csv(apr14,"april_14.csv")


may14 <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/uber-tlc-foil-response/master/uber-trip-data/uber-raw-data-may14.csv")
jun14 <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/uber-tlc-foil-response/master/uber-trip-data/uber-raw-data-jun14.csv")
jul14 <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/uber-tlc-foil-response/master/uber-trip-data/uber-raw-data-jul14.csv")
aug14 <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/uber-tlc-foil-response/master/uber-trip-data/uber-raw-data-aug14.csv")
sep14 <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/uber-tlc-foil-response/master/uber-trip-data/uber-raw-data-sep14.csv")


write.csv(may14,"may_14.csv")
write.csv(jun14,"june_14.csv")
write.csv(jul14,"july_14.csv")
write.csv(aug14,"august_14.csv")
write.csv(sep14,"september_14.csv")


apr14 <- read.csv("april_14.csv")
may14 <- read.csv("may_14.csv")
jun14 <- read.csv("june_14.csv")
jul14 <- read.csv("july_14.csv")
aug14 <- read.csv("august_14.csv")
sep14 <- read.csv("september_14.csv")


library(dplyr)
data14 <- bind_rows(apr14, may14, jun14, jul14, aug14, sep14)

summary(data14)

library(VIM)
aggr(data14)

library(lubridate)
data14$Date.Time <- mdy_hms(data14$Date.Time)
data14$Year <- factor(year(data14$Date.Time))
data14$Month <- factor(month(data14$Date.Time))
data14$Day <- factor(day(data14$Date.Time))
data14$Weekday <- factor(wday(data14$Date.Time))
data14$Hour <- factor(hour(data14$Date.Time))
data14$Minute <- factor(minute(data14$Date.Time))
data14$Second <- factor(second(data14$Date.Time))




# applying kmeans to longitude and latitude
set.seed(20)
clusters <- kmeans(data14[,2:3], 5)
data14$Borough <- as.factor(clusters$cluster)

str(clusters)



library(cluster)
library(fpc)
#plotcluster(data14, clusters$cluster)
clusplot(data14, clusters$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)


plot(data14[,c(2:3)],col=clusters$cluster)
