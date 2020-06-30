### load 'iris' dataset ====
library(datasets)
data(iris)

### Q1 ====
# what is the mean of 'Sepal.Length' for the species virginica
df_virginica <- subset(iris, Species == "virginica")
# method 1
summary(df_virginica) 
# method 2
mean(df_virginica$Sepal.Length) # 6.588

### Q2 ====
# what returns a vector of the means of the variables
# 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'
sapply(iris[,1:4], mean) # my answer

## list of MCQ:
colMeans(iris) # Error in colMeans(iris) : 'x' must be numeric

apply(iris[, 1:4], 2, mean) # ANSWER, mean of each column

apply(iris, 1, mean) # included $Species

rowMeans(iris[,1:4]) # 150 means of 150 rows

apply(iris[, 1:4], 1, mean) # (150) mean of each (150) row

apply(iris, 2, mean) # included $Species

### load 'mtcars' dataset ====
library(datasets)
data(mtcars)

#### Q3  ====
# calculate the avg miles per gallon (mpg) by number of cylinders in the car (cyl) 
tapply(mtcars$mpg, mtcars$cyl, mean) # my answer

## list of MCQ:
split(mtcars, mtcars$cyl) # split data but did not calculate mean

mean(mtcars$mpg, mtcars$cyl) # incorrect way to use mean()

apply(mtcars, 2, mean) # calculate mean of each column of mtcars

tapply(mtcars$mpg, mtcars$cyl, mean) # ANSWER, calculate mean of mpg split by cyl

lapply(mtcars, mean) # calculate mean of each column of mtcars

tapply(mtcars$cyl, mtcars$mpg, mean) # calculate mean of cyl split by mpg

with(mtcars, tapply(mpg, cyl, mean)) # ANSWER

sapply(split(mtcars$mpg, mtcars$cyl), mean) # ANSWER, split mpg by cyl, then apply mean

sapply(mtcars, cyl, mean) # incorrect "syntax"

#### Q4 ====
# what is the absolute difference between 
# the average horsepower of 4-cylinder cars and 
# the average horsepower of 8-cylinder cars
df_4cyl <- subset(mtcars, cyl == 4)
df_8cyl <- subset(mtcars, cyl == 8)
mean(df_8cyl$hp, na.rm = TRUE) - mean(df_4cyl$hp, na.rm = TRUE) # 126.5779

#### Q5 ====
debug(ls)