library(sqldf)

download <- function () {
  create_dir()
  
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileUrl, destfile="./data/q1.csv", method="internal")
  list.files(".")
  
  date_downloaded <- date()
  date_downloaded
}

download()

# The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL. 
# Download the American Community Survey data (https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv) and load it into an R object called acs
acs <- read.table("./data/q1.csv", sep = ",", header = TRUE)

# Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select wgtp77 from acs where REGION = 4")

# Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)
sqldf("select distinct AGEP from acs")
sqldf("select distinct REGION from acs")

# The problem: PWGTP1 and AGEP don't exist in downloaded *.csv

