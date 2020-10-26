##Swirl: Getting and cleaning data 
logurl <- 'http://cran-logs.rstudio.com/2014/2014-07-08.csv.gz'
filepath <- paste0('~/', basename(logurl))
download.file(logurl, filepath)
cranlog <- read.csv(filepath)
write.csv(cranlog, './Data/2014-07-08.csv')
unlink(filepath)

path2csv <- file.path('./Data/2014-07-08.csv')


### Intro
df <- read.csv(path2csv, as.is = TRUE)
dim(df)
head(df)
library(dplyr)
cran <- tbl_df(df)
cran
?manip