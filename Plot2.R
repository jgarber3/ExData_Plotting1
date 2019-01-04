library(tidyverse)

#Load the data set from file. The source data file is expected to be in your current working directory.
data <- read_csv2(file = "./household_power_consumption.txt")

#Convert the date column to a date type
data$Date <- paste(data$Date,data$Time)
data$Date <- as.POSIXct(data$Date, format="%d/%m/%Y %H:%M:%S")
#Convert GAP to a numberic (this might not be needed with read_csv2, but i needed to with read.csv)
#data$Global_active_power <- (as.numeric(data$Global_active_power))

#Subset on the dates from 2/1/2008 through 2/2/2008
sample_data <- subset(data, data$Date >= "2007-02-01")
sample_data <- subset(sample_data, sample_data$Date <= "2007-02-03")

plot(sample_data$Date,sample_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png")
dev.off()
