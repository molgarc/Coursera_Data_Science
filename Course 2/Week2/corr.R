#Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate 
#for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return 
#a vector of correlations for the monitors that meet the threshold requirement. 
#If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
#A prototype of this function

corr<-function(directory,threshold=0){
    #print(directory)
    ## Read all the files in a directory:files <- list.files("C:/Data Science Specialization/Data_Science_Repo/Coursera_Data_Science/specdata", "\\.csv$", full.names = TRUE)
    files <- list.files(directory,pattern = "*.csv", full.names = T)
    index_vector = 0
    resultVector = vector('numeric')
    for(indexFile in seq_along(files)) {
        currentFile = files[indexFile]; 
        dataframeTmp = read.csv(currentFile);       
        dataframeTmpComplete = dataframeTmp[complete.cases(dataframeTmp),]
        numRowsTmp = nrow(dataframeTmpComplete)
        if (numRowsTmp > threshold){
            index_vector = index_vector + 1;
            resultVector[index_vector] = cor(dataframeTmpComplete[,"sulfate"],dataframeTmpComplete[,"nitrate"])
        }
    }
    print(resultVector)
}

##print(R.version.string)
## [1] "R version 3.4.0 (2017-04-21)"
#source("corr.R")
#source("complete.R")
#cr <- corr("specdata", 150)
#head(cr)
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
#summary(cr)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313
#cr <- corr("specdata", 400)
#head(cr)
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
#summary(cr)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313
#cr <- corr("specdata", 5000)
#summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
#length(cr)
## [1] 0
#cr <- corr("specdata")
#summary(cr)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000
#length(cr)
## [1] 323
