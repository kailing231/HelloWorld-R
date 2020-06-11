### R Console Input and Evaluation ====
x <- 99
print(x)

msg <- "hello"

x <- 11:20
x

x[0] # index starts at 1
x[5]
x[11]
x[11] <- 111
x[22] <- 222

### Vector (same class) ====
## c(...) Combine Values into a Vector or List
x <- c(0.5, 0.6)        # numeric
x <- 9:29               # integer 
x <- c(TRUE, FALSE)     # logical
x <- c(T, F)            # logical 
x <- c("a", "b", "c")   # character 
x <- c(1+0i, 2+4i)      # complex

## vector(...) produces a vector of the given length and mode
x <- vector("numeric", length = 10) # default values

## Mixing Objects
# Coercion. When you call a function with an argument of the wrong type, 
# R will try to coerce values to a different type so that the function will work
# Values are converted to the simplest type required to represent all information.
# The ordering is roughly logical < integer < numeric < complex < character < list.
# (right wins)

y <- c(1.7, "a")        # character
y <- c(TRUE, 2)         # numeric
# TRUE == 1
# FALSE == 0
y <- c("a", TRUE)       # character

## Explicit Coercion
# Objects can be explicitly coerced from one class to another using the as.* functions, if available
x <- 0:6 
class(x)        # integer
as.numeric(x)   # [1] 0 1 2 3 4 5 6
as.logical(x)   # [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x) # [1] "0" "1" "2" "3" "4" "5" "6"

# Nonsensical coercion results in NA
x <- c("a","b","c")
as.numeric(x)   # [1] NA NA NA  Warning message: NA introduced by coercion 
as.logical(x)   # [1] NA NA NA
as.complex(x)   # [1] NA NA NA  Warning message: NA introduced by coercion 

### List (diff class) ====
x <- list(1, "a", TRUE, 1 + 4i)
x
x[[3]]  # index by [[i]]

### Matrix ====
m <- matrix(nrow = 2, ncol = 3)
m       # default value: NA
dim(m)  # dimension

# fill col, then row
# aka start in the “upper left” corner and running down the columns
m <- matrix(1:6, nrow = 2, ncol = 3)  
m

# create matrix from vectors by adding a dimension attribute
m <- 1:10
m
dim(m) <- c(2,5)  # add dimension to vector, must match length of object

# create matrix by column-binding or row-binding with cbind() and rbind()
# result must be same "length"
x <- 1:3    # 3 elements
y <- 10:12  # 3 elements
cbind(x,y)
rbind(x, y) 

### Factor ====
# - represent categorical data
# - can be unordered or ordered
# - is "auto-coded" into int
# aka an integer vector where each integer has a label.
# eg LOW/MED/HIGH > 1/2/3
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)    # show frequency of all levels
unclass(x)  # see how R coded the levels into int

# levels determined by alphabetic order
# explicitly set levels
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))

### Missing Values ====
# denoted by NaN for undefined mathematical operations
# or NA for everything else
# - is.na() is used to test objects if they are NA
# - is.nan() is used to test for NaN
# - NA values have a class also, so there are integer NA, character NA, etc.
# - A NaN value is also NA (eg is missing value) but the converse is not true
# aka NAN == NA but NA != NAN
x <- c(1, 2, NA, 10, 3)
# check entire vector
is.na(x)    # [1] FALSE FALSE  TRUE FALSE FALSE
is.nan(x)   # [1] FALSE FALSE FALSE FALSE FALSE

x <- c(1, 2, NaN, NA, 4)
is.na(x)    # [1] FALSE FALSE  TRUE  TRUE FALSE
is.nan(x)   # [1] FALSE FALSE  TRUE FALSE FALSE

### Data Frame ====
# - same no of rows
# - may have diff col type
# - row.names
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)

### Names ====
# aka column name
# R objects can also have names, 
# very useful for writing readable code and self-describing objects
x <- 1:3
names(x)  # NULL
# [1] 1 2 3

# add names to existing integer vector
names(x) <- c("foo", "bar", "norf")   # [1] "foo"  "bar"  "norf"
# foo  bar norf 
# 1    2    3 

## List names
x <- list(a = 1, b = 2, c = 3) 
x

## Matrix names
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))   # row then col
m

### Subset List ====
x <- list(foo = 1:4, bar = 0.6)
single <- x[1]    # single bracket, always return same class, thus is list
double <- x[[1]]  # double brackets, return seq of integer

x$bar             # $, element with the name
x[["bar"]]        # same but double bracket with string
x["bar"]          # single bracket, always return same class, thus is list

# subset multiple elements of a list
# cannot use double bracket :(
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

# [[ operator can be used with computed indices; 
# $ can only be used with literal names
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]]         # computed index for ‘foo’, returns [1] 1 2 3 4
x$name            # returns NULL
x$foo             # returns [1] 1 2 3 4

# [[ can take an integer sequence
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))  # a list in a list :O
# extract `14`
x[[c(1, 3)]]    # extract 1st element's, 3rd element

# x[[1]] == 1st element of list x: list a
# x[[1]][[3]] == 3rd element of list a
x[[1]][[3]]

# extract `3.14`
x[[c(2, 1)]]    # extract 2nd element's, 1st element

### Subset Matrix ====
x <- matrix(1:6, 2, 3)
x[2, 1]
# Indices can also be missing
x[1, ]  # entire 1st row
x[, 1]  # entire 1st col

# By default, when a single element of a matrix is retrieved, 
# it is returned as a vector of length 1 rather than a 1 × 1 matrix.
# This behavior can be turned off by setting drop = FALSE.
x[1, 2, drop = FALSE]   # returns a matrix of one element
x[1, , drop = FALSE]    # returns a matrix of one row

### Partial Matching ====
# good for saving time when typing with command line
x <- list(aardvark = 1:5)
# typing `aardvark` everytime is too troublesome, so just type x$a
x$a                     # works
# by defauly, [[ doesnt do partial matching like $
x[["a"]]                # must be exact match, doesnt work
x[["a", exact = FALSE]] # now it works

### Remove NA Values ====
x <- c(1, 2, NA, 4, NA, 5)
# Method 1
bad <- is.na(x)
x[!bad]   # returns vector of num with non-NA elements

# Method 2
# check multiple objects, all must have same "index" that have non-NA
x <- c(1, 2, NA, 4, NA, NA)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
x[good]
y[good]

# Example remove NA from Data Frame
airquality[1:6, ]   # first 6 rows
# only want rows w/ no NA, aka rows like row 1-4
good <- complete.cases(airquality)
airquality[good, ][1:6, ]   # filter good rows, then show first 6 rows
### Vectorized Operations ====
# easy to use on command line
# Many operations in R are vectorized making code more efficient, concise, and easier to read.
x <- 1:4; y <- 6:9
# to add 1st element of x to y, 2nd element of x to y etc
# arithmetic operations
x + y       # no need for loops like other languages  :D
x * y
x / y

# returns logic vector
x > 2
x >= 2
y == 8

# Vectorized Matrix Operations
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)   # two 2x2 matrix
x * y     # element-wise multiplication
x / y     # element-wise multiplication
x %*% y   # true matrix multiplication