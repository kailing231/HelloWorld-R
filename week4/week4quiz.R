### Q1 ====
set.seed(1)
rpois(5, 2)

### Q2 ====
# What R function can be used to generate standard Normal random variables?
?rnorm

### Q4 ====
# Which function can be used to evaluate the 
# inverse cumulative distribution function for the Poisson distribution?
?qpois

### Q5 ====
set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

### Q6 ====
# What R function can be used to generate Binomial random variables?
?rbinom

### Q8 ====
y <- 1; x1 <- 2; x2 <-3

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)

summaryRprof()