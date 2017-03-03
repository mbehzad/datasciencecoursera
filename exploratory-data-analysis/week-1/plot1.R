# read data
data_ <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = T);
# Convert date and time
data_$Time <- strptime(x = paste(data_$Date, data_$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data_$Date <- as.Date(data_$Date,format = '%d/%m/%Y')

start_ <- as.Date("2007-02-01")
end_ <- as.Date("2007-02-02")

data2 <- data_[which(data_$Date >= start_ & data_$Date <= end_),]

# draw plot 1
png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(data2$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.off()
