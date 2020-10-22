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

findIndexOfMatch <- function(outcomeData, state) {
  indexOfMatch <- NULL
  for (index in 1:nrow(outcomeData)) {
    if (outcomeData$State[index] == state) {
      indexOfMatch<-index
      break
    }
  }
  indexOfMatch
}
  

rankall <- function(outcome, num = "best") {
  
  ## Add an error if the outcome entered is invalid
  if (!isValidOutcome(outcome)){
    stop("invalid outcome")
  }
  
  ## Sort all data by selected outcome 
  sortedData <- sortByMultiple(outcomeData, outcome)
  
  ## Pull out unique states at specific ranking
  rankedDataDf <- data.frame()
  for (s in stateNames) {
   index <- findIndexOfMatch(outcomeData, s)
   row<-outcomeData[index,]
   rankedDataDf<-rbind(rankedDataDf,row)
  }
  
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
  rankedDataDf
  
}

