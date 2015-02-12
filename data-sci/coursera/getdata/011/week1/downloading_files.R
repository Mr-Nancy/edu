# setwd("D:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\week1")
# setwd("E:\\Work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\week1")
create_dir <- function () {
  if (!file.exists('data')) {
    dir.create('data')
  } else {
    "Directory exists"
  }
}

download <- function () {
  create_dir()
  
  fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
  #download.file(fileUrl, destfile="./data/camera.csv", method="curl")
  download.file(fileUrl, destfile="./data/camera.csv", method="internal")
  list.files(".")
  
  date_downloaded <- date()
  date_downloaded
}