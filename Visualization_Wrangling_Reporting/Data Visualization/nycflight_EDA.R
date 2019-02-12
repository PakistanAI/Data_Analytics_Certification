#are we making any assumptions about DS weekends?

#Calling all the libraries
library(dplyr)
library(tidyverse)
library(statsr)

data(nycflights)
View(nycflights)

# names of the variables
names(nycflights)

#dimensions of the dataframes
str(nycflights)

#**********Question 1******************
#' 1. Is there any correlation between the departure delays and the time of the year when flights get delayed?
#'For this we will find the patterns in the month 
#'and calculate the average values of the departure delays for each month. 
#'We will first plot the histogram and boxplot of the departure delay to see the distribution.
# Plotting a histogram 
width <- diff(range(nycflights$dep_delay))/max(nycflights$dep_delay)
ggplot(data=nycflights, aes(x = dep_delay )) + geom_histogram(binwidth = width)

# Do we see the extreme value visibly?
ggplot(data = nycflights, aes(x = dep_delay)) + geom_histogram(binwidth = width) + ylim(c(0,50)) + xlim(c(-50,1500))

# mean of dep_delay
nycflights %>% summarise(mean_dd = mean(dep_delay))

# Summarise median of dep_delay
nycflights %>% summarise(median_dd = median(dep_delay))

# Visualization of boxplot with dep_delay
ggplot(data = nycflights, aes(x = "", y = dep_delay)) + geom_boxplot()

# To understand the distribution of the departure delays accross months we will visualize side by side box plots.
min_dd =min(nycflights$dep_delay)
ggplot(nycflights, aes(x = factor(month), y = dep_delay)) + geom_boxplot()
ggplot(nycflights, aes(x = factor(month), y = dep_delay)) + geom_boxplot() + ylim(c(min_dd,500))

# Lets summarize the mean of the departure delays grouped by month.
nycflights %>% group_by(month) %>% summarise(mean_dd = mean(dep_delay)) %>% arrange(desc(mean_dd))

# Lets summarize the median of the departure delays grouped by month.
nycflights %>% group_by(month) %>% summarise(median_dd = median(dep_delay)) %>% arrange(desc(median_dd))

# Lets create a new variable to add in our data frame to determine if the departed flight took off on-time or was delayed.
# Why do we need to caluate proptions?
nycflights <- nycflights %>% mutate(dep_type = ifelse(dep_delay < 5, 'on-time', 'delay'))

# Before we said that highest means of departure delays lies in the July/June, 
# we can use the on time departure rate to evaluate the proportions of the dep_type with months.
nycflights %>% group_by(month) %>% summarise(ot_dep_rate = sum(dep_type == 'on-time')/ n()) %>% arrange(desc(ot_dep_rate))

#**********Question 2******************

# Can the airport origin have an association with the departure rate of the departing flights?
# Lets calculate the on-time departure rate the flights grouped by origin that reperesents the three major airports in the New York City.
nycflights %>% group_by(origin) %>% summarise(ot_dep_rate = sum(dep_type == 'on-time')/ n()) %>% arrange(desc(ot_dep_rate))

#We can also visualize the distribution of the on-time departure rate accross the three airports using the segmented bar plot.
ggplot(nycflights, aes(x = origin, fill = dep_type)) + geom_bar()

#**********Question 3******************
#Is there any correlation between the arrival delays and the speed of the airplanes for the flights?
#We will first see the distribution of the arrival delays.
arr_width <- diff(range(nycflights$arr_delay))/max(nycflights$arr_delay)
ggplot(data = nycflights, aes(x = arr_delay)) + geom_histogram(binwidth = arr_width)

#21. Summarise mean of arr_delay
nycflights %>% summarise(mean_ad = mean(arr_delay))

#22. Summarise median of arr_delay
nycflights %>% summarise(median_ad = median(arr_delay))

#23. Create avg_speed
nycflights <- nycflights %>% mutate(avg_speed = distance/air_time)

#24. Scatter plot out of curiosity
ggplot(data = nycflights, aes(x = avg_speed, y = distance)) + geom_point()

#25.Now we compare the speed with the arrival delay
breaks_speed <- c(0, 3, 6, 9, 12)
bins_avg_speed <- cut(nycflights$avg_speed, breaks_speed)
ggplot(data = nycflights, aes(x = bins_avg_speed, y = arr_delay)) + geom_boxplot()

#The same thing for distance
breaks_distance <- c(0, 1000, 2000, 3000, 4000, 5000)
bins_distance <- cut(nycflights$distance, breaks_distance)
ggplot(data = nycflights, aes(x = bins_distance, y = arr_delay)) + geom_boxplot()



