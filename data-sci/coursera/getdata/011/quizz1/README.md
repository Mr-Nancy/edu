Quizz 1
===========

# Preparation: install and load libraries [https://gist.github.com/stevenworthington/3178163]


```r
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE, quietly = TRUE)
}

# usage
packages <- c("data.table", "xlsx", "XML")
ipak(packages) 
```