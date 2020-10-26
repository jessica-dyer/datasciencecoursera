##Week three of "getting and cleaning data"

##Subsetting and sorting: 
set.seed(13435)
x <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
x <- x[sample(1:5), ]; x$var2[c(1,3)] = NA

#returning one column based on index
x[,1]
x[,"var1"]
x[1:2,"var2"]

##logicals ands and ors
x[(x$var1 <= 3 & x$var3>11), ]
x[(x$var1 <=3 | x$var3>15), ]

##dealing with missing values
##using 'which' will return the indices and doesn't return the NAs
##for example: 
x[which(x$var2>8), ]

##sorting, sort command will sort in increasing order. Can tell it to use decreasing
sort(x$var1)
sort(x$var1, decreasing=TRUE)

##can put all the na values at the end of the sort
sort(x$var2, na.last=TRUE)

##ordering the df is different than sort and will order the DF based on parameters set by you. 
x[order(x$var1), ]

x[order(x$var1, x$var2), ]

##ordering with dplyr 
arrange(x,var2)

arrange(x,desc(var1))

##adding rows and columns
x$var4 <-rnorm(5)
x

#column bind (cbind) & row bind (rbind)
y <-cbind(x,rnorm(5))

notes<-"http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf" 
download.file(notes, destfile = "Notes.pdf", method="curl")

###############################
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

##Mpre in depth information 
summary(restData)
str(restData)

#Quantiles of quantitative variables 
quantile(restData$councilDistrict,na.rm=TRUE)

##make table
table(restData$zipCode,useNA="ifany")

##checking for missing values 
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))

##checks a condition (boolean)
all(restData$zipCode<0)

##Row and column sums 
colSums(is.na(restData))

##Values with specific characteristcs 
table(restData$zipCode %in% c("21212"))

table(restData$zipCode %in% c("21212", "21213"))

##subset your data by a logical test (this makes a new data fram z, with the data you've requested)
z<- data.frame(restData[restData$zipCode %in% c("21212", "21213"), ])

##cross tabulation
xt <- xtabs(Freq ~ Gender + Admit, DF)

##flat tables (make flat tables of cross tabs)
ftable(xt)

##size of data set
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")

####################################Creating new variables 
##missingness indicators
##cutting up quantitative variables
##applying transformations 

##creating sequences (sometimes you need an index for your data set)
s1 <- seq(1,10, by=2) ;s1

##subsetting variables (appending with the "near me" variable)
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")

##creating binary variables 
restData$zipWrong = ifelse(restData$zipCode<0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode<0)

##creating categorical variables 
restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)

##easier cutting
library(Hmisc)
restData$zipGroups

##Creating factor variables 
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

yesno <- sample(c("yes", "no"), size=10, replace=TRUE)
yesnofac = factor(yesno, levels=c("yes", "no"))
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)

##Mutate function
library(Hmisc); library(plyr)
restData2 = mutate(restData, zipGroups=cut2(zipCode,g=4))

##Tidy Data: 1) each variable forms a column; 2) each observation forms a new row; 3) each table/file stores data about one kind of observation 
library(reshape2)
head(mtcars)

##Melting data frames (from wide to long, not working here for some reason)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))

##dplyr 


