
# load mtcars dataset
data(mtcars)
View(mtcars)

# count distinct levels of a categorical variable
# cars with different number of cylinders
table(mtcars$cyl)
# cars with different number of carburetters
table(mtcars$carb)

# make contingency table for each number of cylinders and carburetters
table(mtcars$cyl, mtcars$carb)
with(mtcars, table(cyl, carb))

# conduct test of independance
# cyl vs carb in mtcars
chisq.test(mtcars$carb, mtcars$cyl)

# load MASS library for dataset
library(MASS)
data("survey")

# check if the exercise and smoking habit variables are independent
table(survey$Smoke, survey$Exer)
chisq.test(survey$Smoke, survey$Exer)

# Introduction to Regression analysis
# anscombe's quartet
data("anscombe")
# configure plotting device to output 4 plots
par(mfrow = c(2, 2))
with(anscombe, plot(y1 ~ x1))
with(anscombe, plot(y2 ~ x2))
with(anscombe, plot(y3 ~ x3))
with(anscombe, plot(y4 ~ x4))

# check correlation coefficients
with(anscombe, cor(x1, y1))
with(anscombe, cor(x2, y2))
with(anscombe, cor(x3, y3))
with(anscombe, cor(x4, y4))

# fit linear models to each
lm_anscombe1 <- lm(y1 ~ x1, data = anscombe)
lm_anscombe2 <- lm(y2 ~ x2, data = anscombe)
lm_anscombe3 <- lm(y3 ~ x3, data = anscombe)
lm_anscombe4 <- lm(y4 ~ x4, data = anscombe)

# check summaries
summary(lm_anscombe1)
# repeat the same for all. Observe that the correlation coefficients, and the
# R-squared are the same for each pairs of variables. But the plots show the
# stark differences between each

# analysis of Hamilton's data ####
df_hamilton <- read.table("hamilton.txt", header = TRUE)

# plot Y against X1
with(df_hamilton, plot(X1, Y))
# plot Y against X2
with(df_hamilton, plot(Y ~ X2))

# correlation coefficients
with(df_computerRepair, cor(Y, X1))
with(df_computerRepair, cor(Y, X2))

# model fit Y ~ X1
lm_hamilton_1 <- lm(Y ~ X1, data = df_hamilton)
# model output summary
summary(lm_hamilton_1)

# model fit Y ~ X2
lm_hamilton_2 <- lm(Y ~ X2, data = df_hamilton)
# model output summary
summary(lm_hamilton_2)

# model fit Y ~ X1 + X2
lm_hamilton_3 <- lm(Y ~ X1 + X2, data = df_hamilton)
# model output summary
summary(lm_hamilton_3)