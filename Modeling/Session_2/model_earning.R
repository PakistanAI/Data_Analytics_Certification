
library(rpart)
library(rpart.plot)
library(ROCR)

data <- read.csv("census.csv")
colnames(data)
str(data)

# setting it for reproducibility
set.seed(123)
sample_size <- floor(0.80 * nrow(data))

# random indices for split purposes
train_indices <- sample(seq_len(nrow(data)),size = sample_size)

# actual splitting
train_data <- data[train_indices,]
test_data <- data[-train_indices,]



# Building the tree model
censustree = rpart( over50k ~ . , method="class", data = train_data, control = rpart.control(minsplit = 10))
# visualize the tree
prp(censustree)

summary(censustree) # The most descriptive output, providing…
                    # CP Table
                    # Variable Importance
                    # Description of the Node and Split (including # going left or right and even surrogate splits.
                    # Can be very verbose, so print with caution
                                   
print (censustree) #  Produces a simple summary of your model at each split
path.rpart(censustree,c(1:7)) # Path of the tree

# Testing
predictTest <- predict(censustree, newdata = test_data, type = "class")
predictprob <- predict(censustree, newdata = test_data)
table(predictTest,test_data$over50k)

# calculating accuracy: (4689+745)/(4689+731+231+745)

# calculating precision: (745)/(745+731)
# calculating recall: 745/(745+231)

pred = prediction(predictprob[,2], test_data$over50k)
perf = performance(pred, "prec","rec")
plot(perf)

importances <- censustree$variable.importance
