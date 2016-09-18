if (!exists("dat")) {
    source("./prepAndLoadData.R")
}

png(filename = "./plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

## Top left
plot(dat$DateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## Top Right
plot(dat$DateTime, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Bottom Left
plot(dat$DateTime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty = "n", col=c("black", "red", "blue"))

## Bottom Right
plot(dat$DateTime, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Reset graphics device
dev.off()