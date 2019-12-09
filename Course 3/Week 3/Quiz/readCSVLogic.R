download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              , 'ACS.csv')
# Read data into data.frame
ACS <- read.csv('ACS.csv')
agricultureLogical <- ACS$ACR == 3 & ACS$AGS == 6
head(which(agricultureLogical), 3)
