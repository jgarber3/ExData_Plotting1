library(tidyverse)

#Load the data set from file. The source data file is expected to be in your current working directory.
data <- read_csv2(file = "./household_power_consumption.txt")

#Convert the date column to a date type
data$Date <- paste(data$Date,data$Time)
data$Date <- as.POSIXct(data$Date, format="%d/%m/%Y %H:%M:%S")

#Subset on the dates from 2/1/2008 through 2/2/2008
sample_data <- subset(data, data$Date >= "2007-02-01")
sample_data <- subset(sample_data, sample_data$Date <= "2007-02-03")

#create the 2 by 2 format
par(mfrow=c(2,2))

#plot 1
plot(sample_data$Date,sample_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#plot 2
plot(sample_data$Date,sample_data$Voltage, type="l", ylab="voltage", xlab="datetime")

#plot 3
plot(sample_data$Date,sample_data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(sample_data$Date,sample_data$Sub_metering_1, type="l", col="black")
lines(sample_data$Date,sample_data$Sub_metering_2, type="l", col="red")
lines(sample_data$Date,sample_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))

#plot 4
plot(sample_data$Date,sample_data$Global_reactive_power, type="l", ylab="Global Reactive Power", xlab="datetime")


#write the plot to file
dev.copy(png,"plot3.png")
dev.off()
