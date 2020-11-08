# Loading data from source file

electric <- read.table ("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)


# Filtering data for 1/2/2007 - 2/2/2007
electric2 <- electric [electric$Date %in% c ("1/2/2007", "2/2/2007"),]

# Plotting data
activepower <- as.numeric (electric2$Global_active_power)
datetime <- strptime(paste(electric2$Date, electric2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
par (mfrow = c (1,1))
plot (datetime, activepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Copying histogram to png file
dev.copy (png, file = "plot2.png")
dev.off()