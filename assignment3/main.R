### 1. Plot the 30-day mortality rates for heart attack ====
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])

# added graph details
hist(outcome[, 11],
     xlab = "Deaths",
     main = "Hospital 30-Day Death (Mortality) Rates from Heart Attack",
     col = 2)