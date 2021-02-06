##################################################
## Project: Machine learning course project
## Script purpose: Data import
## Date: 2021-02-06
## Author: Jessica Dyer
##################################################

train_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
  
test_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

train <- read.csv(train_url)
# test <- read.csv(test_url)