# setwd("D:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\quizz3")

if (!file.exists('data')) { dir.create('data') }

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/q1.csv", method="internal")

data <- read.csv("./data/q1.csv")

agricultureLogical <- data$ACR == 3 & data$AGS == 6
which(agricultureLogical)[1:3]
