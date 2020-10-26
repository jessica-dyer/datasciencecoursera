# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
library(tidyverse)

if(!file.exists("./data")){dir.create("./data")}
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/communitySurvey.csv", method = "curl")
communitySurvey <- read_csv("./data/communitySurvey.csv")

codeBook <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(codeBook, destfile = "./data/codeBook.pdf", method="curl")

##1. Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 
# worth of agriculture products. Assign that logical vector to the variable agricultureLogical. 
# Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
agricultureLogical <- ifelse(communitySurvey$ACR == 3 & communitySurvey$AGS==6, TRUE, FALSE)
which(agricultureLogical)

