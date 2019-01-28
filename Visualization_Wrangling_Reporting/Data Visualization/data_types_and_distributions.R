#Lets start with diamonds
data(diamonds)
names(diamonds)
#you can learn about the variables using ?mtcars
#Which variables are categorical: cut, color, clarity
data(mtcars)
names(mtcars)
#is carb variable categorical / its discrete but is it ordinal? check unique value
unique(mtcars$carb)
#to get frequency counts of carb
tab <- table(mtcars$carb)
#some values are reported once which ones are they?
sum(tab[tab==1])
#the unique values are less therefrore this can be an ordinal dataset as the numberof carbs are of finite number

#===============Distributions==========
install.packages('dslabs')
library(dslabs)
data(heights)
#Get heights of male and female 
#Show them choosing from the database
male <- heights$height[heights$sex=='Male']
female <- heights$height[heights$sex=='Female']

#check type of male variable
class(male)

#check length of both variables, can check from global environment
length(male)
length(female)
#Explain percentile, explain the seq() funcion
?seq
#create a sequence for 10th, 30th, 50th, 70th, 90th
percentiles_range <- seq(0.1, 0.9, 0.2)
male_percentiles <- quantile(male, percentiles_range)
female_percentiles <- quantile(female, percentiles_range)

#Explain the concept of creating a data frame
df <- data.frame(female= female_percentiles, male=male_percentiles)

