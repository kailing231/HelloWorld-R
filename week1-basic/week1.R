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

# Missing Values ====
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
