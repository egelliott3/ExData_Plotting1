if (!exists("dat")) {
    source("./prepAndLoadData.R")
}

png(filename = "./plot2.png", width = 480, height = 480)
plot(dat$DateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Reset graphics device
dev.off()