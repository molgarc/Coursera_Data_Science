library("data.table")
communities <- data.table::fread("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
names(communities)
varNamesSplit <- strsplit(names(communities), "wgtp")
varNamesSplit[[123]]
varNamesSplit[123]

