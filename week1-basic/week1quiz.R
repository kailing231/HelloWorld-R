### Q1-10 ====
# Q4
x <- 4
class(x)

x<-4L
class(x)

# Q5
x <- c(4, TRUE)
x <- c(4, "a", TRUE)
class(x)

# Q6
x <- c(1,3, 5); y <- c(3, 2, 10)
cbind(x, y)

# Q8
x <- list(2, "a", "b", TRUE)
result <- x[[2]]
class(x[[2]])

# Q9
x <- 1:4; y <- 2
result <- x + y

x <- 1:4; y <- 2:3
result <- x + y

# Q10
x <- c(3, 5, 1, 10, 12, 6)
# set all elements of this vector that are < 6 to be equal to zero
x[x < 6] <- 0
x[x <= 5] <- 0
x[x %in% 1:5] <- 0  # %in% operator, to identify if an element belongs to a vector

x <- c(17, 14, 4, 5, 13, 12, 10)
# set all elements of this vector that are > 10 to be equal to 4
x[x > 10] <- 4
x[x >= 11] <- 4

### Use the Week 1 Quiz Data Set to answer questions 11-20. ====
df_data <- read.csv("data/hw1_data.csv")

# Q12 Extract the first 2 rows of the data frame and print them to the console
df_data[1:2, ]

# Q14 Extract the last 2 rows of the data frame and print them to the console
df_data[(nrow(df_data)-1):nrow(df_data), ]
df_data[152:153, ]

# Q15 What is the value of Ozone in the 47th row?
df_data[47, ]$Ozone

# Q16 How many missing values are in the Ozone column of this data frame?
summary(df_data)
table(is.na(df_data$Ozone))

# Q17 What is the mean of the Ozone column in this dataset?
# Exclude missing values (coded as NA) from this calculation.
summary(df_data)
mean(df_data$Ozone, na.rm = TRUE)

# Q18 Extract the subset of rows of the data frame 
# where Ozone values are above 31 and Temp values are above 90. 
# What is the mean of Solar.R in this subset?
df_18 <- subset(df_data, subset = (Ozone > 31 & Temp > 90))
summary(df_18)
mean(df_18$Solar.R, na.rm = TRUE)

# Q19 What is the mean of "Temp" when "Month" is equal to 6?
df_19 <- subset(df_data, subset = (Month == 6))
summary(df_19)
mean(df_19$Temp, na.rm = TRUE)

# Q20 What was the max ozone value in the month of May (i.e. Month is equal to 5)?
df_20 <- subset(df_data, subset = (Month == 5))
summary(df_20)
max(df_20$Ozone, na.rm = TRUE)