### part 3
## takes a directory of data files and a threshold for complete cases 
## and calculates the correlation between sulfate and nitrate 
## for monitor locations
## where the number of completely observed cases (on all variables)
## is greater than the threshold. 
# The function should return a vector of correlations for the monitors 
# that meet the threshold requirement. 
# If no monitors meet the threshold requirement, 
# then the function should return a numeric vector of length 0. 
corr <- function(directory, threshold = 0){
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the 
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    cor_sulf_nit <- numeric(0) # numeric vector to be return
    
    df_complete <- complete(directory) # use default, read all files
    df_complete <- df_complete[df_complete$nobs > threshold, ]
    
    # df_complete not empty
    if(nrow(df_complete) > 0) {
        for(monitor in df_complete$id){
            filePath <- paste(directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
            df_data <- read.csv(filePath)
            df_data <- df_data[complete.cases(df_data), ] # remove NA values
            sulfate <- df_data[["sulfate"]]
            nitrate <- df_data[["nitrate"]]
            cor_sulf_nit <- c(cor_sulf_nit, cor(sulfate, nitrate))
        }
    }
    
    cor_sulf_nit
}