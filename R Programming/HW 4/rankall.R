setwd ("C:/Users/jessd9/Repositories/datasciencecoursera/R Programming/HW 4")

source ("rankhospital.R")

##Sort by state and outcome 
sortByMultiple <- function(df, outcome) {
  outcome <- tolower(outcome)
  multSortedData <- df[order(df$State, usingColumnFor(df, outcome), df$Hospital.Name), ]
  }

rankall <- function(outcome, num = "best") {
  ## Add an error if the outcome entered is invalid
  if (!isValidOutcome(outcome)){
    stop("invalid outcome")
  }
  
  ## Sort all data by selected outcome 
  sortedData <- sortByMultiple(outcomeData, outcome)
  
  desiredRank<- NULL
  if (typeof(num)=="character") {
    if (num=="best") {
      desiredRank<-1
    } else if (num=="worst") {
      desiredRank<-nrow(sortedData)
    } else {
      stop("invalid rank")
    }
  } else {
    desiredRank<-num
  }
  
  myNewDf<- sortedData[desiredRank,] $Hospital.Name $State 
}

