### Q1 ====
cube <- function(x, n) {
    x^3
}
cube(3)

### Q2 ====
x <- 1:10
if(x > 5) {
    x <- 0
}

### Q3 ====
f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}
z <- 10
f(3)
## Steps:
# in f(), x + g(x) == 3 + g(3)
# in g(), y + z == 3 + z == 3 + 4 == 7
# in f(), 3 + g(3) == 3 + 7 == 10

### Q4 ====
x <- 5
y <- if(x < 3) {
    NA
} else {
    10
}
y

### Q5 ====
h <- function(x, y = NULL, d = 3L) {
    z <- cbind(x, d)
    if(!is.null(y))
        z <- z + y
    else
        z <- z + f
    g <- x + y / z
    if(d == 3L)
        return(g)
    g <- g + 10
    g
}
# NOT free variable: x,y,d,z,g
# free variable: f