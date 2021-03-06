#setwd("E:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\week3")
#setwd("D:\\work\\workspace\\edu\\edu\\data-sci\\coursera\\getdata\\011\\week3")

if (!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/restaurants.csv", method="internal")

restData <- read.csv("./data/restaurants.csv")

head(restData, n=3)
tail(restData, n=3)

summary(restData)
str(restData)
quantile(restData$councilDistrict, na.rm=TRUE)
quantile(restData$councilDistrict, probs=c(0.5, 0.75, 0.9))

table(restData$zipCode, useNA="ifany")
table(restData$councilDistrict, restData$zipCode)

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# Row and Column sums
colSums(is.na(restData))
colSums(!is.na(restData))
all(colSums(is.na(restData)) == 0)
all(colSums(!is.na(restData)) == 0)

# Values with specific characteristics
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212", "21213"))
restData[restData$zipCode %in% c("21212", "21213"), ]

# Cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

# Flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~., data=warpbreaks)
xt
ftable(xt)

# Size of Data Set
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")