### part 1
## calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'.
# Given a vector monitor ID numbers,
# 'pollutantmean' reads that monitors' particulate matter data
# from the directory specified in the 'directory' argument
# and returns the mean of the pollutant across all of the monitors,
# ignoring any missing values coded as NA.
# Example: pollutantmean("specdata", "sulfate", 1:10)
pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of  the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    means <- NULL # vector to contain all pollutant value of all monitors
    for (monitor in id) {
        # Example filePath: "specdata/001.csv"
        filePath <- paste(directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
        df_data <- read.csv(filePath)
        means <- c(means, df_data[[pollutant]])
    }
    mean(means, na.rm = TRUE)
}