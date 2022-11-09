library(readr)

setwd("D:/R")

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="Assignment41.zip",method = "curl")


hpc<-read.csv(unzip("Assignment41.zip","household_power_consumption.txt"),header=T, sep=';', na.strings="?", stringsAsFactors=F)
hpc$Date <- strptime(as.Date(hpc$Date, format="%d/%m/%Y"),format = "%Y-%m-%d")
hpc <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
hpc$Datetime <- strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S")

#2

plot(hpc$Datetime,hpc$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()