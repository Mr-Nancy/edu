create_dir <- function () {
  if (!file.exists('data')) {
    dir.create('data')
  } else {
    "Directory exists"
  }
}

downloadExcel <- function () {
  create_dir()
  
  fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
  #download.file(fileUrl, destfile="./data/camera.xlsx", method="curl")
  download.file(fileUrl, destfile="./data/camera.xlsx", method="internal")
  list.files(".")
  
  date_downloaded <- date()
  date_downloaded
}

getDataFromXLSX <- function() {
  library(xlsx)
  cameraData <- read.xlsx("./data/cameras.xlsx")
  head(cameraData)
}