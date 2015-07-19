setwd("C:\\Users\\ckr123\\ExData_Plotting1")
url1 = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1,"power_cons.zip")

powerCons = read.table("C:\\Users\\ckr123\\ExData_Plotting1\\power_cons\\household_power_consumption.txt", sep=";",head =T)
powerCons1 = powerCons[powerCons$Date=="1/2/2007"|powerCons$Date=="2/2/2007",]
powerCons1$Global_active_power = as.numeric(as.character(powerCons1$Global_active_power))
powerCons1$Sub_metering_1 = as.numeric(as.character(powerCons1$Sub_metering_1))
powerCons1$Sub_metering_2 = as.numeric(as.character(powerCons1$Sub_metering_2))
powerCons1$Sub_metering_3 = as.numeric(as.character(powerCons1$Sub_metering_3))
timeComb = paste(powerCons1$Date,powerCons1$Time)
timeComb1 = strptime(timeComb,format="%d/%m/%Y %H:%M:%S")
powerCons1 = cbind(powerCons1,timeComb1)

plot(powerCons1$timeComb1,powerCons1$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = "",cex.lab=0.8,cex.axis=0.8)
lines(powerCons1$timeComb1,powerCons1$Sub_metering_2,col="red")
lines(powerCons1$timeComb1,powerCons1$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.5)

