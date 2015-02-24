# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# Load the educational data from this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?
# Original data sources:
# http://data.worldbank.org/data-catalog/GDP-ranking-table
# http://data.worldbank.org/data-catalog/ed-stats

library(data.table)
library(dplyr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="./data/q3_gdp.csv", method="internal")
gdp <- data.table(read.csv("./data/q3_gdp.csv", skip=4, nrows=215))
setnames(gdp, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile="./data/q3_edu.csv", method="internal")
edu <- data.table(read.csv("./data/q3_edu.csv"))

data <- merge(gdp, edu, all=TRUE, by=c("CountryCode"))
sum(!is.na(unique(data$rankingGDP)))
# [1] 189

data[order(rankingGDP, decreasing=TRUE), list(CountryCode, Long.Name.x, Long.Name.y, rankingGDP, gdp)][13]
#    CountryCode         Long.Name.x         Long.Name.y rankingGDP   gdp
# 1:         KNA St. Kitts and Nevis St. Kitts and Nevis        178  767 

# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
data[, mean(rankingGDP, na.rm=TRUE), by=Income.Group]

# Income.Group        V1
# 1:                   NA 131.00000
# 2: High income: nonOECD  91.91304
# 3:           Low income 133.72973
# 4:  Lower middle income 107.70370
# 5:  Upper middle income  92.13333
# 6:    High income: OECD  32.96667
# 7:                            NaN


# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?
breaks <- quantile(dt$rankingGDP, probs=seq(0, 1, 0.2), na.rm=TRUE)
data$quantileGDP <- cut(dt$rankingGDP, breaks=breaks)
data[Income.Group == "Lower middle income", .N, by=c("Income.Group", "quantileGDP")]

#    Income.Group         quantileGDP  N
# 1: Lower middle income (38.8,76.6]  13
# 2: Lower middle income   (114,152]   8
# 3: Lower middle income   (152,190]  16
# 4: Lower middle income  (76.6,114]  12
# 5: Lower middle income    (1,38.8]   5
# 6: Lower middle income          NA   2
