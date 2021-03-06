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
pathToCsvFiles<-paste(pathToData,"\\specdata\\", sep = "")

##Pollutant mean
library(readr)
library(dplyr)

loadCsv <- function(idNumeric) {
  contentsOfCsv <- read_csv(paste(pathToCsvFiles, "\\", idToString(idNumeric), ".csv", sep = ""))
}

loadValuesForSinglePol <- function(directory, pollutant, idNumeric) {
  contentsOfCsv <- loadCsv (idNumeric)
  contentsOfCsv[[pollutant]]
}

idToString <- function(idNumeric) {
  idString <- toString(idNumeric)
  if (idNumeric < 10) {idString<-paste("00", idString, sep = "")}  
  else if (idNumeric <100) {idString<-paste("0", idString, sep = "")}
  idString 
}


pollutantmean <- function(directory, pollutant, idList = 1:332){
  giantVector<-vector()
  for(i in idList) {
    giantVector<-c(giantVector, loadValuesForSinglePol(directory, pollutant, i))
  }
  mean(giantVector, na.rm = TRUE)
}

##Input: single numeric ID 
##returning an integer >=0 representing the number of complete cases 
countOfComplete <- function(idNumeric) {
  myBoos<-complete.cases(loadCsv(idNumeric))
  sum(myBoos)
}

##Inputs: directory, (not used for now)
##single ID: numeric ID list 
##returning a data frame with a row for each file, columns: id, number of complete observations 
complete <- function(directory, idList = 1:332) {
  df<- data.frame(id=integer(), nobs=integer())
  for(i in idList) {
    row <- data.frame(i, countOfComplete(i))
    names(row)<-c("id", "nobs")
    df<-rbind(df,row)
  }
  df
}

##Inputs: directory, (not used for now)
##single ID: numeric ID of a single file 
##Threshold: integer
##return a boolean for a single CSV based on threshold entered 

meetsThresholdForSingle <- function(directory, idNumeric, threshold=0) {
  answer <- FALSE
    if (countOfComplete(idNumeric) > threshold) {
      answer <-TRUE
    } else {
      answer <-FALSE
    }
  answer 
}

corr <- function(directory, threshold = 0) {
  # Get full path of the specsdata folder
  directory <- pathToCsvFiles    
  
  #Get observations and filter by threshold
  observations <- complete(directory)
  filtered_observations = subset(observations,observations$nobs > threshold)
  
  # Aux variables
  file_list <- list.files(directory)
  correlation <- vector()
  
  # For each id in filtered observations:
  for (i in filtered_observations$id) {
    # Read the file,
    file_dir <- paste(directory,file_list[i],sep="")
    file_data <- read.csv(file_dir)
    # remove NA,
    file_data <- subset(file_data,complete.cases(file_data))        
    # and calculate the cor and accumulate it in the corellation vector.
    correlation <- c(correlation,cor(file_data$nitrate,file_data$sulfate))    
  }
  #Finally, return the vector
  correlation
}

