library(lubridate)

# Rows required for dates 2007-02-01 and 2007-02-02
# are from 66638 to 69517
# Reading only relevant rows
data <- read.table("household_power_consumption.txt",sep = ";" ,na.strings = "?",skip = 66637, nrows = 2880 )
colnames(data) = colnames(read.table("household_power_consumption.txt",sep = ";" , nrows = 1, header = TRUE))

data$DateTime <- dmy_hms(paste(data$Date, data$Time))

# below to see on screen device
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))

# Plot 1
plot(data$DateTime,data$Global_active_power, type = "n", pch = 20,ylab = "Global Active Power", xlab = "")
lines(data$DateTime,data$Global_active_power)

# Plot 2
plot(data$DateTime,data$Voltage, type = "n", pch = 20,ylab = "Voltage", xlab = "datetime",)
lines(data$DateTime,data$Voltage)

# Plot 3
plot(data$DateTime,data$Sub_metering_1, type = "n", pch = 20,ylab = "Energy sub metering", xlab = "")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1),cex = 0.5, bty = "n")

# Plot 4
plot(data$DateTime,data$Global_reactive_power, type = "n", pch = 20, xlab = "datetime",ylab = "Global_reactive_power")
lines(data$DateTime,data$Global_reactive_power)

# Create PNG file
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA  )

par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))

plot(data$DateTime,data$Global_active_power, type = "n", pch = 20,ylab = "Global Active Power", xlab = "")
lines(data$DateTime,data$Global_active_power)

plot(data$DateTime,data$Voltage, type = "n", pch = 20,ylab = "Voltage", xlab = "datetime",)
lines(data$DateTime,data$Voltage)

plot(data$DateTime,data$Sub_metering_1, type = "n", pch = 20,ylab = "Energy sub metering", xlab = "")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1),cex = 0.5, bty = "n")

plot(data$DateTime,data$Global_reactive_power, type = "n", pch = 20, xlab = "datetime",ylab = "Global_reactive_power")
lines(data$DateTime,data$Global_reactive_power)

dev.off()
