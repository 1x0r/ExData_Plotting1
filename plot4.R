data_epc <- read.table('household_power_consumption.txt', sep=";", header = TRUE, na.strings = c("?"))
data_epc$DateTime <- as.POSIXct(strptime(paste(data_epc$Date, data_epc$Time, sep = " "), 
                                         format = "%d/%m/%Y %H:%M:%S"))

data_epc <- data_epc[data_epc$DateTime >= '2007-02-01 00:00:00' & data_epc$DateTime <= '2007-02-02 23:59:59', ]

png(filename = "plot4.png", bg = "transparent")

par(mfrow=c(2,2))

# Subplot 1
plot(data_epc$DateTime, data_epc$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Subplot 2
plot(data_epc$DateTime, data_epc$Voltage, type = "l", col = 'black',
     ylab = "Voltage", xlab = "datetime")

# Subplot 3
plot(data_epc$DateTime, data_epc$Sub_metering_1, type = "l", col = 'black',
     ylab = "Energy sub metering", xlab = "")

lines(data_epc$DateTime, data_epc$Sub_metering_2, type = "l", col = 'red')

lines(data_epc$DateTime, data_epc$Sub_metering_3, type = "l", col = 'blue')

legend(x = as.numeric(as.POSIXct('2007-02-01 14:00:00')), y = 40, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1),
       bty = "n",
       col = c("black", "red", "blue"))

# Subplot 4
plot(data_epc$DateTime, data_epc$Global_reactive_power, type = "l", col = 'black',
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()