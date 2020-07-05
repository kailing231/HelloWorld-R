### 4. Ranking hospitals in all states

# takes two arguments: 
# an outcome name (outcome) 
# and a hospital ranking (num). 

# The function reads the outcome-of-care-measures.csv file 
# and returns a 2-column data frame containing the hospital in each state 
# that has the ranking specified in num. 

# For example the function call rankall("heart attack", "best") 
# would return a data frame containing the names of the hospitals 
# that are the best in their respective states for 30-day heart attack death rates. 

# The function should return a value for every state (some may be NA). 
# The first column in the data frame is named hospital, which contains the hospital name, 
# and the second column is named state, which contains the 2-character abbreviation for the state name. 

# Hospitals that do not have data on a particular outcome 
# should be excluded from the set of hospitals when deciding the rankings.

# Handling ties. 
# The rankall function should handle ties in the 30-day mortality rates 
# in the same way that the rankhospital function handles ties.

rankall <- function(outcome, num = "best") {
    ## Read outcome data ====
    df_outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid ====
    outcome <- tolower(outcome) # is always all lowercase
    # check if outcome is valid
    if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop("invalid outcome")
    }
    
    # set colIndex
    colIndex <- integer(0)
    if(outcome == "heart attack") {
        # Hospital 30-Day Death (Mortality) Rates from Heart Attack
        colIndex <- 11
    } else if (outcome == "heart failure") {
        # Hospital 30-Day Death (Mortality) Rates from Heart Failure
        colIndex <- 17
    } else if (outcome == "pneumonia") {
        # Hospital 30-Day Death (Mortality) Rates from Pneumonia
        colIndex <- 23
    }
    
    ## For each state, find the hospital of the given rank ====
    # update rate to numeric from character
    df_outcome[, colIndex] <- as.numeric(df_outcome[, colIndex])
    # remove NA
    df_outcome <- df_outcome[complete.cases(df_outcome), ]
    
    # order columns: state, outcome and hospital name, desired result at top
    bestHospitals <- df_outcome[order(df_outcome$State,
                                      df_outcome[, colIndex],
                                      df_outcome$Hospital.Name),]
    
    # rank hospitals by state in ascending order and the num
    stateLevels <- factor(bestHospitals$State)
    # ranks is an array of character (hospital name),
    # where names() is the state in ascending order
    ranks <- NULL
    # x in anonymous function is all hospital names of a state
    if(num == "best") {
        ranks <-
            tapply(bestHospitals$Hospital.Name, stateLevels, function(x) {
                return(x[1])
            })
    } else if (num == "worst") {
        ranks <-
            tapply(bestHospitals$Hospital.Name, stateLevels, function(x) {
                return(x[length(x)])
            })
    } else {
        ranks <-
            tapply(bestHospitals$Hospital.Name, stateLevels, function(x) {
                return(x[num])
            })
    }
    
    ## Return a data frame with the hospital names and the (abbreviated) state name ====
    data.frame(hospital = ranks,
               state = names(ranks))
}
