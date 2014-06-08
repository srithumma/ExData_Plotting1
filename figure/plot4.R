plot4 <- function() {
  ##Change to working directory where the file resides
  setwd("e:/Architecture/Coursera/exdata_data_household_power_consumption")
  ##read the table with headers on
  data<-read.table("household_power_consumption.txt",
                   sep=";",na.strings="?",header=TRUE)
  
  ##Extract the data for two days that we are interested in 
  
  df<-subset(data,data[,1]=="1/2/2007"|data[,1]=="2/2/2007",c(Date,Time,Global_active_power,Voltage,Global_reactive_power,Sub_metering_1,Sub_metering_2,Sub_metering_3))
  
  ## Create a DateTime column
  df$DateTime<- as.POSIXct(strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S"))
  op=par(mfrow=c(2,2))
  ##Plot
  png(filename = "../ExData_Plotting1/figure/Plot4.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "white")
  
  #setup 2x2 table
  op=par(mfrow=c(2,2))
  
  #Global Active Power figure in 1,1 cell of the 2x2 table
  plot(df$DateTime,df$Global_active_power,col="black",xaxt="n",type="l",xlab="",ylab="Global Active Power(Kilowatts)")
  
  axis(1, at=c(min(df$DateTime),min(df$DateTime)+86400,
               min(df$DateTime)+2*86400),
       labels=c("Thu", "Fri", "Sat"))
  
  
  #Global Active Power figure in 1,1 cell of the 2x2 table
  plot(df$DateTime,df$Voltage,col="black",xaxt="n",type="l",xlab="Datetime",ylab="Voltage")
  
  axis(1, at=c(min(df$DateTime),min(df$DateTime)+86400,
               min(df$DateTime)+2*86400),
       labels=c("Thu", "Fri", "Sat"))
  
  #Submetering 
  plot(df$DateTime,df$Sub_metering_1,col="gray",xaxt="n",type="l",xlab="",ylab="Energy sub metering")
  lines(df$DateTime,df$Sub_metering_2,col="red",xaxt="n",type="l",xlab="",ylab="Energy sub metering")
  lines(df$DateTime,df$Sub_metering_3,col="blue",xaxt="n",type="l",xlab="",ylab="Energy sub metering")
  axis(1, at=c(min(df$DateTime),min(df$DateTime)+86400,
               min(df$DateTime)+2*86400),
       labels=c("Thu", "Fri", "Sat"))
  
  #Global Reactive Power figure in 1,1 cell of the 2x2 table
  plot(df$DateTime,df$Global_reactive_power,col="black",xaxt="n",type="l",xlab="Datetime",ylab="Global_reactive_power")
  
  axis(1, at=c(min(df$DateTime),min(df$DateTime)+86400,
               min(df$DateTime)+2*86400),
       labels=c("Thu", "Fri", "Sat"))
  
  
  
  dev.off()
  
  
}