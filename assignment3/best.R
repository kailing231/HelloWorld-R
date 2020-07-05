### 2. Finding the best hospital in a state

# take two arguments: 
# the 2-character abbreviated name of a state 
# and an outcome name. 

# The function reads the outcome-of-care-measures.csv file 
# and returns a character vector with the name of the hospital 
# that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state. 

# The hospital name is the name provided in the Hospital.Name variable. 
# The outcomes can be one of "heart attack", "heart failure", or "pneumonia". 

# Hospitals that do not have data on a particular outcome 
# should be excluded from the set of hospitals when deciding the rankings.

# Handling ties. 
# If there is a tie for the best hospital for a given outcome, 
# then the hospital names should be sorted in alphabetical order 
# and the first hospital in that set should be chosen 
# (i.e. if hospitals "b", "c", and "f" are tied for best, 
# then hospital "b" should be returned)

best <- function(state, outcome) {
    ## Read outcome data
    df_outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    state <- toupper(state) # $State is always all uppercase
    # check if state is valid
    if (!state %in% unique(df_outcome$State)) {
        stop("invalid state")
    }
    
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
    
    ## Return hospital name in that state with lowest 30-day death rate
    # filter state
    df_outcome <- df_outcome[df_outcome$State == state, ] 
    # update rate to numeric from character
    df_outcome[, colIndex] <- as.numeric(df_outcome[, colIndex])
    # remove NA
    df_outcome <- df_outcome[complete.cases(df_outcome), ]
    
    # order columns: colIndex and hospital name, desired result at top
    bestHospitals <- df_outcome[order(df_outcome[,colIndex],
                                  df_outcome$Hospital.Name), ]
    
    bestHospitals$Hospital.Name[1]
}
