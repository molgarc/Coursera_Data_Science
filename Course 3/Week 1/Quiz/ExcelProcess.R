setwd("C:/EMNOMIA/Data Science Specialization/Courses/Course 3/Week 1/Quiz")
library(xlsx)
if (!file.exists("data")){
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/naturalGas.xlsx", mode='wb')
dateDownloaded<-date()
gasDataFrame<- read.xlsx("./data/naturalGas.xlsx",sheetIndex=1,header=TRUE, colIndex = 7:15, rowIndex = 18:23)
gasDataTable <- data.table(gasDataFrame)
dat <- gasDataTable
sum(dat$Zip*dat$Ext, na.rm=T)

#OptionB
setwd("C:/EMNOMIA/Data Science Specialization/Courses/Course 3/Week 1/Quiz")
library(xlsx)
if (!file.exists("data")){
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/naturalGas.xlsx", mode='wb')
dateDownloaded<-date()
gasDataFrame<- read.xlsx("./data/naturalGas.xlsx",sheetIndex=1,header=TRUE)
col <- 7:15
row <- 18:23
dat <- read.xlsx("./data/naturalGas.xlsx", sheetIndex=1, colIndex = col, rowIndex = row)
sum(dat$Zip*dat$Ext, na.rm=T)