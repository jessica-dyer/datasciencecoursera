columnmean <- function(x, removeNA=TRUE) {
  nc <- ncol(x)
  means <- numeric(nc)
  for(i in 1:nc) {
    temp <- unlist (x[, i], use.names = FALSE)
    means[i] <- mean(temp, na.rm = removeNA)
  }
  means 
}
result<-columnmean (hw1_data)
print(result) 

#mydata <- matrix (rnorm(100), ncol=5)
#columnmean(mydata)

x <-1:10

#if (x>5) {
  x<-0
#}
  
  f <-function(x) {
    g <- function(y) {
      y+z
    }
    z <- 4
    x + g(x)
  }
  z <-10
  
  x <-5
  y <- if(x<3) {
    NA
  } else {
    10
  }
 
  
  
  
  
  
  
  
  f <- 225  #global scope
  foo <- function(){
    f <- 88 # acope where H is Defined
    
    h <- function() {
      print(f)
    }
    
    newContext <- function() {
      f <- 5000 # scrope where H is called
      h()
    }
    newContext()
  }
  foo()
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  h <- function(x, y = NULL, d = 3L) {
    z <- cbind(x, d)
    if(!is.null(y))
      z <- z + y
    else
      z <- z + f
    g <- x + y / z
    if(d == 3L)
      return(g)
    g <- g + 10
    g
  }
