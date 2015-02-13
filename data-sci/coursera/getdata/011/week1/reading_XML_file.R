getDataFromXML <- function() {
  library(XML)
  fileUrl <- "http://www.w3schools.com/xml/simple.xml"
  doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
  rootNode <- xmlRoot(doc)
  xmlName(rootNode)
  names(rootNode)
  
  rootNode[[2]][[1]]
  
  xmlSApply(rootNode, xmlValue)
  
  # XPath
  xpathSApply(rootNode, "//name", xmlValue)
  xpathSApply(rootNode, "//price", xmlValue)
  
}

getDataByAttributes <- function() {
  fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore_ravens"
  doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
  
  scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
  teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
  
  
  
}