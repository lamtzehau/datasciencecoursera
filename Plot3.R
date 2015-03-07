d = read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F, na.strings="?")
s=subset(d,Date=="1/2/2007"|Date=="2/2/2007")
s$Global_active_power=as.numeric(s$Global_active_power)

s$Time=paste(s$Date, s$Time)
s$Time=strptime(s$Time, "%d/%m/%Y %H:%M:%S")

png(file="Plot3.png",width=480,height=480,units="px")	

with(s,plot(Time, Sub_metering_1, pch=".",col="black", ylab="Energy sub metering",xlab=""))
with(s,lines(Time,Sub_metering_1,col="black"))
with(s,lines(Time, Sub_metering_2, pch=".",col="red"))
with(s,lines(Time, Sub_metering_3, pch=".",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()