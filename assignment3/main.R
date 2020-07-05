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

### Quiz ====
source("best.R")
source("rankhospital.R")
source("rankall.R")

# Q1 
best("SC", "heart attack") # "MUSC MEDICAL CENTER"

# Q2 
best("NY", "pneumonia") # "MAIMONIDES MEDICAL CENTER"

# Q3
best("AK", "pneumonia") # "YUKON KUSKOKWIM DELTA REG HOSPITAL"

# Q4
rankhospital("NC", "heart attack", "worst") # "WAYNE MEMORIAL HOSPITAL"

# Q5
rankhospital("WA", "heart attack", 7) # "YAKIMA VALLEY MEMORIAL HOSPITAL"

# Q6
rankhospital("TX", "pneumonia", 10) # "SETON SMITHVILLE REGIONAL HOSPITAL"

# Q7
rankhospital("NY", "heart attack", 7) #  "BELLEVUE HOSPITAL CENTER"

# Q8
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital) # "CASTLE MEDICAL CENTER"

# Q9
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital) # "BERGEN REGIONAL MEDICAL CENTER"

# Q10
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital) # "RENOWN SOUTH MEADOWS MEDICAL CENTER"
