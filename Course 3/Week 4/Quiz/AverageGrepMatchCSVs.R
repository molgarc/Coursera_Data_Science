# Removed the s from https to be compatible with windows computers. 
# Skip first 5 rows and only read in relevent columns
GDPrank <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                    , skip=5
                    , nrows=190
                    , select = c(1, 2, 4, 5)
                    , col.names=c("CountryCode", "Rank", "Country", "GDP")
)

# Remove the commas using gsub
# Convert to integer after removing commas. 
# Take mean of GDP column (I know this code may look a little confusing)
GDPrank[, mean(as.integer(gsub(pattern = ',', replacement = '', x = GDP )))]

# Regular expression that would allow you to count the number of countries whose name begins with "United"
length(grep("^United",GDPrank[, Country]))

#Match
GDPrank <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                             , skip=5
                             , nrows=190
                             , select = c(1, 2, 4, 5)
                             , col.names=c("CountryCode", "Rank", "Country", "GDP")
)

eduDT <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv')

mergedDT <- merge(GDPrank, eduDT, by = 'CountryCode')

mergedDT[grepl(pattern = "Fiscal year end: June 30;", mergedDT[, `Special Notes`]), .N]

