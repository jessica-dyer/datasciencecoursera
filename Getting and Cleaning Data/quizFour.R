# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# 
# and load the data into R. The code book, describing the variable names is here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# 
# Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
# What is the value of the 123 element of the resulting list?
library(tidyverse)
library(dplyr)
library(readr)
if(!file.exists("./data")){dir.create("./data")}
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/communitySurvey.csv", method = "curl")
communitySurvey <- read_csv("./data/communitySurvey.csv")

colnames <- names(communitySurvey)
strsplit(colnames, "^wgtp") [[123]]

##2.Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl1, destfile = "./data/gdpDf.csv", method="curl")
gdpDf <- read_csv("data/gdpDf.csv", skip = 4)
gdpDf2 <- subset(gdpDf, select = c(X1, X2, X4, X5))
gdpDf2 <- gdpDf2[-c(232:326), ]
gdpDf2 <- gdpDf2[-c(228, 229), ]
gdpDf2 <- arrange(gdpDf2, gdpDf2$X1)
colnames(gdpDf2) <- c("CountryCode", "Rank", "Country", "Total")
gdpDf2$Rank <- as.integer(gdpDf2$Rank)
gdpDf2 <- arrange(gdpDf2, gdpDf2$Rank)
gdpDf2 <- subset(gdpDf2, (!is.na(gdpDf2$Rank)))

##Remove the commas 
gdpDf2$Total <- as.integer(gsub(",", "", gdpDf2$Total))
mean(gdpDf2$Total, na.rm = TRUE)

##4. 
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2, destfile = "./data/education.csv", method="curl")
educationDf <- read.csv("./data/education.csv")
newMergedDf <- merge(educationDf, gdpDf2, by.x="CountryCode", by.y="CountryCode", all=TRUE)
colnames2 <- names(newMergedDf)
FiscalJune <- grep("Fiscal year end: June", newMergedDf$Special.Notes)
NROW(FiscalJune)

##5. 
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

amzn2012 <- sampleTimes[grep("^2012", sampleTimes)]
NROW(amzn2012)
NROW(amzn2012[weekdays(amzn2012) == "Monday"])