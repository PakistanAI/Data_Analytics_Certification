library(tidyverse)
str(mtcars)
?mtcars
ggplot(data=mtcars, aes(x=cyl, y=mpg)) + geom_point()
# cyl is of factorial natura but ggplot treated it as a continous variable, where 5 or 7 cylinder are being part of the trend while they are not, giving wrong impression
# We would have to explicitly tell that cyl is a categorical variable using the factor function

ggplot(data=mtcars, aes(x=factor(cyl), y=mpg)) + geom_point()
# the x-axis will now only contain the values that are present in the data set(factors)

# use of color, size and shape from aesthetics mapping
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point() #plotting miles per gallon against weight
#categorize the plots with displacement of the car using colors
ggplot(data=mtcars, aes(x=wt, y=mpg, color=disp)) + geom_point() #legend automatically generated
#categorize the plots with displacement of the car using size
ggplot(data=mtcars, aes(x=wt, y=mpg, size=disp)) + geom_point()
#Let's try it with shape, it will give an error, shape doesnt scale on a continous scale
ggplot(data=mtcars, aes(x=wt, y=mpg, shape=disp)) + geom_point()

#Diamond dataset
str(diamonds)
#try running ggplot without adding any layer
ggplot(data=diamonds, aes(x=carat, y=price))
#plot price against carat using geom_point()
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point()
#plot by adding geom_smooth (common combination)
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth()
# We just combined two layers together geom_smooth adds smooth line to the line based on the points plotted
#add plotting with just smooth line
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_smooth()
#add color property in aesthetics mapping with variable clarity
ggplot(data=diamonds, aes(x=carat, y=price, color=clarity)) + geom_smooth()
#add color property with geom_point only
ggplot(data=diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()
#add alpha property, making it 40% visible and 60% transparent
ggplot(data=diamonds, aes(x=carat, y=price, color=clarity)) + geom_point(alpha=0.4)
#ggplot object can be saved and reused
dia_plot <- ggplot(data=diamonds, aes(x=carat, y=price))
#add color property to geom layer directly through aes()
dia_plot + geom_point(aes(color=clarity))
#plotting with geom_smooth()
dia_plot + geom_smooth(aes(color=clarity))
#plotting geom_smooth() without error shading
dia_plot + geom_smooth(aes(color=clarity), se=FALSE)

#Iris dataset
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_point(aes(x = Petal.Length, y = Petal.Width), col = "red")
#notice the legend is not shown, this is a bad approach of using ggplot2,
#because we are using two variables for each axis




