# Data frame is a key data structure in statistics and in R
# Meets TIDY DATA DEMANDS

#setwd("E:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\week3")
#setwd("D:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\week3")

library (dplyr)

if (!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/restaurants.csv", method="internal")

restData <- read.csv("./data/restaurants.csv")

dim(restData)
str(restData)

# 'data.frame':  1327 obs. of  6 variables:
# $ name           : Factor w/ 1277 levels "#1 CHINESE KITCHEN",..: 9 3 992 1 2 4 5 6 7 8 ...
# $ zipCode        : int  21206 21231 21224 21211 21223 21218 21205 21211 21205 21231 ...
# $ neighborhood   : Factor w/ 173 levels "Abell","Arlington",..: 53 52 18 66 104 33 98 133 98 157 ...
# $ councilDistrict: int  2 1 1 14 9 14 13 7 13 1 ...
# $ policeDistrict : Factor w/ 9 levels "CENTRAL","EASTERN",..: 3 6 6 4 8 3 6 4 6 6 ...
# $ Location.1     : Factor w/ 1210 levels "1 BIDDLE ST\nBaltimore, MD\n",..: 835 334 554 755 492 537 505 530 507 569 ...

names(restData)
# [1] "name"            "zipCode"         "neighborhood"    "councilDistrict" "policeDistrict"  "Location.1"     

head(select(restData, name:neighborhood))
#                     name zipCode neighborhood
# 1                   410   21206    Frankford
# 2                  1919   21231  Fells Point
# 3                 SAUTE   21224       Canton
# 4    #1 CHINESE KITCHEN   21211      Hampden
# 5 #1 chinese restaurant   21223     Millhill
# 6             19TH HOLE   21218 Clifton Park
head(select(restData, -(name:neighborhood)))
i <- match("name", names(restData))
j <- match("neighborhood", names(restData))
head(restData[, i:j])

# Filters
rest.f <- filter(restData, neighborhood == "Frankford")
head(rest.f, 100)

rest.f <- filter(restData, councilDistrict == 2 & zipCode == "21224")
head(rest.f, 10)


# Arrange
head(arrange(restData, zipCode), 10)
head(arrange(restData, desc(zipCode)), 10)

# Rename
head(rename(restData, zip = zipCode, police = policeDistrict))
