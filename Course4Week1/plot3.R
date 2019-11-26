library(lubridate)

# Rows required for dates 2007-02-01 and 2007-02-02
# are from 66638 to 69517
# Reading only relevant rows
data <- read.table("household_power_consumption.txt",sep = ";" ,na.strings = "?",skip = 66637, nrows = 2880 )
colnames(data) = colnames(read.table("household_power_consumption.txt",sep = ";" , nrows = 1, header = TRUE))

data$DateTime <- dmy_hms(paste(data$Date, data$Time))

# below to see on screen device
plot(data$DateTime,data$Sub_metering_1, type = "n", pch = 20,ylab = "Energy sub metering", xlab = "")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1))

# Create PNG file
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA  )
plot(data$DateTime,data$Sub_metering_1, type = "n", pch = 20,ylab = "Energy sub metering", xlab = "")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1))

dev.off()
