setwd("C:\\Users\\ckr123\\ExData_Plotting1")
url1 = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1,"power_cons.zip")

powerCons = read.table("C:\\Users\\ckr123\\ExData_Plotting1\\power_cons\\household_power_consumption.txt", sep=";",head =T)
powerCons1 = powerCons[powerCons$Date=="1/2/2007"|powerCons$Date=="2/2/2007",]
powerCons1$Global_active_power = as.numeric(as.character(powerCons1$Global_active_power))
timeComb = paste(powerCons1$Date,powerCons1$Time)
timeComb1 = strptime(timeComb,format="%d/%m/%Y %H:%M:%S")
powerCons1 = cbind(powerCons1,timeComb1)

plot(powerCons1$timeComb1,powerCons1$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "",cex.lab=0.6,cex.axis=0.6)
