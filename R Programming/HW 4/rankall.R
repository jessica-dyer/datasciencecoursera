setwd ("C:/Users/jessd9/Repositories/datasciencecoursera/R Programming/HW 4")

source ("rankhospital.R")

##Sort by state and outcome 
sortByMultiple <- function(df, outcome) {
  outcome <- tolower(outcome)
  multSortedData <- df[order(df$State, usingColumnFor(df, outcome), df$Hospital.Name), ]
}

##find index of the first instance of each state in the large dataframe
##input: state (two letter state abbreviation-string), dataframe
##output: single numeric index

findIndexOfMatch <- function(outcomeData, state) {
 indexData <- which(outcomeData==state)[1]
}
  

rankall <- function(outcome, num = "best") {
  
  ## Add an error if the outcome entered is invalid
  if (!isValidOutcome(outcome)){
    stop("invalid outcome")
  }
  
  ## Sort all data by selected outcome 
  sortedData <- sortByMultiple(outcomeData, outcome)
  
  ## Pull out unique states at specific ranking
  rankedDataDf <- 
  
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
  
  
}

