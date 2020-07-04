### str ====
str(str)
str(lm)

# Example 1: numeric vector
x <- rnorm(100, 2, 4)
summary(x)  # shows the: min, 1st quad, median, mean, 3rd quad, max
str(x)      # shows it is a numeric vector, with 100 elements, and first 5 values

# Example 2: factor
f <- gl(40, 10)
summary(f)  # not as useful
str(f)      #  Factor w/ 40 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...

# Example 3: data frame
library(datasets)
head(airquality)    # shows first 6 rows
# shows it is a data frame, no of rows and columns,
# type of each column and first 10 values of each column
str(airquality)     

# Example 4: matrix
m <- matrix(rnorm(100), 10, 10)
str(m) # shows it has 10 rows and 10 columns, and some values of the first column

# Example 5: list and split()
s <- split(airquality, airquality$Month) # a list with 5 data frames (of 5 months)
str(s) # shows list of 5 data frame, and details of each data frame

### Generating Random Numbers ====
## Setting the random number seed with set.seed ensures reproducibility
set.seed(1)
rnorm(5) # [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
rnorm(5) # [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884
set.seed(1)
rnorm(5) # [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

## Generating Poisson data
rpois(10, 1) # [1] 3 0 1 0 0 1 0 1 2 0
rpois(10, 2) # [1] 2 2 2 1 3 2 3 0 3 2
rpois(10, 20) # [1] 24 23 20 11 22 24 16 17 18 17

# eg find Pr(x <= 2), x is a Poisson random variable
# is cumulative distribution
ppois(2, 2) # [1] 0.6766764 , Pr(x <= 2)
ppois(4, 2) # [1] 0.947347 , Pr(x <= 4)
ppois(6, 2) # [1] 0.9954662 , Pr(x <= 6)

### Generate Random Numbers from a Linear Model ====
# Example 1: Stimulate from linear model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -6.4084 -1.5402  0.6789  0.6893  2.9303  6.5052 
plot(x, y) # clear linear trend

# Example 2: x is binary
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -3.4936 -0.1409  1.5767  1.4322  2.8397  6.9410 
plot(x, y) # looks different, but still has a linear trend

# Example 3: linear model with Poisson distribution
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    1.00    1.00    1.55    2.00    6.00 
plot(x, y) # as x increase, y increase, so linear trend
### Random Sampling ====
set.seed(1)
sample(1:10, 4) # [1] 9 4 7 1
sample(1:10, 4) # [1] 2 7 3 6
sample(letters, 5) # [1] "r" "s" "a" "u" "w"

# permutation
sample(1:10) # [1] 10  6  9  2  1  5  8  4  3  7
sample(1:10) # [1]  5 10  2  8  6  1  4  3  9  7

sample(1:10, replace = TRUE) # [1]  3  6 10 10  6  4  4 10  9  7

### system.time() ====
## Example 1: Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
# user system elapsed
# 0.004 0.002 0.431
# more time spent waiting for data to come back from network

## Example 2: Elapsed time < user time
hilbert <- function(n) {
    i <- 1:n
    1 / outer(i - 1, i, "+")
}
x <- hilbert(1000)
system.time(svd(x))
# user system elapsed
# 1.605 0.094 0.742 
# elapsed (0.7) < user (1.6), as the lib split computation across 2 cores

## Example 3: no multi-thread, no network activity, thus user == elapsed
system.time({
    n <- 1000
    r <- numeric(n)
    for (i in 1:n) {
        x <- rnorm(n)
        r[i] <- mean(x)
    }
})
## user system elapsed
## 0.097 0.002 0.099
