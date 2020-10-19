# Input:
#  n: an integer >= 1
# Behavior:
#  This will print out N number of astrisks as a single line of text.
#  e.g. calling  printRowOfAstrisks(4)  will do the same thing as writing the line of code print("****")
# Returns:
#   nothing
printRowOfCharacter <- function(n, character) {
  mystring <- ""
  for(i in 1:n) {
    mystring <- paste(mystring, character, sep = "")
  }
  print(mystring)
  NULL
}

printRowOfAstrisks <- function(n) {
  printRowOfCharacter(n, "*")
}

printRowOfDash <- function(n) {
  printRowOfCharacter(n, "-")
}

isEven <- function(myInteger) {
  myInteger%%2==0  
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

 printRectangle(10,10)

printTriange <-function(height) {
  for(i in 1:height) {
    printRowOfAstrisks(i)
  }
  NULL
}

printAlternatingTri <- function(height) {
  for(i in 1:height) {
    if (isEven(i)==TRUE) {
      printRowOfAstrisks(i)
    } else { 
      printRowOfDash(i)
    }
  }
}

printAlternatingTri(10)