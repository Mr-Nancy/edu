cameraData <- read.table("./data/camera.csv", sep = ",", header = TRUE)
head(cameraData)
cameraDataCsv <- read.csv("./data/camera.csv") # sep = "," and header = TRUE by default in read.csv
head(cameraDataCsv)
cameraDataFrame <- read.csv("./data/camera.csv", quote="", na.strings="NOT_AVAILABLE", nrows=3, skip=25)
head(cameraDataFrame)