setwd("C:/Users/jessd9/Repositories/datasciencecoursera/R Programming/HW 4")

##Write a function that takes two numbers (start num & end num) and 
##returns a vector of all numbers that are divisible by 5 between them 

bigWiggles <- function(s_num, e_num) {
  listOfNum <- NULL 
 for(i in s_num:e_num) {
    if (i%%5==0) {
      ##listOfNum <- append(listOfNum, i)
      listOfNum <- (c(listOfNum, i))
    }
 }
  listOfNum
}
  
myVector<-bigWiggles(5,100)

bigWigglesWhile <- function(s_num, e_num, increment=5) {
  listOfNum <- NULL 
  counter <- s_num  
  while (counter<=e_num) {
    listOfNum <- (c(listOfNum, counter))
    counter<-counter+increment  
  }
  listOfNum
}

##Reverse: a function that the return value is a vector of all the same things but in the opposite order. i.e. 
reverse <- function(vector) {
  myInverseVector<- NULL
  counter <-length(vector)
  while (counter>0) {
    myInverseVector <- (c(myInverseVector, vector[counter]))
    counter <- counter-1 
  }
  myInverseVector
}



##Zipper: a function that takes 2 vectors of the same length and returns the two vectors combined like the teeth on a zipper 
zipper <- function(v1, v2) {
  ##Input check of lengths of v1 & v2
  if (length(v1)!= length(v2)) {
    stop("Both vectors must be the same length. Thanks!")
  }
  
  zipperVector <- NULL
  counter <- 1 
  while (counter<length(v1)) {
    zipperVector <- c(zipperVector, v1[counter], v2[counter])
    counter<-counter+1  
  }
  zipperVector
}

##Fib function: returns the nth number in the fibonacci sequence (i.e. fib(8)=21)
##input: single positive integer (n)
##output: the fibonacci number at the nth position 

fib <- function(n) {
  ##Input check of 'n' 
  if (n<0) {
    stop("All values should be greater than 0.")
  }
  if (n==0) {
    return(0)
  }
  if (n==1) {
    return(1)
  }
  returnValue<-fib(n-1) + fib(n-2)
  returnValue 
}
fib(8)

power <- function(base, exp) {
  ##Input check of 'n' 
  if (exp<0)  {
    stop("All exponents should be greater than 0.")
  }
  if (exp==1) {
    return(base)
  }
  returnValue<-power(base, exp-1) * (base)
  returnValue
}
power(2,5)
