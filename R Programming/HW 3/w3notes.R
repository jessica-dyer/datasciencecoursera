##lapply
# fun<-function (X, FUN, ...)
# {
#   FUN <-match.fun(FUN)
#   if (!is.vector(x) || is.object(x))
#     X <as.list(X)
#   .Internal(lapply(X, FUN))
# }

x<- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x<- list(a=1:4, b=rnorm(10), c= rnorm(20, 1), d=rnorm(100, 5))
lapply(x, mean)

x<-1:20
lapply(x, runif)

lapply(x, runif, min =0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b=matrix (1:6, 3, 2))

lapply(x,function(elt) elt[,1])

##sapply

x<-1:20
sapply(x, runif)

##apply
##mean of each column (collapse the rows)
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)

##collapse the columns, calculate the sum of the row
apply(x, 1, sum)
rowSums(x)

#pass it the margin 1 to collapse the columns 
Barf<-apply(x, 1, quantile, probs =c(.25, .75))

a <- array(rnorm(2*2*10), c(2,2,10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)

#mapply is a multivariate apply of sorts which applies a function in parallel over a set of arguments (can take multiple list arguments)
str(mapply)
##function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
list(rep(1,4), rep(2,3), rep(3,2), rep(4, 1))
mapply (rep, 1:4, 4:1)

noise<-function(n, mean, sd)
  rnorm(n, mean, sd)
mapply(noise, 1:5, 1:5, 2) ##instant vectorization 

##tapply is used to apply a function over subsets of a vector.

str(tapply)
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
tapply(x, f, mean, simplify=FALSE)

#split takes a vector or other objects and splits it into groups determined by a factor or list of factors
split (x, f)
lapply(split(x,f), mean)

hw1_data <- read_csv("R Programming/HW 1/hw1_data.csv")
s <- split(hw1_data, hw1_data$Month)
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

printmessage <- function(x) {
  if(is.na(x))
      print("x is a missing value!")
  else if(x >0)
      print("x is greater than zero")
  else 
      print("x is less than or equal to zero")
  invisible(x)
}

# Ways to create a matrix
# A matrix with all 7's:
matrixAllSevens<-matrix(7,nrow=3,ncol=3)
print(matrixAllSevens)
matrixAllSevensObject<-makeCacheMatrix(matrixAllSevens)
# if you wanted to replace the value in the 3rd row, 2nd column:
matrixAllSevens[3,2]<-6
print(matrixAllSevens)
matrixAllSevensObject$set(matrixAllSevens)  # don't forget to tell your object about the modified matrix
# if you wanted to create a matrix and specify all the values:
myCustomMatrix<-matrix(c(4,2,2,0,1,0,3,3,6),nrows=3,ncols=3)
print(myCustomMatrix)
myCustomMatrixObject<-makeCacheMatrix(myCustomMatrix)
# here's a little matrix that I know is invertable:
myLittleMatrix<-matrix(c(4,2,2,4),nrow=2,ncol=2)
print(myLittleMatrix)
myLittleMatrixObject<-makeCacheMatrix(myLittleMatrix)
print( myLittleMatrixObject$getInverse() )


# makeVector <- function(x = numeric()) {
#   m <- NULL
#   set <- function(y) {
#     x <<- y
#     m <<- NULL
#   }
#   get <- function() x
#   setmean <- function(mean) m <<- mean
#   getmean <- function() m
#   list(set = set, get = get,
#        setmean = setmean,
#        getmean = getmean)
# }
# 
# cachemean <- function(x, ...) {
#   m <- x$getmean()
#   if(!is.null(m)) {
#     message("getting cached data")
#     return(m)
#   }
#   data <- x$get()
#   m <- mean(data, ...)
#   x$setmean(m)
#   m
# }
# 
# makeVectorBetterVersion <- function(x = numeric()) {
#   mean <- NULL
#   set <- function(y) {
#     x <<- y
#     mean <<- NULL
#   }
#   get <- function() x
#   #setmean <- function(mean) mean <<- mean   # setMean is bad, get rid of it
#   getMean <- function(...) {
#     if(is.null(mean)) {
#       message("doing the heavy calculations!")
#       mean <<- mean(x, ...)
#     }
#     mean
#   }
#   list(set = set, get = get,
#        getMean = getMean)
# }


