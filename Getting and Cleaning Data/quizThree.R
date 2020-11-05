setwd("C:/Users/jessd9/Repositories/datasciencecoursera/Getting and Cleaning Data")


# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
library(tidyverse)
library(dplyr)
library(readr)

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

##2. 
jpegUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"


z <- tempfile()
download.file(jpegUrl, z, mode="wb")
img <- readJPEG(z, native=TRUE )
quantile(img, probs = c(.3, .8)) ##produced an answer 638 different for the 30th quantile

##3. Load the Gross Domestic Product data for the 190 ranked countries in this data set:

fileUrl1 <-"http://databank.worldbank.org/data/download/Edstats_csv.zip"

##Load the educational data from this data set:
  
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

##Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP 
##rank (so United States is last). What is the 13th country in the resulting data frame?

download.file(fileUrl1, destfile = "./data/gdpDf.csv", method="curl")
download.file(fileUrl2, destfile = "./data/education.csv", method="curl")
educationDf <- read.csv("./data/education.csv")
gdpDf <- read.csv("./data/GDP.csv")

intersect(names(educationDf), names(gdpDf))
newMergedDf <- merge(educationDf, gdpDf, by.x="CountryCode", by.y="CountryCode", all=FALSE)

arrange(newMergedDf, desc(Ranking))
newMergedDf[13, ]

##4. What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
OECDGroup <- group_by(newMergedDf, newMergedDf$Income.Group )
myTable<-summarize(OECDGroup, AverageRanking =mean(Ranking, na.rm=TRUE))

##5. Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries
#are Lower middle income but among the 38 nations with highest GDP?
quantile(newMergedDf$Ranking ,na.rm=TRUE)

breaks <- quantile(newMergedDf$Ranking, probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedDT$quantileGDP <- cut(mergedDT[, Rank], breaks = breaks)
mergedDT[`Income Group` == "Lower middle income", .N, by = c("Income Group", "quantileGDP")]

ApplyQuintiles <- function(x, column) {
  cut(x$column, breaks=c(quantile(df$column, probs = seq(0, 1, by = 0.20))), 
      labels=c("0-20","20-40","40-60","60-80","80-100"), include.lowest=TRUE)
}
