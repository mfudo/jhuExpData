# Global Active Power histogram

setwd("~/jhuExpData")
pwr <- read.table("hs_pwr.txt", sep=";", stringsAsFactors=F, na.string=c("?"))
pwr$Date <- as.Date(pwr$Date)
pwr$Time <- strptime(pwr$Time)

pwr_sub <- pwr[pwr$Date == c("2007-02-01","2007-02-02"),]

