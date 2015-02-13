# setwd("D:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\quizz1")
# setwd("E:\\Work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\quizz1")
create_dir <- function () {
  if (!file.exists('data')) {
    dir.create('data')
  } else {
    "Directory exists"
  }
}

download <- function () {
  create_dir()
  
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  #download.file(fileUrl, destfile="./data/camera.csv", method="curl")
  download.file(fileUrl, destfile="./data/csv_data.csv", method="internal")
  list.files(".")
  
  date_downloaded <- date()
  date_downloaded
}

getData <- function() {
  read.table("./data/csv_data.csv", sep = ",", header = TRUE)
  
  # How many properties are worth $1,000,000 or more? 
  nrow(data[data$VAL==24 & !is.na(data$VAL), ])
}