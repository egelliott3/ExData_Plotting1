if (!exists("dat")) {
    source("./prepAndLoadData.R")
}

png(filename = "./plot3.png", width = 480, height = 480)
plot(dat$DateTime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))


## Reset graphics device
dev.off()