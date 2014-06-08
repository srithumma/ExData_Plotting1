plot1 <- function() {
  ##Change to working directory where the file resides
  setwd("e:/Architecture/Coursera/exdata_data_household_power_consumption")
  ##read the table with headers on
  data<-read.table("household_power_consumption.txt",
                   sep=";",na.strings="?",header=TRUE)
  
  ##Extract the data for two days that we are interested in 
  
  df<-subset(data,data[,1]=="1/2/2007"|data[,1]=="2/2/2007",c(Date,Time,Global_active_power))
  
  
  
  #data<-transform(data,Time=strptime(Time,"%H:%M:%S"))
  
  #data<-transform(data,Date=as.Date(Date,"%d/%m/%Y"))
  
  #df<-subset(data,data[,1]=="2007-02-01"|data[,1]=="2007-02-02")
  
  
  
  png(filename = "../ExData_Plotting1/figure/Plot1.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "white")
  
  hist(df[,3],col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)",ylim=range(1:1500))
  
  dev.off()
  #names(dataFrameR)<-c("hospital","state")
  
  
}