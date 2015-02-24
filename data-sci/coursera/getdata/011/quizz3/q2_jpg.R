# Using the jpeg package read in the following picture of your instructor into R
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)

library (jpeg)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile="./data/q2.jpg", method="internal")

img <- readJPEG("./data/q2.jpg", native=TRUE)
quantile(img, probs=c(0.3, 0.8))

#       30%       80% 
#     -15259150 -10575416