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

### next ====
# used to skip an iteration of a loop
for(i in 1:100) {
  if (i <= 20) {
    # Skip the first 20 iterations
    next
  }
  # Do something here
}

# `return` signals that a function should exit and return a given value