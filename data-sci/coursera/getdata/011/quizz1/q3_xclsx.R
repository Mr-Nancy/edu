url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
inPath <- file.path(getwd(), "./data/q3.xlsx")
download.file(url, inPath, mode = "wb")
dat <- read.xlsx(inPath, 1, rowIndex = 18:23, colIndex =  7:15)

sum(dat$Zip * dat$Ext, na.rm = T)

# [1] 36534720
