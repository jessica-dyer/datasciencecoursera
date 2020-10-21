##Programming Assignment 3: R Programming

##Data files location: 
pathToData<-"C:\\Users\\jessd9\\Desktop\\r_programming_data\\rprog_data_ProgAssignment3-data.zip"
pathToCsvFiles<-paste(pathToData,"\\rprog_data_ProgAssignment3-data\\", sep = "")
setwd("C:/Users/jessd9/Desktop/r_programming_data/rprog_data_ProgAssignment3-data")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

##Set working directory
setwd("C:/Users/jessd9/Repositories/datasciencecoursera/R Programming/HW 4")

##Number of columns (46)
ncol(outcome)
##Number of rows (4706)
nrow(outcome) 

variableNames<-names(outcome)

##figure out how to coerce each column into as.numeric
##1. Plot the 30-day mortality rates for heart attack

outcome[, 11] <- as.numeric(outcome[, 11])
outcome[, 17] <- as.numeric(outcome[, 17])
outcome[, 23] <- as.numeric(outcome[, 23])

stateNames<-unique(outcome$State)

##Input: state abbreviation (string), i.e. "WA"
##Output: Boolean 
isValidState<-function(state) {
  state<-toupper(state)
  (state %in% stateNames)
}

outcomeType<-list(
  HeartAttack = "Heart Attack",
  HeartFailure = "Heart Failure",
  Pneumonia = "Pneumonia")

#outcomeTypeNew<- (c("heart attack", "heart failure", "pneumonia"))

##Input: The outcome, string, or a value from outcomeType (list)
##Output: Boolean 
isValidOutcome<-function(outcome) {
  validOutcomes <- as.vector(unlist(outcomeType))
  validOutcomes <- sapply(validOutcomes, tolower)
  outcome <- tolower(outcome)
  outcome %in% validOutcomes
}

## Receive a warning about NAs being introduced
hist(outcome[, 11])

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
  bestData<- subset(outcome, select = c(2, 7, 11, 17, 23)) 
  ## Return hospital name in that state with lowest 30-day death rate
}