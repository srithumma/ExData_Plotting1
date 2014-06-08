plot1 <- function() {
  setwd("e:/Architecture/Coursera/exdata_data_household_power_consumption")
  data<-read.table("household_power_consumption.txt",
                   sep=";",na.strings="?",header=TRUE)
  
  data<-transform(data,Time=strptime(Time,"%H:%M:%S"))
  
  data<-transform(data,Date=as.Date(Date,"%d/%m/%Y"))
  
  df<-subset(data,data[,1]=="2007-02-01"|data[,1]=="2007-02-02")
  
  
  
  png(filename = "Plot1.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "white")
  
  hist(df[,3],col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)",ylim=range(1:1500))
  
  dev.off()
  #names(dataFrameR)<-c("hospital","state")
 
  
  
}