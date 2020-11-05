##Editing text variables 

##Substitute out characters i.e. and _ (in a vector)
sub("_", "", names(reviews),)

##gsub will remove many characters, i.e. multiple underscores 
testName <- list("this_is_a_test", "this_is_another_test")
gsub("_", "", testName)

##Finding values - grep(), grepl() if value=TRUE it will return the actual values
grep("Alameda", cameraData$intersection)

##grepl() will return a boolean 
table <- table(grepl("this_is_a_test", testName))

##paste0 will paste things together with no space 
##str_trim will remove leading spaces

##metacharacters "^" start of a line 
## morning$ will match the end of a line
##[Bb] [Uu] [Ss] [Hh] will match all lowercase & uppercase values of the word
## beginnging of the line, capital or lowercase i. ^[Ii] am
## [0-9] [a-zA-Z]
## When used at the beginning of a character class, the "^" is also a metacharacter and indicates matching characters NOT
## IN THE INDICATED CLASS i.e. [^?.]$ means, starting at the end of the line ($), 

##9.11 the . means any character you can escape the . with a \ meaning, look for the .
## the | metacharacter flood|fire

##^([Gg]ood | [Bb]ad)

#? means optional 

d2 <- Sys.Date()
format(d2, "%a %b %d")

library(lubridate)
