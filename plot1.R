if (!exists("dat")) {
    source("./prepAndLoadData.R")
}

png(filename = "./plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

## Reset graphics device
dev.off()