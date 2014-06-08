plot1 <- function() {
  ##Change to working directory where the file resides
  setwd("e:/Architecture/Coursera/exdata_data_household_power_consumption")
  
  ##read the table with headers on
  data<-read.table("household_power_consumption.txt",
                   sep=";",na.strings="?",header=TRUE)
  
  ##Extract the data for two days that we are interested in 
  
  df<-subset(data,data[,1]=="1/2/2007"|data[,1]=="2/2/2007",c(Date,Time,Global_active_power))
  
  
  ##Plot histogram
  
  png(filename = "../ExData_Plotting1/figure/plot1.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "white")
  
  hist(df[,3],col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)",ylim=range(1:1500))
  
  dev.off()
  
  
  
}