setwd ("C:/Users/jessd9/Repositories/datasciencecoursera/R Programming/HW 4")

source ("rankhospital.R")

##Sort by state and outcome 
sortByMultiple <- function(df, outcome) {
  outcome <- tolower(outcome)
  multSortedData <- df[order(df$State, usingColumnFor(df, outcome), df$Hospital.Name), ]
  return(multSortedData)
}

##find index of the first instance of each state in the large dataframe
##input: state (two letter state abbreviation-string)
##input: dataframe (contents of dataframe have be valid (not empty), has to be sorted)
##input: rank number (must be numeric)
##output: single numeric index or "NULL" if there are not "num" hospitals in that state

findIndexOfMatch <- function(outcomeData, state, num) {
  indexOfMatch <- NULL
  for (index in 1:nrow(outcomeData)) {
    if (outcomeData$State[index] == state) {
      maybeIndexOfMatch<-index + num-1 
      if (outcomeData$State[maybeIndexOfMatch] != state) {
        return(NULL)
      } else {
        indexOfMatch<-maybeIndexOfMatch
      }
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
  row <- NULL
  for (s in stateNames) {
   index <- findIndexOfMatch(sortedData, s, num)
   if (is.null(index)) {
     row <- data.frame(NA, s)
   } else {
     row<-sortedData[index,] 
   }
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
  finalData <- data.frame(rankedDataDf$State, rankedDataDf$Hospital.Name)
  finalData
}

test<-head(rankall("heart attack", 20), 10)
