getDataFromXML <- function() {
  library(XML)
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
  rootNode <- xmlRoot(doc)
  xmlName(rootNode)
  names(rootNode)
  
  rootNode[[2]][[1]]
  
  xmlSApply(rootNode, xmlValue)
  
  # XPath
  #xpathSApply(rootNode, "//name", xmlValue)
  #xpathSApply(rootNode, "//price", xmlValue)
  
}