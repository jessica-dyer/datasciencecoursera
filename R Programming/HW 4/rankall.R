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
  
  ## Pull out unique states at specific ranking
  rankedDataDf <- data.frame(state=character(), hospital_name=character())
  for (s in stateNames) {
    row <- NULL
    index <- findIndexOfMatch(sortedData, s, desiredRank)
   if (is.null(index)) {
     row <- data.frame(s, NA)
   } else {
     tempState <- sortedData$State[index]
     tempName <- sortedData$Hospital.Name[index]
     row<-data.frame(tempState, tempName) 
   }
   names(row)<-c("State", "Hospital Name")
   rankedDataDf<-rbind(rankedDataDf,row)
  }
  

  rankedDataDf
}

##test<-head(rankall("heart attack", 20), 10)
test<-tail(rankall("pneumonia", "worst"), 3)

##split(outcomeData, outcomeData$state)
