load("/home/zaid/Documents/Personal/Pak.ai/Data_Analytics_Cerification_training/Session_6/case_study/data1.RData")

library(dplyr)
library(ggplot2)
library(isofor)
library(reshape2)

X <- data1$X

X=as.data.frame(X)
names(X)=c("Latency (ms)", "Throughput (mb/s)")

X%>%ggplot(aes(x=`Latency (ms)`,y=`Throughput (mb/s)`))+
  geom_point(color='blue')
XX=melt(X)


model <- iForest(X)

predict (model,X) # higher anomaly score suggests an anomaly!