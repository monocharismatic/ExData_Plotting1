consumption = read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=TRUE, na.strings = "?", stringsAsFactors=FALSE)

consumption$DateTime = strptime(paste(consumption$Date,consumption$Time), format="%d/%m/%Y %H:%M:%S")

consumption$Date = as.Date(consumption$Date, format="%d/%m/%Y")

feb2007 = consumption[consumption$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

feb2007$Time = NULL

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(feb2007$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
