# takes in 2 numbers, add them, and return the value ====
add2 <- function(x, y) {
  x + y
  # in R function, the return is the last expression
}

# takes in a vector of numbers  ====
# return subset of the vector
# and return a vector with number(s) > 10
# returns empty vector if no elements > 10
above10 <- function(x) {
  isMoreTen <- x > 10
  x[isMoreTen]
}

# similar to above10, but allow user to "choose" the threshold
above <- function(x, n = 10) { # give default value to n
  isMore <- x > n
  x[isMore]
}

# takes in a matrix of data frame  ====
# return the mean of of each column
columnMean <- function(x, removeNA = TRUE) {
  numCol <- ncol(x)
  means <- numeric(numCol) # means should be numeric instead of integer
  for (i in 1:numCol) {
    means[i] <- mean(x[, i], na.rm = removeNA)
  }
  means
}

columnMean(airquality)
columnMean(airquality, FALSE)