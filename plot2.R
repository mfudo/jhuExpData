# Global Active Power time series
# Plot 2

setwd("~/jhuExpData")
pwr <- read.table("hs_pwr.txt", sep=";", header=T, stringsAsFactors=F, na.string=c("?"))
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
pwr$Time <- strptime(pwr$Time)

pwr_sub <- subset(pwr, pwr$Date > as.Date("2007-02-01") & pwr$Date < as.Date("2007-02-02"))

plot(pwr_sub$Global_active_power, pwr_sub$Time) 
