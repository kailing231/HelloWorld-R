### if/else ====
# usual way
if (x > 3) {
  y <- 10
} else {
  y <- 0
}


# another valid if/else structure
y <- if (x > 3) {
  10
} else {
  0
}

### for loop ====
## Example: 3 loops with same behavior
x <- c("a", "b", "c", "d")

# Example 1
for (i in 1:4) {
  print(x[i])
}

# Example 2
for (i in seq_along(x)) {
  print(x[i])
}

# Example 3
for (letter in x) {
  print(letter)
}

# Example 1 but since its one line, no need brackets
for (i in 1:4)
  
  print(x[i])

### while loop ====
# Example
z <- 5
while (z >= 3 && z <= 10) { # conditions are always checked from left to right
  print(z)
  coin <- rbinom(1, 1, 0.5) # "coin flip", either return 0 or 1
  
  if (coin == 1) {
    ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}

### repeat loop ====
# infinite loop,only way to exit a repeat loop is to call break
# usually in algo
# a bit dangerous because there’s no guarantee it will stop
# Better to set a hard limit on the number of iterations (e.g. using a for loop)
# and then report whether convergence was achieved or not
x0 <- 1
tol <- 1e-8

repeat {
  x1 <- computeEstimate() # NOTE: computeEstimate() is not a real function
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

### next and return ====
# used to skip an iteration of a loop
for(i in 1:100) {
  if (i <= 20) {
    # Skip the first 20 iterations
    next
  }
  # Do something here
}

# `return` signals that a function should exit and return a given value

### Lazy Evaluation ====
# Arguments to functions are evaluated lazily, so they are evaluated only as needed.

## Example 1, no "error" as nothing actually went wrong
f <- function(a, b) {
  a ^ 2
}
f(2)

## Example 2, error only occurs at print(b)
f <- function(a, b) {
  print(a)
  print(b)
}
f(45)

### "..." Argument ====
# indicates a variable number of arguments that are usually passed on to other functions.
# often used when extending another function
# and you don’t want to copy the entire argument list of the original function

## Example 1, specify type = "l" instead of default type = "p"
myplot <- function(x, y, type = "l", ...) {
  plot(x, y, type = type, ...)
}

# The ... argument is also necessary when the number of arguments
# passed to the function cannot be known in advance.
## Example 2, there is no way to know how many variables will be passed in for paste()
args(paste)
args(cat)

# any arguments that appear after ... on the argument list must be named explicitly
# and cannot be partially matched
## Example 3, partial matching is ignored
paste("a", "b", se = ":")

### Lexical Scoping ====
## Example 1, a function that creates and return a function
make.power <- function(n) {
  pow <- function(x) {
    x ^ n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

## Exploring a Function Closure
ls(environment(cube))
get("n", environment(cube))

ls(environment(square))         # same as cube()
get("n", environment(square))   # but n = 2 instead of n = 3

### Lexical vs. Dynamic Scoping ====
y <- 10

# variables y and g are free variable
f <- function(x) {
  y <- 2
  y ^ 2 + g(x)
}

# variable y  g is a free variable
g <- function(x) {
  x * y # the value of y here, ignore value of y in f()
}

f(3)
# Steps:
# in f(), y ^ 2 + g(x) == 2 ^ 2 + g(x) == 4 + g(x)
# in g(), x * y == 3 * 10 == 30
# back to f(), 4 + g(x) == 4 + 30 == 34