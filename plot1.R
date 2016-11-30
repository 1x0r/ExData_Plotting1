data_epc <- read.table('household_power_consumption.txt', sep=";", header = TRUE, na.strings = c("?"))
data_epc$DateTime <- as.POSIXct(strptime(paste(data_epc$Date, data_epc$Time, sep = " "), 
                                         format = "%d/%m/%Y %H:%M:%S"))

data_epc <- data_epc[data_epc$DateTime >= '2007-02-01 00:00:00' & data_epc$DateTime <= '2007-02-02 23:59:59', ]

png(filename = "plot1.png", bg = "transparent")

hist(data_epc$Global_active_power, breaks = 12, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()