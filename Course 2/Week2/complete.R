#Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. 
#The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. 
#A prototype of this function follows

complete<-function(directory,id=1:332){
    #print(directory)
    print(id)
    ## Read all the files in a directory:files <- list.files("C:/Data Science Specialization/Data_Science_Repo/Coursera_Data_Science/specdata", "\\.csv$", full.names = TRUE)
    files <- list.files(directory,pattern = "*.csv", full.names = T)
    dataframeResult <- data.frame(A=numeric(0),B=numeric(0))
    print(dataframeResult)
    for(indexFile in seq_along(id)) {
        print(basename(files[id[indexFile]]))
        print(id[indexFile])
        currentFile = files[id[indexFile]]; 
        dataframeTmp = read.csv(currentFile);
        dataframeTmpComplete = dataframeTmp[complete.cases(dataframeTmp),]
        numRowsTmp = nrow(dataframeTmpComplete)
        print(numRowsTmp)
        newrow = data.frame(id=id[indexFile], nobs=numRowsTmp)
        dataframeResult<-rbind(dataframeResult,newrow)
        print(dataframeResult)
    }
    print(dataframeResult)
}
    ##print(files)
    ## Store all the lists in a single dataframe. 4 Headers Date,Sulfate,Nitrate,ID
    ##originalDataframe <- do.call(rbind, lapply(files, read.csv))
    #print(originalDataframe)
    ## Store the csv file to work with pollutants. 3 Headers 
    ## Date: the date of the observation in YYYY-MM-DD format (year-month-day)
    ## sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
    ## nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)
    ## Extract the columns pollutant and ID
    ##print(originalDataframe[1,])
    ##processedDataframe = originalDataframe[,c(pollutant,"ID")]
    ##print(processedDataframe[1,])
    # Extract the rows with ID equal to a value in id
    ##filteredIdDataframe <- subset(processedDataframe, ID %in% id)
    #filteredIdDataframe <- filter(processedDataframe,ID %in% id)
    ##print(filteredIdDataframe[1,])
    #Remove NaN Values in pollutant
    #print(complete.cases(filteredIdDataframe))
    ##filteredIdValidDataframe = filteredIdDataframe[complete.cases(filteredIdDataframe),]
    ##print(filteredIdValidDataframe[1,])
    ##Calculate mean
    ##meanValue = mean(filteredIdValidDataframe[,pollutant])
    ##print(meanValue)

##source("complete.R")
##complete("specdata", 1)
##   id nobs
## 1  1  117
##complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
##complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
##complete("specdata", 3)
##   id nobs
## 1  3  243


