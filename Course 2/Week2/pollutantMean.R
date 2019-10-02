##Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
##The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
##Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument 
##and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows

pollutantMean<-function(directory,pollutant,id = 1:332){
    ## Open csv file in directory
    originalDataframe = read.table(directory);
    ## Store the csv file to work with pollutants. 3 Headers 
    ## Date: the date of the observation in YYYY-MM-DD format (year-month-day)
    ## sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
    ## nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)
    ##Ignore NaN values
    processedDataframe = originalDataframe[complete.cases(processedDataframe),];
    ##Calculate mean
    meanValue = mean(processedDataframe[id,pollutant])
}


##print(R.version.string)
## [1] "R version 3.4.0 (2017-04-21)"
## source("pollutantmean.R")
## pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064128
## pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706047
## pollutantmean("specdata", "nitrate", 23)
## [1] 1.280833
