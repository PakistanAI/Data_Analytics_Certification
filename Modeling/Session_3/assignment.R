#### Assignment for Trees and Forest with a focus on class imbalance

## You all have to explore rpart parameters list to handle class imbalance
## FYI, there is a parameter called loss_matrix which can do this.
## A link for that: https://stats.stackexchange.com/questions/96081/how-do-i-specify-a-loss-matrix-in-rpart

install.packages("ROSE") # It has the required data set
library(ROSE)

data(hacide) # This will load two files in workspace:
             # - hacide.train: training data
             # - hacide.test: testing data

# checking columns information
str(hacide) # you should see that there are three columns
            # "cls" is the output variable

table(hacide.train$cls)  # you can see that there is a 98-2 ratio between classes. We will consider this later


# Question -1: a)  Train a decision tree model.

## your code here


# Question -1: b)   Test your model by first using predict function and then check accuracy,precision and recall







# Question -2: a)  Train a Random Forest model.

## your code here


# Question -2: b)   Test your model by first using predict function and then check accuracy,precision and recall





### As you can see that results are not very good, especially recall, try to incorporte loss matrix or anything which can counter class imabalance
# Question -3: a)  Train a decision tree model with an additional loss matrix.

## your code here


# Question -3: b)   Test your model by first using predict function and then check accuracy,precision and recall

