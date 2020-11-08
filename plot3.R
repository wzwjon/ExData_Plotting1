# Loading data from source file

electric <- read.table ("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)


# Filtering data for 1/2/2007 - 2/2/2007
electric2 <- electric [electric$Date %in% c ("1/2/2007", "2/2/2007"),]

# Plotting data
submetering1 <- as.numeric (electric2$Sub_metering_1)
submetering2 <- as.numeric (electric2$Sub_metering_2)
submetering3 <- as.numeric (electric2$Sub_metering_3)
datetime <- strptime(paste(electric2$Date, electric2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
par (mfrow = c (1,1))

plot (datetime, submetering1, type = "l", xlab = "", ylab = "Energy Submetering")
lines (datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col = "blue")

legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))



# Copying histogram to png file
dev.copy (png, file = "plot3.png")
dev.off()