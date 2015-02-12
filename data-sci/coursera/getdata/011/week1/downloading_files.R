# setwd("D:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\week1")
create_dir <- function () {
  if (!file.exists('data')) {
    dir.create('data')
  } else {
    "Directory exists"
  }
}