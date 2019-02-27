# To run a command, simply bring the cursor (the blinking white vertical line)
# on the line containing the start of that command, and press Ctrl+enter (together)

# install necessary packages
install.packages(c('bindrcpp', 'tidyverse', 'UsingR', 'statsr', 'swirl',
                   'car', 'manipulate', 'plotly', 'spatstat.utils', 'Hmisc'))

# most of you would have most of these packages already installed.
# just check in the packages tab in the bottom-right section of the
# IDE to see which are not installed

# load in computer repair dataset. The following command assumes that your 
# working directory is the folder that contains the 'regressionDatasets' folder
# to set the working directory use this command: setwd('path/to/your/desired/folder')
df_computerRepair <- read.table("regressionDatasets/computerRepair.txt", 
                                header = TRUE)

# to take a look at the dataset (only in Rstudio)
View(df_computerRepair)

# There is some variability in Minutes. We can take a brief look at summaries
# with:
boxplot(df_computerRepair$Minutes)

# There is also variability in Units:
boxplot(df_computerRepair$Units)
# to see distribution:
hist(df_computerRepair$Units)

# To see visually if there is any relationship between the variability in both
# we can make a scatterplot with base R graphics, plotting Minutes (on y-axis) 
# against Units (on x-axis)
with(df_computerRepair, plot(Minutes ~ Units))

# to get the correlation coefficient
with(df_computerRepair, cor(Minutes, Units))
with(df_computerRepair, cor(Units, Minutes)) # is the same

# fit linear model and store in lm_computerRepair
lm_computerRepair <- lm(Minutes ~ Units, data = df_computerRepair)

# get summaries of model
summary(lm_computerRepair)

# take a look at the fitted values, and residuals at each fit
lm_computerRepair$fitted.values
lm_computerRepair$residuals

# to arrange fitted values and residuals as columns with the original dataframe,
# and storing the new dataframe as df_computerRepair_extended
df_computerRepair_extended <- cbind(df_computerRepair, lm_computerRepair$fitted.values, 
                                    lm_computerRepair$residuals)
View(df_computerRepair_extended)

# Use the model to make predictions
predict(lm_computerRepair, data.frame(Units = 4)) # using a value of Units already in the data the model was fit on
# using a value not in the training sample. We have to be careful that such a
# value should not be far from the range of values in the training data
predict(lm_computerRepair, data.frame(Units = 11)) 

# The Newspaper problem. A newspaper agency hired you to assess if it is feasible
# for them to start a Sunday edition. Here's your dataset that contains data for
# 34 newspapers, about their daily sales, and Sunday sales, in thousands of dollars
df_newsPapers <- read.table("regressionDatasets/newspapersData.txt",
                            header = TRUE)
# oops. This command used to work before. Not working now. let's take a look at
# the contents of the file
head(readLines("regressionDatasets/newspapersData.txt"))
# the readLines function reads in a file with each new line as an element of a
# vector. The head command prints out the first 6 (default, can be changed) lines
# of the vector returned. We see the values separated with a \t. That is the tab
# character. computers are dumb. You are smart. You tell them to read values
# between the tab characters as separate values like this
df_newsPapers <- read.table("regressionDatasets/newspapersData.txt",
                            header = TRUE, sep = "\t")
# repeat all the preliminary stuff you did with the computerRepair data here again

# model again
lm_newsPapers <- lm(Sunday ~ Daily, data = df_newsPapers)
summary(lm_newsPapers)

# we learned how to extract confidence intervals for the calculated coefficients
confint(lm_newsPapers)

# having confidence intervals for coefficients inherently means that there should
# be a confidence interval for the prediction as well. The predict function used
# above returns a prediction, but it can also give a prediction interval if you
# provide the required arguments. use the ?predict command to see it's documentation
# and figure out how to do it. Remember: You're smart.
# The particular newspaper that is considering a Sunday edition has a daily circulation 
# of 500,000. Provide an interval estimate (based on 95% level) for the predicted Sunday 
# circulation of this paper.
predict(lm_newsPapers, data.frame(Daily = 500), 
        interval = "prediction")

# Supervisor performance analysis
df_superVisor <- read.table('regressionDatasets/supervisorPerformance.txt', header = TRUE)
# variable definitions
# Y: Overall rating of job done by supervisor (our response variable)
# X1: Handles employee complains
# X2: Does not allow special priviliges (I had to look up if it's spelled 
# previlige or privilige. Study hard or you'll end up like me)
# X3: Opportunity to learn new things
# X4: Raises based on performance
# X5: Too critical of poor performance
# X6: Rate of advancing to better jobs
