source("hw2.R")

assert <- function(name, expression) {
  if (expression) {
    print(paste(name,"passed! :)"))
  } else {
    print(paste(name, "broken :("))
  }
}

assertVectorsMatch <-function(name, vec1, vec2) {
  assert(name, all(near(vec1,vec2, tol=0.0001)))
}

cr <- corr("specdata", 150)
result1<-head(cr)

expectedResult1<-c(-0.01895754, -0.14051254, -0.04389737, -0.06815956, -0.12350667, -0.07588814)


result2<-summary(cr)
expectedResult2<-c(-0.21057, -0.04999 , 0.09463 , 0.12525 , 0.26844 , 0.76313)


cr <- corr("specdata", 400)
result3<-head(cr)
expectedResult3<-c(-0.01895754, -0.04389737, -0.06815956, -0.07588814,  0.76312884, -0.15782860)


assertVectorsMatch("result 1", result1,expectedResult1)
assertVectorsMatch("result 2",result2,expectedResult2)
assertVectorsMatch("result 3",result3,expectedResult3)