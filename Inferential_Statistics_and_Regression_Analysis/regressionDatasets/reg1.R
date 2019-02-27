# to configure R kernel for jupyter notebooks ####

install.packages("IRkernel")
IRkernel::installspec()

# basic analysis of computer repair dataset ####

# read in file as dataframe
df_computerRepair <- read.table("computerRepair.txt", header = TRUE)

# plot Minutes against Units
with(df_computerRepair, plot(Units, Minutes))
# same as:
plot(df_computerRepair$Units, df_computerRepair$Minutes)
# same as well:
with(df_computerRepair, plot(Minutes ~ Units))

# correlation coefficient:
with(df_computerRepair, cor(Units, Minutes))
# gives same if Units and Minutes are switched around.
with(df_computerRepair, cor(Minutes, Units))

# model fit
lm_compRepair <- lm(Minutes ~ Units, data = df_computerRepair)
# model output summary
summary(lm_compRepair)

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

# least squares line estimation demo ####
# required package. Don't need to run if package is installed
install.packages("manipulate")
library(manipulate)
# first run the following line by pressing Ctrl + enter when cursor is on it
myPlot <- function(beta){
  y <- galton$child - mean(galton$child)
  x <- galton$parent - mean(galton$parent)
  freqData <- as.data.frame(table(x, y))
  names(freqData) <- c("child", "parent", "freq")
  plot(
    as.numeric(as.vector(freqData$parent)), 
    as.numeric(as.vector(freqData$child)),
    pch = 21, col = "black", bg = "lightblue",
    cex = .15 * freqData$freq, 
    xlab = "parent", 
    ylab = "child"
  )
  abline(0, beta, lwd = 3)
  points(0, 0, cex = 2, pch = 19)
  mse <- mean( (y - beta * x)^2 )
  title(paste("beta = ", beta, "mse = ", round(mse, 3)))
}
# After running line 60, run the next
manipulate(myPlot(beta), beta = manipulate::slider(0.4, .8, step = 0.02))