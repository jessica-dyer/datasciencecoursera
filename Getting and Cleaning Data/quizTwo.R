# The downloaded source packages are in
# ‘C:\Users\jessd9\AppData\Local\Temp\RtmpSegVM0\downloaded_packages’

ucscDb <- dbConnect(MySQL(),user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb); 

hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu" )
allTables<- dbListTables(hg19)
length(allTables)

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

weatherAppUrl <- "https://api.climacell.co/v3/weather/forecast/daily?lat=47.6473&lon=-122.3562&unit_system=si&start_time=now&end_time=2020-11-07T20:27:36-0800&fields=precipitation%2Ctemp%2Cwind_speed%2Cprecipitation_probability%2Csunrise%2Csunset%2Cvisibility%2Cweather_code&apikey=y6yuG5i9os44D5DVOEfEYewJIkmxDkGt"

github <- "http://developer.github.com/v3/oauth/"

##Takes "content" & repository name (name) as parameters, returns 'created_at' date
getCreatedAtDate<- function(list, repoNameToSearchFor) {
  listLength<-length(list)
  createdAtMatch<-NULL 
  
  for (i in 1:listLength) {
    thisRepoName <- list[[i]]$name
    
    if (thisRepoName==repoNameToSearchFor) {
      createdAtMatch<-list[[i]]$created_at
      break
    }
  }
  return(createdAtMatch)
}

#Q2. 
fileUrl4<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl4, destfile = "communitySurvey.csv", method = "curl")
acs <- read.csv("communitySurvey.csv")

#Q4. 
questionFour<-GET("http://biostat.jhsph.edu/~jleek/contact.html")
##Took content from a byte array to string 
questionFourContent<-rawToChar(questionFour$content)

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode

answerFour<-nchar(htmlCode[10]) ##45
answerFour<-nchar(htmlCode[20]) ##31
answerFour<-nchar(htmlCode[30]) ##7
answerFour<-nchar(htmlCode[100]) ##25

##Q5. Fixed width format data 
noaaUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

noaa<-read.fwf(noaaUrl, widths = c(14,5,1,8,4,1,8,4,1,8))
noaa<-noaa[-c(1,2,3,4), ]
noaa<-noaa[-c(3,6,9)]
colSum4<-sum(noaa$V4, na.rm=TRUE)
newColFour<-as.numeric(noaa$V5)
colFour <- subset(noaa, select=V4)
newNoaa <- lapply(noaa, as.numeric(noaa))
