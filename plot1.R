# Loading data from source file

electric <- read.table ("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)


# Filtering data for 1/2/2007 - 2/2/2007
electric2 <- electric [electric$Date %in% c ("1/2/2007", "2/2/2007"),]

# Plotting 1st plot for Global Active Power vs Frequency
activepower <- as.numeric (electric2$Global_active_power)
par (mfrow = c (1,1))
hist (activepower, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

# Copying histogram to png file
dev.copy (png, file = "plot1.png")
dev.off()