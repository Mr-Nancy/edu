getDataFromXML <- function() {
  library(XML)
  fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
  doc <- xmlInternalTreeParse(fileUrl)
  rootNode <- xmlRoot(doc)
  xmlName(rootNode)
  names(rootNode)
  
  rootNode[[1]][[1]]
  
  zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
  table(zipcode == 21231)
  
  # FALSE  TRUE 
  # 1200   127
  
  # XPath
  #xpathSApply(rootNode, "//name", xmlValue)
  #xpathSApply(rootNode, "//price", xmlValue)
  
}