setwd("C:/Users/jessd9/Repositories/datasciencecoursera/Getting and Cleaning Data")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
codeBook <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"

download.file(fileUrl, destfile = "cameras.csv", method="curl")
download.file(codeBook, destfile = "codeBook.pdf", method="curl")

library(readr)
cameras <- read_csv("cameras.csv")


table(cameras$VAL)

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl2, destfile = "naturalGas.xlsx")

library(readxl)
dat <- read.xlsx("naturalGas.xlsx", rows=18:23, cols=7:15)

fileUrl3 <- "https://data.baltimorecity.gov/Culture-Arts/Restaurants/k5ry-ef3g/data"

doc <- xmlTreeParse("baltRest.xml", useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
xmlSApply(rootNode, xmlValue)

zipCode<-xpathSApply(rootNode, "//zipcode", xmlValue)
table(zipCode)

fileUrl4<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl4, destfile = "communitySurvey.csv", method = "curl")
communitySurvey <- read_csv("communitySurvey.csv")
communitySurvey <- fread("communitySurvey.csv")