
# Rows required for dates 2007-02-01 and 2007-02-02
# are from 66638 to 69517
# Reading only relevant rows
data <- read.table("household_power_consumption.txt",sep = ";" ,na.strings = "?",skip = 66637, nrows = 2880 )
colnames(data) = colnames(read.table("household_power_consumption.txt",sep = ";" , nrows = 1, header = TRUE))

# below to see on screen device
hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

# Create PNG file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA  )
hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()