
# Bagging and Random Forests

# importing library for random forest
library(ranger)
library(MASS) # for the dataset. Boston is available in MASS library
# setting seed for reproducibilty
set.seed(1)
# train test split
train_indices <- sample(1:nrow(Boston), nrow(Boston)*0.7)
train_data <- Boston[train_indices,]
test_data <- Boston[-train_indices,]

# building random forest
bag.boston=ranger(medv~.,data=train_data,mtry=13,splitrule = "variance",importance = "permutation")
bag.boston
# prediction on test set
yhat.bag = predict(bag.boston,data=test_data)
boston.test=test_data$medv

# plotting results against actual
plot(yhat.bag$predictions, boston.test)
abline(0,1)
# Mean squared error
mean((yhat.bag$predictions-boston.test)^2)
bag.boston=ranger(medv~.,data=train_data,mtry=6,num.trees=25,splitrule = "variance",importance = "permutation")
yhat.bag = predict(bag.boston,test_data)
mean((yhat.bag$predictions-boston.test)^2)


# calculating variable importances
sort(importance(bag.boston),decreasing = TRUE)
