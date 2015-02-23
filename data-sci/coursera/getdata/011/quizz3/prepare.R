# setwd("D:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\quizz3")
# setwd("E:\\Work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\quizz3")

create_dir <- function () {
  if (!file.exists('data')) {
    dir.create('data')
  } else {
    "Directory exists"
  }
}