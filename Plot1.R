setwd("c:/r/data")
d=read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F, na.strings="?")
s=subset(d,Date=="1/2/2007"|Date=="2/2/2007")
s$Global_active_power=as.numeric(s$Global_active_power
png(file="Plot1.png",width=480,height=480,units="px")
hist(s$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()