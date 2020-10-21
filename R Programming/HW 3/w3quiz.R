library(datasets)
data(iris)

# There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' 
# for the species virginica? Please round your answer to the nearest whole number.


tapply(iris$Sepal.Length, iris$Species, mean)

apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)

# How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
tapply(mtcars$mpg, mtcars$cyl, mean )
sapply(split(mtcars$mpg, mtcars$cyl), mean)
##apply(mtcars, 2, mean)

dif<- tapply(mtcars$hp,mtcars$cyl, mean)
