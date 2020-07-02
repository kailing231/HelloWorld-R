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
