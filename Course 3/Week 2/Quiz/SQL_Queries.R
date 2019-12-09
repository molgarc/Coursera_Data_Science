# install.packages("sqldf")
library("sqldf")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

f <- file.path(getwd(), "ss06pid.csv")
download.file(url, f)

acs <- data.table::data.table(read.csv(f))
query1 <- sqldf("select pwgtp1 from acs")
query2 <- sqldf("select * from acs where AGEP < 50")
query3 <- sqldf("select * from acs")
query4 <- sqldf("select pwgtp1 from acs where AGEP < 50")
query5 <- sqldf("select unique * from acs")
query6 <- sqldf("select distinct AGEP from acs")
query7 <- sqldf("select distinct pwgtp1 from acs")
query8 <- sqldf("select AGEP where unique from acs")

#####
##Typically
setwd("C:/EMNOMIA/Data Science Specialization/Courses/Course 3/Week 2/Quiz")
library("sqldf")
library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
if (!file.exists("data")){
    dir.create("data")
}
download.file(fileUrl, destfile = "./data/ss06pid.csv")
amcsDataFrame <- read.csv("./data/ss06pid.csv")
amcsDataTable <- data.table(amcsDataFrame)
query1 <- sqldf("select pwgtp1 from amcsDataTable")
query2 <- sqldf("select * from amcsDataTable where AGEP < 50")
query3 <- sqldf("select * from amcsDataTable")
query4 <- sqldf("select pwgtp1 from amcsDataTable where AGEP < 50")
query5 <- sqldf("select unique * from amcsDataTable")
query6 <- sqldf("select distinct AGEP from amcsDataTable")
query7 <- sqldf("select distinct pwgtp1 from amcsDataTable")
query8 <- sqldf("select AGEP where unique from amcsDataTable")

