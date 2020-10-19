# Input:
#  n: an integer >= 1
# Behavior:
#  This will print out N number of astrisks as a single line of text.
#  e.g. calling  printRowOfAstrisks(4)  will do the same thing as writing the line of code print("****")
# Returns:
#   nothing
printRowOfAstrisks <- function(n) {
  # Hints on writing code in here
  # First, define a variable named something like myString that starts with an empty string
  # Second, use a for loop that will repeat n times
  # Inside the for loop, assign a new value to myString, where the new value uses the paste() function to 
  # combine the old-value of myString with one astrisk, "*"
  # After the for loop, call the print() function
  # Finally, unlike most functions we write that returns a value, I don't want this to return a value.  
  ##So for the last line of your function, just put the word NULL
  mystring <- ""
  for(i in 1:n) {
    mystring <- paste(mystring, "*", sep = "")
  }
  print(mystring)
  NULL
}


# Input:
#   width: an integer >= 1
#   height: an integer >= 1
# Behavior:
#   This will print out a rectangle made of astrisks that is 'width' wide and 'height' tall.
#   e.g. calling printRectangle(6,3) will create the output
#        ******
#        ******
#        ******
# Returns:
#   nothing
printRectangle <- function(width, height)  {
  # Hints on writing code in here:  the two tools you want to use are a for loop, and your other function, 
  # printRowOfAstrisks()
  for(i in 1:height) {
    printRowOfAstrisks(width)
  }
  NULL
  # Finally, return nothing, so the last line should be just the word NULL
}

# printRectangle(100,100)

printTriange <-function(height) {
  for(i in 1:height) {
    printRowOfAstrisks(i)
  }
  NULL
}

printTriange(98)