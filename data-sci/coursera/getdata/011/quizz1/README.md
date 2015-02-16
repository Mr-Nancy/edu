Quizz 1
===========

### Preparation: install and load libraries 
--------------------------------------------

```r
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE, quietly = TRUE)
}

packages <- c("data.table", "xlsx", "XML")
ipak(packages) 
```
[Taken from there](https://gist.github.com/stevenworthington/3178163)

Fix URL reading for knitr. See [Stackoverflow](http://stackoverflow.com/a/20003380).

```r
setInternet2(TRUE)
```

### Question 1
--------------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv) <br>
and load the data into R. The code book, describing the variable names is here: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf)<br>
How many properties are worth $1,000,000 or more? 

#### Solution
Create directory for data:

```r
if (!file.exists('data')) {
  dir.create('data')
} else {
  "Directory exists"
}
```

Download and getting data:
```r
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/camera.csv", method="curl")  # Linux
download.file(fileUrl, destfile="./data/csv_data.csv", method="internal") # Windows

read.table("./data/csv_data.csv", sep = ",", header = TRUE)
```

Solution code
```r
nrow(data[data$VAL==24 & !is.na(data$VAL), ])
```
Output:
```bash
[1] 53
```
### Question 2
--------------
Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate? 

#### Solution
According to Codebook FES means 'Family type and employment status'. So it violates the rule 'Tidy data has one variable per column'

### Question 3
--------------
Download the Excel spreadsheet on Natural Gas Aquisition Program here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx)

Read rows 18-23 and columns 7-15 into R and assign the result to a variable called: 
```r
dat <- sum(dat$Zip*dat$Ext,na.rm=T)
```
(original data source: [http://catalog.data.gov/dataset/natural-gas-acquisition-program](http://catalog.data.gov/dataset/natural-gas-acquisition-program))

#### Solution

Download and getting data
```r
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
inPath <- file.path(getwd(), "data/q3.xlsx")
download.file(fileUrl, inPath, mode = "wb")
dat <- read.xlsx(inPath, 1, rowIndex = 18:23, colIndex =  7:15)
```

Solution code
```r
sum(dat$Zip * dat$Ext, na.rm = T)
```

Output
```bash
[1] 36534720
```

### Question 4
--------------
Read the XML data on Baltimore restaurants from here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml)

How many restaurants have zipcode 21231? 

#### Solution

Download and getting data
```r
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
```

Solution code
```r
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
table(zipcode == 21231)
```

Output:
```bash
FALSE  TRUE 
 1200   127
```

### Question 5
--------------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv)
using the fread() command load the data into an R object

```r
DT
```

Which of the following is the fastest way to calculate the average value of the variable

```r
pwgtp15
```

broken down by sex using the data.table package?
