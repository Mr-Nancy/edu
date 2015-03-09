# setwd("E:\\Work\\workspace\\edu\\edu\\data-sci\\coursera\\rprog\\012\\quizz1")
# setwd("D:\\Work\\workspace\\edu\\edu\\data-sci\\coursera\\rprog\\012\\quizz1")

# Q1: The R language is a dialect of which of the following programming languages?
# A: S

# Q2: The definition of free software consists of four freedoms (freedoms 0 through 3). 
# Which of the following is NOT one of the freedoms that are part of the definition?
# A: The freedom to prevent users from using the software for undesirable purposes.

# Q3: In R the following are all atomic data types EXCEPT 
# A: list

# Q4: If I execute the expression x <- 4 in R, what is the class of the object `x' 
# as determined by the `class()' function?
x <- 4L
class(x)
# [1] "integer"

# Q5: What is the class of the object defined by the expression x <- c(4, "a", TRUE)?
x <- c(4, "a", TRUE)
class (x)
# [1] "character"

# Q5: What is the class of the object defined by x <- c(4, TRUE)?
x <- c(4, TRUE)
class(x)

# Q6: If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by 
# the expression cbind(x, y)?
x <- c(1,3, 5) 
y <- c(3, 2, 10)
cbind(x, y)   # bind vectors as columns ofa new matrix
class(cbind(x, y))
# x  y
# [1,] 1  3
# [2,] 3  2
# [3,] 5 10

# [1] "matrix"
# A: a matrix with 2 columns and 3 rows

# Q7: A key property of vectors in R is that
# A: elements of a vector all must be of the same class

# Q8: Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me?
x <- list(2, "a", "b", TRUE)
x[[1]]
# [1] 2
# A: a numeric vector of length 1.

# Q8: Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me?
x <- list(2, "a", "b", TRUE)
x[[2]]
# [1] "a"
# A: a character vector of length 1.

# Q9: Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?
x <- 1:4
y <- 2
x + y
# [1] 3 4 5 6

# Q9: Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?
x <- 1:4
y <- 2:3
x + y
# [1] 3 5 5 7


# Q10: Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this 
# vector that are less than 6 to be equal to zero. What R code achieves this? 
x <- c(3, 5, 1, 10, 12, 6)
x[x %in% 1:5] <- 0
x
# [1]  0  0  0 10 12  6

data<-read.csv("data/hw1_data.csv")

# Q11: In the dataset provided for this Quiz, what are the column names of the dataset?
head(data, n = 1)
#   Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# A: Ozone, Solar.R, Wind, Temp, Month, Day

# Q12: Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
head(data, n = 2)

#   Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2

#Q13: How many observations (i.e. rows) are in this data frame?
nrow(data)
# [1] 153

# Q14: Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(data, n=2)
#     Ozone Solar.R Wind Temp Month Day
# 152    18     131  8.0   76     9  29
# 153    20     223 11.5   68     9  30

# Q15: What is the value of Ozone in the 47th row?
data$Ozone[47]
# [1] 21

# Q16: How many missing values are in the Ozone column of this data frame?
length(data$Ozone[is.na(data$Ozone)])
# [1] 37

# Q17: What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(data$Ozone[!is.na(data$Ozone)])
# [1] 42.12931

# Q18: Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. 
# What is the mean of Solar.R in this subset?
d <- data[data$Ozone>31 & data$Temp>90,]
mean(d$Solar.R[!is.na(d$Solar.R)])
# [1] 212.8

# Q19: What is the mean of "Temp" when "Month" is equal to 6? 
d <- data[data$Month == 6,]
mean(d$Temp[!is.na(d$Temp)])
# [1] 79.1

# Q20: What was the maximum ozone value in the month of May (i.e. Month = 5)?
d <- data[data$Month == 5,]
max(d$Ozone[!is.na(d$Ozone)])
# [1] 115


