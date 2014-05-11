# Global Active Power histogram
# Plot 1

setwd("~/jhuExpData")
pwr <- read.table("hs_pwr.txt", sep=";", header=T, stringsAsFactors=F, na.string=c("?"))
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
pwr$Time <- strptime(pwr$Time)

pwr_sub <- pwr[pwr$Date == c("2007/02/01","2007/02/02"),]

with(pwr_sub, hist(pwr_sub$Global_active_power, main="Global Active Power", breaks=12, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency"))
