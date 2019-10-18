rankall <- function(outcome, num = "best") {
    ##Load File and prepare data
    ## Read outcome data
    ##set Directory
    setwd("C:/Data Science Specialization/Course 2/Week4/Assignment")
    ##Read File
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ##See Headers
    head(data)
    
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
    dataSplit <- split(data, data$State )
    sol<- sapply(dataSplit, function(x) rankhospital(x[1,"State"], outcome, num ))
    dataSol = data.frame("state"= names(sol),"hospital" = sol)
    return(dataSol)
    # ##Get vector of state names:
    # vec_StatesNames<-myFun_GetListGroupNames(dfrm_Data,"State")
    # 
    # vec_HospNames<-sapply(vec_StatesNames,rankhospital,outcome=outcome,num=num)
    # 
    # dfrm_HospForState<-data.frame(hospital=vec_HospNames,state=vec_StatesNames)
    # 
    # return(dfrm_HospForState)
}