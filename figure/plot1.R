rankall <- function(outcomeType,dRank="best") {
  outcome<-read.csv("outcome-of-care-measures.csv",
                    colClasses = "character",
                    na.strings = "Not Available")
  validstates<-outcome[,7]
  validstates<-unique(sort(validstates))
  print(validstates)
  dataFrameR <-data.frame();
  i<-1
  for(state in validstates){
    dataFrameP <- rankS(outcome,outcomeType,dRank,state)
    dataFrameR <- rbind(dataFrameR,dataFrameP)
    ##i<-i+1
    ##if(i>2){
    ##break;
    ##}
    
  }
  
  dataFrameR<-as.data.frame(dataFrameR)
  names(dataFrameR)<-c("hospital","state")
  return(data.frame(dataFrameR))
  
}