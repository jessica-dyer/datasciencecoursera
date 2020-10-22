##Programming Assignment 3: R Programming

##Data files location: 
pathToData<-"C:\\Users\\jessd9\\Desktop\\r_programming_data\\rprog_data_ProgAssignment3-data.zip"
pathToCsvFiles<-paste(pathToData,"\\rprog_data_ProgAssignment3-data\\", sep = "")
setwd("C:/Users/jessd9/Desktop/r_programming_data/rprog_data_ProgAssignment3-data")
outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

##Set working directory
setwd("C:/Users/jessd9/Repositories/datasciencecoursera/R Programming/HW 4")

##Number of columns (46)
ncol(outcomeData)
##Number of rows (4706)
nrow(outcomeData) 

variableNames<-names(outcomeData)

##figure out how to coerce each column into as.numeric
##1. Plot the 30-day mortality rates for heart attack

outcomeData[, 11] <- as.numeric(outcomeData[, 11])
outcomeData[, 17] <- as.numeric(outcomeData[, 17])
outcomeData[, 23] <- as.numeric(outcomeData[, 23])

stateNames<-unique(outcomeData$State)

##Input: state abbreviation (string), i.e. "WA"
##Output: Boolean 
isValidState<-function(state) {
  state<-toupper(state)
  (state %in% stateNames)
}

outcomeType<-list(
  HeartAttack = "heart attack",
  HeartFailure = "heart failure",
  Pneumonia = "pneumonia")

#outcomeTypeNew<- (c("heart attack", "heart failure", "pneumonia"))

##Input: The outcome, string, or a value from outcomeType (list)
##Output: Boolean 
isValidOutcome<-function(outcome) {
  validOutcomes <- as.vector(unlist(outcomeType))
  validOutcomes <- sapply(validOutcomes, tolower)
  outcome <- tolower(outcome)
  outcome %in% validOutcomes
}

##
usingColumnFor <- function(df, outcome) {
  outcome <- tolower(outcome)
  column <- NULL
  if (outcome==outcomeType$HeartAttack) {
    column <- df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  } else if (outcome==outcomeType$HeartFailure) {
    column <- df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  } else if (outcome==outcomeType$Pneumonia) {
    column <- df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  } else {
    stop (paste("Function sortBy encountered an error, invalid outcome:", outcome))
  }
}

##
sortBy <- function(df, outcome) {
  outcome <- tolower(outcome)
  sortedData <- df[order(usingColumnFor(df, outcome), df$Hospital.Name), ]
}

## Receive a warning about NAs being introduced
hist(outcomeData[, 11])

##2. Finding the best hospital in a state
best <- function(state, outcome){
  
  ## Add an error if the state name entered is invalid
  if (!isValidState(state)) {
    stop("invalid state")
  }
  
  ## Add an error if the outcome entered is invalid
  if (!isValidOutcome(outcome)){
    stop("invalid outcome")
  }
  
  ##Subsets the data to look at columns 7 & 11 
  bestData<- subset(outcomeData, select = c(2, 7, 11, 17, 23))
  
  ##Subsets the data to the state of interest
  dataForOneState<- subset(bestData, bestData$State==state)
  
  ##Return hospital name in that state with lowest 30-day death rate
  sortedData <- sortBy(dataForOneState, outcome)
  
  head(sortedData, n=1)$Hospital.Name
}