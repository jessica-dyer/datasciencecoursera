if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/wearable.zip", method="curl")

setwd("C:/Users/jessd9/Repositories/datasciencecoursera/Getting and Cleaning Data/data")
zipF <- "C:/Users/jessd9/Repositories/datasciencecoursera/Getting and Cleaning Data/data/wearable.zip"
outDir <- "C:/Users/jessd9/Repositories/datasciencecoursera/Getting and Cleaning Data/data"
wearable <- unzip("wearable.zip", exdir = outDir)

setwd("C:/Users/jessd9/Repositories/datasciencecoursera/Getting and Cleaning Data")
