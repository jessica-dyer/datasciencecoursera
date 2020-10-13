##Quiz 1, October 13, 2020

x <- c(4, "a", TRUE)

x <- c(1,3, 5) 
y <- c(3, 2, 10)

rbind(x, y)

x <- list(2, "a", "b", TRUE)
x[[1]]

x <- 1:4 
y <- 2:3
x+y

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>=10]<-4

##6. If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)?
x <- c(1,3, 5)  
y <- c(3, 2, 10)
rbind(x, y)

##8. Question 8 Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me? Select all that apply.
x <- list(2, "a", "b", TRUE)
x[[1]]

## 9. Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?
x <- 1:4  
y <- 2:3
x+y
class (x+y)

##10. Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this? Select all that apply.
x <- c(3, 5, 1, 10, 12, 6)
x[x<6]<-0
x[x<=5] <-0


##13. How many observations (i.e. rows) are in this data frame?
nrow(hw1_data)

##14. Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(hw1_data, 2)

##15. What is the value of Ozone in the 47th row?
hw1_data[47, 1]

hw1_data <- read_csv("C:/Users/jessd9/Desktop/quiz1_data/hw1_data.csv")

hw1_data[152:153, ]

x <- 4L
class(x)

x <- c(4, "a", TRUE)
class(x)

##16. How many missing values are in the Ozone column of this data frame?
sum(is.na (hw1_data$Ozone))

##17. What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(hw1_data$Ozone, na.rm = TRUE)

##Question 18: Extract the subset of rows of the data frame where Ozone values are above 31 and Temp 
##values are above 90. What is the mean of Solar.R in this subset?
x<- subset(hw1_data, Ozone>31 & hw1_data$Temp>90)
mean(x$Solar.R, na.rm = TRUE)

##What is the mean of "Temp" when "Month" is equal to 6?
x<- subset(hw1_data, Month==6)
mean(x$Temp, na.rm = TRUE)

##What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
x<- subset(hw1_data, Month==5)
max(x$Ozone, na.rm = TRUE)

