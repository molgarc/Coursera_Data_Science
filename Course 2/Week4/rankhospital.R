rankhospital <- function(state, outcome, num = "best") {

    ##Load File and prepare data
    ## Read outcome data
    ##set Directory
    setwd("C:/Data Science Specialization/Course 2/Week4/Assignment")
    ##Read File
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ##See Headers
    head(data)
    
    ##Check state
    if(!(state %in% data$State))
    {
        stop("invalid state")
    }  
    
    ##Check outcome
    if(outcome!="heart attack"&&outcome!="heart failure"&&outcome!="pneumonia")
    {
        stop("invalid outcome")
    }
    ##Mapping cols and input outcome
    colIdx<-switch(EXPR=outcome,"heart attack"=11,"heart failure"=17,"pneumonia"=23)
    print(colIdx)
    ##Transform column values to numetic
    data[, colIdx] <- as.numeric(data[, colIdx])
    #Subset by State=state
    dataState<-subset(data,State == state)
    head(dataState)
    #Check number of rows of dataState
    num_quantityOfCases<-length(dataState[["State"]])
    
    if(is.numeric(num)&&(num>num_quantityOfCases))
    {
        sol <- "NA"
    }

    if(num == "best")
    {
        valMin<-min(dataState[[colIdx]],na.rm=TRUE)
        dataStateProc<-subset(dataState,dataState[[colIdx]]==valMin)
        dataStateProc<-dataStateProc[order(dataStateProc[["Hospital.Name"]]),]
        sol <- dataStateProc[1,"Hospital.Name"]
        print(sol)
    }
    else if (num == "worst")
    {
        valMax<-max(dataState[[colIdx]],na.rm=TRUE)
        dataStateProc<-subset(dataState,dataState[[colIdx]]==valMax)
        dataStateProc<-dataStateProc[order(dataStateProc[["Hospital.Name"]]),]
        sol <- dataStateProc[1,"Hospital.Name"]
        print(sol)
    }
    else if(!is.numeric(num))
    {
        stop("invalid num")
    }
    else
    {
        #Remove rows with NA in the column we are analyzing
        goodRecords<-complete.cases(dataState[[colIdx]])
        dataStateProc <-dataState[goodRecords,]
        #Order by value in the column, and, if tie by Hospital Name
        dataStateProc<-dataStateProc[order(dataStateProc[[colIdx]],dataStateProc[["Hospital.Name"]]),]
        head(dataStateProc)
        sol <- dataStateProc[num,"Hospital.Name"]
        print(sol)
    }
    return(sol)
}