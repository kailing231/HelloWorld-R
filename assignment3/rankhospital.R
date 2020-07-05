### 3. Ranking hospitals by outcome in a state

# takes three arguments: 
# the 2-character abbreviated name of a state (state), 
# an outcome (outcome), 
# and the ranking of a hospital in that state for that outcome (num).

# The function reads the outcome-of-care-measures.csv file 
# and returns a character vector with the name of the hospital 
# that has the ranking specified by the num argument. 

# For example, the call rankhospital("MD", "heart failure", 5)
# would return a character vector containing the name of the hospital 
# with the 5th lowest 30-day death rate for heart failure. 

# The num argument can take values "best", "worst", 
# or an integer indicating the ranking (smaller numbers are better). 
# If the number given by num is larger than the number of hospitals in that state, 
# then the function should return NA. 

# Hospitals that do not have data on a particular outcome 
# should be excluded from the set of hospitals when deciding the rankings.

# Handling ties. 
# It may occur that multiple hospitals have the same 30-day mortality rate for a given cause of death. 
# In those cases ties should be broken by using the hospital name. 

rankhospital <- function(state, outcome, num = "best") {
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
    
    ## Return hospital name in that state with the given rank 30-day death rate
    # TODO
    # filter state
    df_filter <- df_outcome[df_outcome$State == state, ] 
    # update rate to numeric from character
    df_filter[, colIndex] <- as.numeric(df_filter[, colIndex])
    # remove NA
    df_filter <- df_filter[complete.cases(df_filter), ]
    
    # order columns: colIndex and hospital name, desired result at top
    df_filter <- df_filter[order(df_filter[,colIndex],
                                 df_filter$Hospital.Name), ]
    
    # return rank
    rank <- integer(0)
    if(num == "best"){
        rank <- 1
    } else if (num == "worst") {
        rank <- nrow(df_filter)
    } else {
        rank <- num
    }
    
    df_filter$Hospital.Name[rank]
}
