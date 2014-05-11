# Sub metering vs time
# Plot 3

setwd("~/jhuExpData")
pwr <- read.table("hs_pwr.txt", sep=";", header=T, stringsAsFactors=F, na.string=c("?"))
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
pwr$Time <- strptime(pwr$Time, "%H:%M:%S")

pwr_sub <- subset(pwr, pwr$Date == as.Date("2007/02/01") | pwr$Date == as.Date("2007/02/02"))
xrange = range(pwr_sub$Time)
yrange = range(pwr_sub$Sub_metering_1)

png("plot3.png", width = 480, height = 480)
plot(xrange, c(0,30), ylab="Energy sub metering", type="n")
lines(pwr_sub$Time, pwr_sub$Sub_metering_1, col="black")
lines(pwr_sub$Time, pwr_sub$Sub_metering_2, col="red")
lines(pwr_sub$Time, pwr_sub$Sub_metering_3, col="blue")
dev.off()