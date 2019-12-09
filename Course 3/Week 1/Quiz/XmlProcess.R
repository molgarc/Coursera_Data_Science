setwd("C:/EMNOMIA/Data Science Specialization/Courses/Course 3/Week 1/Quiz")
library(XML)
if (!file.exists("data")){
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
restDataFrame <- xmlTreeParse(sub("s", "", fileUrl), useInternal=TRUE)
##restDataFrame <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(restDataFrame)
xmlName(rootNode)
names(rootNode)
zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
rootNode[[1]]
rootNode[[1]][[1]]
rootNode[[1]][[1]][[1]]
all <- xmlSApply(rootNode, xmlValue)
sum(zip == 21231)