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
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv]
and load the data into R. The code book, describing the variable names is here: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf]

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

