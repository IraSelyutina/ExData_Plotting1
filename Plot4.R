library(readr)

setwd("D:/R")

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="Assignment41.zip",method = "curl")


hpc<-read.csv(unzip("Assignment41.zip","household_power_consumption.txt"),header=T, sep=';', na.strings="?", stringsAsFactors=F)
hpc$Date <- strptime(as.Date(hpc$Date, format="%d/%m/%Y"),format = "%Y-%m-%d")
hpc <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
hpc$Datetime <- strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S")

#4

par(mfrow=c(2,2))
with(hpc,plot(Datetime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(hpc,plot(Datetime,Voltage, type="l", ylab="Voltage", xlab="datetime"))
plot(hpc$Datetime,hpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpc$Datetime,hpc$Sub_metering_2,col="red")
lines(hpc$Datetime,hpc$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(hpc,plot(Datetime,Global_reactive_power, type="l", ylab="Global_reactive_power)", xlab="Datetime"))