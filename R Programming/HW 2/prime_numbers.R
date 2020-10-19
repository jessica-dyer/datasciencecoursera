##input: num=any positive integer
##output: boolean 

isPrime <- function(num) {
  for(i in 2:(num-1)) {
    dividesEvenly<-num%%i==0 
    if (dividesEvenly==TRUE) {
      return (FALSE)
    }
  }
  return (TRUE)
}

##input: max=max number to count up to
##behavior: printing
##return value: nothing 
printPrimesUpTo <- function(max) {
  for(i in 1:max){
   if (isPrime(i)==TRUE) {
     print(i)
    } 
  }
}

##input: max=max number to count up to
##behavior: write to vector
##return value: numeric vector of primes 
generatePrimes <- function(max) {
  myVector<- vector()
  for(i in 1:max){
    if (isPrime(i)==TRUE) {
      myVector<-c(myVector, i) 
    } 
  }
  return (myVector)
}

