# setwd("D:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\quizz3")
# setwd("E:\\Work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\quizz3")

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE, quietly = TRUE)
}

create_dir <- function () {
  if (!file.exists('data')) {
    dir.create('data')
  } else {
    "Directory exists"
  }
}

# usage
packages <- c("data.table", "plyr")
ipak(packages) 

setInternet2(TRUE)

create_dir()