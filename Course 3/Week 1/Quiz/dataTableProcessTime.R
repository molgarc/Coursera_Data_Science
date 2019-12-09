setwd("C:/EMNOMIA/Data Science Specialization/Courses/Course 3/Week 1/Quiz")
library(data.table)
if (!file.exists("data")){
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./data/housingIdaho.csv")
DT <- fread("./data/housingIdaho.csv")
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(mean(DT[DT$SEX==1,]$pwgtp15),mean(DT[DT$SEX==2,]$pwgtp15))
mean(DT[DT$SEX==1,]$pwgtp15)
mean(DT[DT$SEX==2,]$pwgtp15)
system.time(DT[,mean(pwgtp15),by=SEX])
DT[,mean(pwgtp15),by=SEX]
system.time(mean(DT$pwgtp15,by=DT$SEX))
mean(DT$pwgtp15,by=DT$SEX)
system.time(rowMeans(DT)[DT$SEX==1],rowMeans(DT)[DT$SEX==2])
rowMeans(DT)[DT$SEX==1]
rowMeans(DT)[DT$SEX==2]
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
tapply(DT$pwgtp15,DT$SEX,mean)
library(microbenchmark)
microbenchmark(sapply(split(DT$pwgtp15,DT$SEX),mean),mean(DT[DT$SEX==1,]$pwgtp15),mean(DT[DT$SEX==2,]$pwgtp15),DT[,mean(pwgtp15),by=SEX],mean(DT$pwgtp15,by=DT$SEX),tapply(DT$pwgtp15,DT$SEX,mean))

