data_ <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = T);
# Convert date and time
#data_$Time <- strptime(x = data_$Time, format = "%H:%M:%S")
data_$Time <- strptime(x = paste(data_$Date, data_$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data_$Date <- as.Date(data_$Date,format = '%d/%m/%Y')




start_ <- as.Date("2007-02-01")
end_ <- as.Date("2007-02-02")

dates <- data_$Date[which(data_$Date >= start_ & data_$Date <= end_)]
data2 <- data_[which(data_$Date >= start_ & data_$Date <= end_),]

# plot 1
hist(data2$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")

# plot 2
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(
       x = data2$Time,
       y = data2$Global_active_power,
       type = "l",
       xlab="",
       ylab="Global Active Power (kilowatts)"
       )
dev.off()

# plot 3
plot(
  x = data2$Time,
  y = data2$Sub_metering_1,
  type = "l",
  xlab="",
  ylab="Energy sub metering"
)

lines(
  x=data2$Time,
  y=data2$Sub_metering_2,
  col="red")

lines(
  x=data2$Time,
  y=data2$Sub_metering_3,
  col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)

# plot 4
par(mfrow=c(2,2))
# 1
plot(
  x = data2$Time,
  y = data2$Global_active_power,
  type = "l",
  xlab="",
  ylab="Global Active Power"
)

# 2
plot(
  x = data2$Time,
  y = data2$Voltage,
  type = "l",
  xlab="datetime",
  ylab="Voltage"
)

# 3
plot(
  x = data2$Time,
  y = data2$Sub_metering_1,
  type = "l",
  xlab="",
  ylab="Energy sub metering"
)

lines(
  x=data2$Time,
  y=data2$Sub_metering_2,
  col="red")

lines(
  x=data2$Time,
  y=data2$Sub_metering_3,
  col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)

 # 4
plot(
       x = data2$Time,
       y = data2$Global_reactive_power,
       type = "l",
       xlab="datetime",
       ylab="Global_reactive_power"
   )
