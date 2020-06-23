### part 2
## reads a directory full of files 
## and reports the number of completely observed cases in each data file. 
# The function should return a data frame 
# where the first column is the name of the file 
# and the second column is the number of complete cases.
complete <- function(directory, id = 1:332){
    ## 'director' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the from:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    df_result <- data.frame(id=numeric(0), nobs=numeric(0)) # data frame to be return
    for(monitor in id){
        filePath <- paste(directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
        df_data <- read.csv(filePath)
        df_complete <- df_data[complete.cases(df_data), ] # data frame of complete cases
        nobs <- nrow(df_complete) # get no of rows
        df_result <- rbind(df_result, data.frame(id=monitor, nobs=nobs))
    }
    df_result
}