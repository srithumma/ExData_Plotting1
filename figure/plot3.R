plot3 <- function() {
  ##Change to working directory where the file resides
  setwd("e:/Architecture/Coursera/exdata_data_household_power_consumption")
  ##read the table with headers on
  data<-read.table("household_power_consumption.txt",
                   sep=";",na.strings="?",header=TRUE)
  
  ##Extract the data for two days that we are interested in 
  
  df<-subset(data,data[,1]=="1/2/2007"|data[,1]=="2/2/2007",c(Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3))
  
  ## Create a DateTime column
  df$DateTime<- as.POSIXct(strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S"))
  
  ##Plot
  png(filename = "../ExData_Plotting1/figure/plot3.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "white")
  plot(df$DateTime,df$Sub_metering_1,col="gray",xaxt="n",type="l",xlab="",ylab="Energy sub metering")
  lines(df$DateTime,df$Sub_metering_2,col="red",xaxt="n",type="l",xlab="",ylab="Energy sub metering")
  lines(df$DateTime,df$Sub_metering_3,col="blue",xaxt="n",type="l",xlab="",ylab="Energy sub metering")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1,lwd=1,col=c("black","red","blue"),
         ncol=1,cex=0.8, 
         bty="1",  
         inset =c(0,0),
         text.col=c("black"))
  
  
  axis(1, at=c(min(df$DateTime),min(df$DateTime)+86400,
               min(df$DateTime)+2*86400),
       labels=c("Thu", "Fri", "Sat"))
 
  
  dev.off()

  
}