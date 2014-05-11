# Plot 4

setwd("~/jhuExpData")
pwr <- read.table("hs_pwr.txt", sep=";", header=T, stringsAsFactors=F, na.string=c("?"))
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
pwr$Time <- strptime(pwr$Time, "%H:%M:%S")

pwr_sub <- subset(pwr, pwr$Date == as.Date("2007/02/01") | pwr$Date == as.Date("2007/02/02"))
par(mfrow = c(2, 2))
png("plot3.png", width = 480, height = 480)
with(pwr_sub, {
    plot(pwr_sub$Time, pwr_sub$Global_active_power, ylab="Global Active Power (kilowatts)") 
    plot(pwr_sub$Time, pwr_sub$Voltage, ylab="Voltage", xlab="datetime") 
    xrange = range(pwr_sub$Time)
    yrange = range(pwr_sub$Global_active_power)
    plot(xrange, yrange, ylab="Energy sub metering", type="n")
    with line(pwr_sub$Time, pwr_sub$Sub_metering_1, col="black")
    with line(pwr_sub$Time, pwr_sub$Sub_metering_2, col="red")
    with line(pwr_sub$Time, pwr_sub$Sub_metering_3, col="blue")
    plot(pwr_sub$Time, pwr_sub$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime") 
})
