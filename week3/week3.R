### lappy ====
# always return a list
# Example 1
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

# Example 2, list of vectors with diff length,
# but returns list of vectors of a single element
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

# Example 3
x <- 1:4
lapply(x, runif)
lapply(x, runif, min = 0, max = 10)

## lapply and friends make heavy use of anonymous functions
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2)) 
# Example: An anonymous function for extracting the first column of each matrix.
# elt() is anonymous function
lapply(x, function(elt) { elt[, 1] })

### sapply ====
# sapply will try to simplify the result of lapply if possible.
# If the result is a list where every element is length 1, then a vector is returned
# If the result is a list where every element is a vector of the same length (> 1), a matrix is returned.
# If it can’t figure things out, a list is returned

# Example, lapply vs sapply
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean) # returns list of 4 vectors, each has a single numeric element
sapply(x, mean) # returns numeric vector of length 4

### apply ====
# used to a evaluate a function (often an anonymous one) over the margins of an array
# most often used to apply a function to the rows or columns of a matrix
# It can be used with general arrays, e.g. taking the average of an array of matrices
# It is not really faster than writing a loop, but it works in one line!

x <- matrix(rnorm(200), 20, 10)

# Example 1, calculate mean of each column of the matrix
# returns vector of length 10, with mean of each column
apply(x, 2, mean) # MARGIN = 2, preserve columns of matrix

# Example 2, calculate sum of each row of the matrix
# returns vector of length 10, with sum of each row
apply(x, 1, sum) # MARGIN = 1, preserve rows of matrix

# Example 3, calculate 25th and 75th percentile of the each row
# returns a matrix with 2 rows, 2x20 matrix, from a 20x10 matrix
apply(x, 1, quantile, probs = c(0.25, 0.75))

# Example 4, avg matrix in an array
# array a, has 2 rows and 2 columns, and "3rd dimension" is 10
# aka some 2x2 matrix stacked together 
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
# calculate avg of all 2x2 matrix
# MARGIN, keep 1st and 2nd dimension, collapse 3rd dimension
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2) # accepts array

### TIPS col/row sums and means col/row sums and means ====
# For sums and means of matrix dimensions, we have some shortcuts.
# shortcut functions are much faster, 
# but you won’t notice unless you’re using a large matrix.
rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

### mapply ====
# is a multivariate apply of sorts
# which applies a function in parallel over a set of arguments.
# aka >= 2 lists

# Example 1, apply function to multiple sets of arguments
# tedious to type
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
# easier to type
mapply(rep, 1:4, 4:1)

# Example 2
# generates random normal noise
noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}

noise(5, 1, 2) # not what i wan

# 1 random normal with mean 1
# 2 random normal with mean 2
# 3 random normal with mean 3 etc...
# in this eg, sd is always 2
noise(1:5, 1:5, 2)

# thus,
mapply(noise, 1:5, 1:5, 2)
# is same as
list(noise(1, 1, 2),
     noise(2, 2, 2),
     noise(3, 3, 2),
     noise(4, 4, 2),
     noise(5, 5, 2))