best <- function(state, outcome) {
    ## Read outcome data
    ##set Directory
    setwd("C:/Data Science Specialization/Course 2/Week4/Assignment")
    ##Read File
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ##See Headers
    head(data)
    ## Check that outcome is valid
    if(outcome!="heart attack"&&outcome!="heart failure"&&outcome!="pneumonia")
    {
        stop("invalid outcome")
    }
    ##The function should checkbest
    ## Check that state is valid
    if(!(state %in% data$State))
    {
        stop("invalid state")
    }
    ## Return hospital name in that state with lowest 30-day death
    dataState<-subset(data,State == state)
    head(dataState)
    colIdx<-switch(EXPR=outcome,"heart attack"=11,"heart failure"=17,"pneumonia"=23)
    print(colIdx)
    ##Transform column values to numetic
    dataState[, colIdx] <- as.numeric(dataState[, colIdx])
    valMin<-min(dataState[[colIdx]],na.rm=TRUE)
    print(valMin)
    dataStateBest<-subset(dataState,dataState[[colIdx]]==valMin)
    ##Sort hospitals by names (for tie break)
    dataStateBest<-dataStateBest[order(dataStateBest[["Hospital.Name"]]),]
    head(dataStateBest)
    print(dataStateBest[1,"Hospital.Name"])
    return(dataStateBest[1,"Hospital.Name"])
}