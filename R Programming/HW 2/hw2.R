##First function from lecture
# columnmean <- function(x, removeNA=TRUE) {
#   nc <- ncol(x)
#   means <- numeric(nc)
#   for(i in 1:nc) {
#     temp <- x[, i]
#     means[i] <- mean(temp, na.rm = removeNA)
#   }
#   means
# }
# 
# y <- matrix(rexp(200, rate=.1), ncol=20) ##create a matrix with random numbers
# 
# columnmean (hw1_data)
# 
# mydata <- matrix (rnorm(100), ncol=5)
# columnmean(mydata)
# 
# my_mean <- function(my_vector) {
# 
#   sum(my_vector, na.rm = FALSE) / length(my_vector)
# }
# my_mean (c(1,2,3))
##"C:\\Users\\jessd9\\Desktop\\r_programming_data\\rprog_data_specdata.zip"
###################################
zipF<-file.choose("rprog_data_specdata.zip")
unzip(zipF, files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = "C:\\Users\\jessd9\\Desktop\\r_programming_data", unzip = "internal",
      setTimes = FALSE)

##Pollutant mean
library(readr)
pollutantmean <- function(directory, pollutant, id = 1:332){
  
  X001 <- read_csv("specdata/001.csv")
}

