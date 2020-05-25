#Read the data into variable outdat. Only the relevant rows with required dates
outdat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880)

#Set names to the data frame
names(outdat) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Format date and time to the correct object class
outdat$Date <- as.Date(outdat$Date, format = "%d/%m/%Y")
outdat$Time <- as.POSIXlt(outdat$Time, format = "%H:%M:%S")
outdat$Time <- format(outdat$Time, "%H:%M:%S")

#Output the histogram to the correct format in png, and then close the connection
png(file = "plot1.png")
hist(outdat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()