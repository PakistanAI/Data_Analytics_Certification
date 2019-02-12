data(mtcars)
# Lets plot cyl variable as it is a categorical variable
# but it is of numeric data type
class(mtcars$cyl)
# convert it into factor type for plotting it
mtcars$cyl <- factor(mtcars$cyl)
# check the class again now
class(mtcars$cyl)
# 1 - Map mpg to x and cyl to y
ggplot(data=mtcars, aes(mpg, cyl)) +
  geom_point()

# 2 - Reverse: Map cyl to x and mpg to y
ggplot(mtcars, aes(cyl, mpg)) +
  geom_point()

# 3 - Map wt to x, mpg to y and cyl to col
ggplot(data=mtcars, aes(wt, mpg, col=cyl)) +
  geom_point()

# 4 - Change shape and size of the points in the above plot
ggplot(mtcars, aes(wt, mpg, col=cyl)) +
  geom_point(shape=1, size=4)

# 5 - Map cyl to fill
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 1, size = 4)

# 6 - Change shape and alpha of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 21, size = 4, alpha=0.6)


# 7 - Map am to col in the above plot
mtcars$cyl <- factor(mtcars$cyl)
mtcars$am<- factor(mtcars$am)
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl, col=am)) +
  geom_point(shape = 21, size = 4, alpha=0.6)
# Notice that mapping a categorical variable onto fill doesn't change the colors,
# although a legend is generated! This is because the default shape for points only
# has a color attribute and not a fill attribute! Use fill when you have another shape (such as a bar),
# or when using a point that does have a fill and a color attribute, such as shape = 21, 
# which is a circle with an outline. Any time you use a solid color,
# make sure to use alpha blending to account for over plotting.

# Map cyl to size
ggplot(data=mtcars, aes(x=wt, y=mpg, size=cyl)) + geom_point()

# Map cyl to alpha
ggplot(data=mtcars, aes(x=wt, y=mpg, alpha=cyl))+ geom_point()

# Map cyl to shape 
ggplot(data=mtcars, aes(x=wt, y=mpg, shape=cyl)) + geom_point()

# Map cyl to label
ggplot(data=mtcars, aes(x=wt, y=mpg,label=cyl)) + geom_text()
# Which of these 4 are the clearest?
# Define a hexadecimal color
my_color <- "#4ABEFF"

# Draw a scatter plot with color *aesthetic*
ggplot(data=mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point()

# Same, but set color *attribute* in geom layer 
ggplot(data=mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point(color=my_color)

# Set the fill aesthetic; color, size and shape attributes
ggplot(data=mtcars, aes(x=wt, y=mpg, fill=cyl)) + geom_point(color=my_color, size=10, shape=23)
,# Notice that if an aesthetic and an attribute are set with the same argument,
# the attribute takes precedence. Once again, you see that the attribute needs to match the shape
# and geom, the fill aesthetic (or attribute) will only work with certain shapes.

# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(alpha=0.5)

# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(shape=25, col="yellow")

# Expand to draw text with label rownames(mtcars) and color red
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl))  + geom_text(label=rownames(mtcars), color="red")

# Presenting five dimensions of the dataset
# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(data=mtcars, aes(x=mpg, y=qsec, col=factor(cyl))) +geom_point()

# Add mapping: factor(am) onto shape
ggplot(data=mtcars, aes(x=mpg, y=qsec, col=factor(cyl), shape=factor(am))) +geom_point()

# Add mapping: (hp/wt) onto size
ggplot(data=mtcars, aes(x=mpg, y=qsec, col=factor(cyl), shape=factor(am), size=(hp/wt))) +geom_point()
