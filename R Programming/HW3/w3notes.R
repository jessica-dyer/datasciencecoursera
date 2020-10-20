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