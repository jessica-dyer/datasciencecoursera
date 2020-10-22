##Set working directory
setwd ("C:/Users/jessd9/Repositories/datasciencecoursera/R Programming/HW 4")

source ("best.R")

rankhospital <- function(state, outcome, num = "best") {

  ## Add an error if the state name entered is invalid
  if (!isValidState(state)) {
    stop("invalid state")
  }

  ## Add an error if the outcome entered is invalid
  if (!isValidOutcome(outcome)){
    stop("invalid outcome")
  }
  
  ##Subsets the data to look at columns we're interested in... 
  bestData<- subset(outcomeData, select = c(2, 7, 11, 17, 23))
  
  #Subsets the data to the state of interest
  dataForOneState<- subset(bestData, bestData$State==state)
  
  #Sort data by the outcome provided 
  sortedData <- sortBy(dataForOneState, outcome)
  sortedData <- subset(sortedData, !is.na(usingColumnFor(sortedData, outcome)))
  
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
  
  ##Return hospital name in that state with the given rank
  sortedData[desiredRank,] $Hospital.Name

}
##answer<-rankhospital("WA", outcomeType$HeartFailure, 5)

best <- function(state, outcome){
  rankhospital(state, outcome, 1)
}

# Identifies all unique outcome values into a vector
##uniqueData <- unique(usingColumnFor(sortedData, outcome))
##valueAtRank <- uniqueData[num]
##groupAtRank <- subset(sortedData, usingColumnFor(sortedData, outcome)==valueAtRank)