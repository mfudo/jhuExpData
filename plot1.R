# Global Active Power histogram
# Plot 1

setwd("~/jhuExpData")
pwr <- read.table("hs_pwr.txt", sep=";", header=T, stringsAsFactors=F, na.string=c("?"))
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
pwr$Time <- strptime(pwr$Time)

pwr_sub <- subset(pwr, pwr$Date == as.Date("2007/02/01") | pwr$Date == as.Date("2007/02/02"))
png("plot1.png", width = 480, height = 480)
with(pwr_sub, hist(pwr_sub$Global_active_power, main="Global Active Power", breaks=12, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency"))
dev.off()