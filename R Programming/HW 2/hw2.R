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
# zipF<-file.choose("rprog_data_specdata.zip")
# unzip(zipF, files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = "C:\\Users\\jessd9\\Desktop\\r_programming_data", unzip = "internal",
#       setTimes = FALSE)

pathToData<-"C:\\Users\\jessd9\\Desktop\\r_programming_data"
pathToCsvFiles<-paste(pathToData,"\\specdata", sep = "")

##Pollutant mean
library(readr)

loadCsv <- function(id) {
  contentsOfCsv <- read_csv(paste(pathToCsvFiles, "\\", idToString(id), ".csv", sep = ""))
}

loadValuesForSinglePol <- function(directory, pollutant, id) {
  contentsOfCsv <- loadCsv (id)
  contentsOfCsv[[pollutant]]
}

idToString <- function(id) {
  myString <- toString(id)
  if (id < 10) {myString<-paste("00", myString, sep = "")}  
  else if (id <100) {myString<-paste("0", myString, sep = "")}
  myString 
}


pollutantmean <- function(directory, pollutant, id = 1:332){
  giantVector<-vector()
  for(i in id) {
    giantVector<-c(giantVector, loadValuesForSinglePol(directory, pollutant, i))
  }
  mean(giantVector, na.rm = TRUE)
}

countOfComplete <- function(id) {
  myBoos<-complete.cases(loadCsv(id))
  sum(myBoos)
}

complete <- function(directory, idlist = 1:332) {
  df<- data.frame(id=integer(), nobs=integer())
  for(i in idlist) {
    row <- data.frame(i, countOfComplete(i))
                     names(row)<-c("id", "nobs")
                     df<-rbind(df,row)
  }
  df
}
