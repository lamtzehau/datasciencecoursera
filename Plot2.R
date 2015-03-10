d = read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F, na.strings="?")
s=subset(d,Date=="1/2/2007"|Date=="2/2/2007")
s$Global_active_power=as.numeric(s$Global_active_power)

s$Time=paste(s$Date, s$Time)
s$Time=strptime(s$Time, "%d/%m/%Y %H:%M:%S")
s$Time=format(s$Time,format="%H/%M/%S")  # redundant code line, previous line already converted the s$Time to the requireed data and time formaat
s <- strptime(paste(s$Date, s$Time), "%d/%m/%Y %H:%M")  # remove this line, code would result in "NA" list and hence the subsequent codes are not going to work ie cant create the plot 

png(file="Plot2.png",width=480,height=480,units="px")	
plot(s$Time,s$Global_active_power, pch=".",ylab="Global Active Power (Kilowatts)", xlab="")
lines(s$Time, s$Global_active_power)
