### Load the data for analysis ############

# http://ucanalytics.com/blogs/principal-component-analysis-step-step-guide-r-regression-case-study-example-part-4/

data<-read.csv("http://ucanalytics.com/blogs/wp-content/uploads/2016/09/Regression-Clean-Data.csv")
numeric_predictors<-c("Dist_Taxi", "Dist_Market", "Dist_Hospital", "Carpet","Builtup", "Rainfall")
Data_for_PCA<-data[,numeric_predictors]

### Initiate principal component analysis ############

if (!require("FactoMineR")) install.packages("FactoMineR")
pca<-PCA(Data_for_PCA)

### Identify the importance of each component ############

pca$eig

### Identify loading of variables on each component ############

dd<-as.data.frame(round(cor(Data_for_PCA,pca$ind$coord)^2*100,0))
dd[with(dd, order(-dd[,1])),]
