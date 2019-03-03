library(ISLR) # for data set
library(class) # for KNN

# This data set includes 85 predictors that measure demographic characteristics for 5,822 individuals. The response variable is
#Purchase , which indicates whether or not a given individual purchases a
#caravan insurance policy
dim(Caravan) 
attach(Caravan)
data(Caravan)
summary(Purchase)
348/5822   # only 6% of people actually purchase insurance


# for K-NN, we need standardized data, as discussed!
standardized.X=scale(Caravan[,-86])
var(Caravan[,1])
var(Caravan[,2])
var(standardized.X[,1])
var(standardized.X[,2])
test=1:1000
train.X=standardized.X[-test,]
test.X=standardized.X[test,]
train.Y=Purchase[-test]
test.Y=Purchase[test]
set.seed(1)

knn.pred=knn(train.X,test.X,train.Y,k=1)  # KNN model!
mean(test.Y!=knn.pred)
mean(test.Y!="No")
table(knn.pred,test.Y)
9/(68+9)

knn.pred=knn(train.X,test.X,train.Y,k=3)
table(knn.pred,test.Y)
5/26
knn.pred=knn(train.X,test.X,train.Y,k=5)
table(knn.pred,test.Y)
4/15
