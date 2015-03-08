####Load data from txt file####
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

####Get the data for 1/2/2007 and 2/2/2007####
dataNew <- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
dataNew$DateTime<-strptime(paste(dataNew$Date,dataNew$Time),"%d/%m/%Y %H:%M:%S")

####Save the plot to png####
png("plot2.png")

plot(dataNew$DateTime, dataNew$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()