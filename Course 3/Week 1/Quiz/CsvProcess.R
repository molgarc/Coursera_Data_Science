##setwd("C:/EMNOMIA/Data Science Specialization/Courses/Course 3/Week 1/Quiz")
library(data.table)
if (!file.exists("data")){
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/housing.csv")
dateDownloaded<-date()
housingDataFrame <- read.csv("./data/housing.csv",sep=",",header = TRUE)
housingDataTable <- data.table(housingDataFrame)
housingDataTable1000000 <- housingDataTable[housingDataTable$VAL == "24",]
nrow(housingDataTable1000000)

##OptionB
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
if (!file.exists("Dataset")){
    dir.create("Dataset")
}
download.file(fileUrl1, destfile = "./Dataset/Quiz1-01.csv")
quiz1Data <- read.csv("./Dataset/Quiz1-01.csv")
head(quiz1Data)
sum(quiz1Data$VAL == 24, na.rm = TRUE)