consumption = read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=TRUE, na.strings = "?", stringsAsFactors=FALSE)

consumption$DateTime = strptime(paste(consumption$Date,consumption$Time), format="%d/%m/%Y %H:%M:%S")

consumption$Date = as.Date(consumption$Date, format="%d/%m/%Y")

feb2007 = consumption[consumption$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

feb2007$Time = NULL

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize=13)
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(feb2007$DateTime, feb2007$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(feb2007$DateTime, feb2007$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(feb2007$DateTime, feb2007$Sub_metering_2, col="red")
lines(feb2007$DateTime, feb2007$Sub_metering_3, col="blue")
legend("topright", c("sub metering 1", "sub metering 2", "sub metering 3"), col=c("black", "red", "blue"), lty=1, lwd=2, pch=NA, bty="n")
plot(feb2007$DateTime, feb2007$Voltage, xlab="", ylab="Voltage", type="l")
plot(feb2007$DateTime, feb2007$Global_reactive_power, xlab="", ylab="Global Reactive Power", type="l")
dev.off()
