# Plot 4

setwd("~/jhuExpData")
pwr <- read.table("hs_pwr.txt", sep=";", header=T, stringsAsFactors=F, na.string=c("?"))
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
pwr$Time <- strptime(pwr$Time, "%H:%M:%S")

pwr_sub <- subset(pwr, pwr$Date == as.Date("2007/02/01") | pwr$Date == as.Date("2007/02/02"))
par(mfrow = c(2, 2))
png("plot3.png", width = 480, height = 480)
with(pwr_sub, {
    plot(pwr_sub$Time, yrange, type="n", ylab="Global Active Power (kilowatts)") 
    line(pwr_sub$Time, pwr_sub$Global_active_power)
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
    plot(Temp, Ozone, main = "Ozone and Temperature")
    mtext("Ozone and Weather in New York City", outer = TRUE)
})
