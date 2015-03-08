####Load data from txt file####
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

####Get the data for 1/2/2007 and 2/2/2007####
dataNew <- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

####Save the plot to png####
png("plot1.png")
hist(dataNew$Global_active_power, xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red")
dev.off()