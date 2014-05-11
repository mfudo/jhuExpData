# Global Active Power time series
# Plot 2

setwd("~/jhuExpData")
pwr <- read.table("hs_pwr.txt", sep=";", header=T, stringsAsFactors=F, na.string=c("?"))
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
pwr$Time <- strptime(pwr$Time, "%H:%M:%S")

pwr_sub <- subset(pwr, pwr$Date == as.Date("2007/02/01") | pwr$Date == as.Date("2007/02/02"))
pwr_sub <- pwr_sub[order(pwr_sub$Time),]
xrange = range(pwr_sub$Time)
yrange = range(pwr_sub$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(xrange, yrange, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)") 
lines(pwr_sub$Time, pwr_sub$Global_active_power)
axis.POSIXct(1, at=seq(pwr_sub$Time, by="day"), format="%a", labels=T)
dev.off()