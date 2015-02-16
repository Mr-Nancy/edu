library(data.table)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
inPath <- file.path(getwd(), "data/q5.csv")
download.file(fileUrl, inPath, method="internal")

DT <- fread(inPath)


DT[,mean(pwgtp15),by=SEX]