d = read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F, na.strings="?")
s=subset(d,Date=="1/2/2007"|Date=="2/2/2007")
s$Global_active_power=as.numeric(s$Global_active_power)

s$Time=paste(s$Date, s$Time)
s$Time=strptime(s$Time, "%d/%m/%Y %H:%M:%S")

png(file="Plot6.png",width=480,height=480,units="px")	

par(mfrow=c(2,2))

plot(s$Time,s$Global_active_power, pch=".",ylab="Global Active Power (Kilowatts)", xlab="")
lines(s$Time, s$Global_active_power)

with(s,plot(Time, Voltage, pch=".",col="black", ylab="Voltage",xlab="datetime"))
with(s,lines(Time,Voltage,col="black"))
# plot(s$Time, s$Voltage, type="l", ylab="Voltage", xlab="datetime"), just a suggestion; combine 2 lines into one



with(s,plot(Time, Sub_metering_1, pch=".",col="black", ylab="Energy sub metering",xlab=""))
with(s,lines(Time,Sub_metering_1,col="black"))
with(s,lines(Time, Sub_metering_2, pch=".",col="red"))
with(s,lines(Time, Sub_metering_3, pch=".",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


with(s,plot(Time, Global_reactive_power, pch=".",col="black", ylab="Global_reactive_power",xlab="datetime"))
with(s,lines(Time,Global_reactive_power,col="black"))
dev.off()
