Quizz 1
===========

### Goal
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv]
and load the data into R. The code book, describing the variable names is here: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf]

How many properties are worth $1,000,000 or more? 


### Preparation: install and load libraries 

```r
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE, quietly = TRUE)
}

# usage
packages <- c("data.table", "xlsx", "XML")
ipak(packages) 
```
[https://gist.github.com/stevenworthington/3178163]



