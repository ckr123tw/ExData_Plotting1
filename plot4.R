setwd("C:\\Users\\ckr123\\ExData_Plotting1")
url1 = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1,"power_cons.zip")

powerCons = read.table("C:\\Users\\ckr123\\ExData_Plotting1\\power_cons\\household_power_consumption.txt", sep=";",head =T)
powerCons1 = powerCons[powerCons$Date=="1/2/2007"|powerCons$Date=="2/2/2007",]
powerCons1$Global_active_power = as.numeric(as.character(powerCons1$Global_active_power))
powerCons1$Global_reactive_power = as.numeric(as.character(powerCons1$Global_reactive_power))
powerCons1$Voltage = as.numeric(as.character(powerCons1$Voltage))
powerCons1$Sub_metering_1 = as.numeric(as.character(powerCons1$Sub_metering_1))
powerCons1$Sub_metering_2 = as.numeric(as.character(powerCons1$Sub_metering_2))
powerCons1$Sub_metering_3 = as.numeric(as.character(powerCons1$Sub_metering_3))
timeComb = paste(powerCons1$Date,powerCons1$Time)
timeComb1 = strptime(timeComb,format="%d/%m/%Y %H:%M:%S")
powerCons1 = cbind(powerCons1,timeComb1)

par(mfrow = c(2,2),oma=c(0.5,1,0,0),mar=c(4,3.5,1,1))
{
plot(powerCons1$timeComb1,powerCons1$Global_active_power,type="l",ylab = "Global Active Power",xlab = "",cex.lab=0.8,cex.axis=0.8)
plot(powerCons1$timeComb1,powerCons1$Voltage,type="l",ylab = "Voltage",xlab = "datetime",cex.lab=0.8,cex.axis=0.8)
plot(powerCons1$timeComb1,powerCons1$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = "",cex.lab=0.7,cex.axis=0.7)
lines(powerCons1$timeComb1,powerCons1$Sub_metering_2,col="red")
lines(powerCons1$timeComb1,powerCons1$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty ="n" ,cex=0.6)
plot(powerCons1$timeComb1,powerCons1$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power",cex.lab=0.8,cex.axis=0.8)
}


