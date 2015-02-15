con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes = T)
html
xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)


# GET from httr package
library(httr)
html2 = GET(url)
content2 = content(html2, as="text")

parsedHtml = content(html2, as="parsed")
parsedHtml2 = htmlParse(content2, asText = TRUE)

parsedHtml
parsedHtml2
identical(parsedHtml, parsedHtml2)

xpathSApply(html, "//title", xmlValue)

# Accessing websites with password
pg2 = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user", "passwd"))
pg2

names(pg2)

# Using handles
google = handle ("http://google.com")
pg1 = GET(handle=google, path="/")
pg2 = GET(handle=google, path="search")

pg1
pg2