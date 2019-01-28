library(HistData)
data(Galton)
x <- Galton$child
mean(x)
median(x)
sd(x) #standard deviatiom

# Our dataset has normal distribution so therefore we will add an outlier as an error, that has height without decimal point
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
# Lets calculate mean after adding an outlier
mean(x_with_error)
#difference of means
mean(x_with_error) - mean(x)
# increase in mean
#difference of SD
sd(x_with_error)
sd(x_with_error) - sd(x)
#increase in the standard deviation
#In the previous exercises we saw how one mistake can have a substantial effect on the average and the standard deviation.
#Now we are going to see how the median and MAD are much more resistant to outliers. 
#For this reason we say that they are robust summaries.
median(x_with_error)
median(x_with_error) - median(x)
# To use exploratory data analysis to detect that an error was made,
# we can use histogram or boxplotting to detect outliers

#Let's create a function
x <- Galton$child
error_avg <- function(k){
  x_with_error <-x
  x_with_error[1] <- k
  return(mean(x_with_error))
}

error_avg(10000)
error_avg(-10000)
# Notice how changing a single value to a large outlying value can have a large effect on the mean.