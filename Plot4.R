####Load data from txt file####
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

####Get the data for 1/2/2007 and 2/2/2007####
dataNew <- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
dataNew$DateTime<-strptime(paste(dataNew$Date,dataNew$Time),"%d/%m/%Y %H:%M:%S")

####Save the plot to png####
png("plot4.png")
par(mfrow=c(2,2))
plot(dataNew$DateTime, dataNew$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
plot(dataNew$DateTime, dataNew$Voltage, xlab="datetime", ylab="Voltage", type="l")
with(dataNew, plot(DateTime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering"))
with(dataNew, lines(DateTime,Sub_metering_1,col="black"))
with(dataNew, lines(DateTime,Sub_metering_2,col="red"))
with(dataNew, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dataNew$DateTime, dataNew$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()