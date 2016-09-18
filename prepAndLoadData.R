if (!require("dplyr"))
{
    install.packages("dplyr")
}
library(dplyr)


## Download the data if it does not already exist in the working directory
wd = getwd()
dataZipFilename = "householdPowerConsumption.zip"
dataZipFilepath = file.path(wd, dataZipFilename)
dataFilename = "household_power_consumption.txt"

dataSourceUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


if (!file.exists(dataFilename)) {
    download.file(dataSourceUrl, dataZipFilepath, mode="wb")
    unzip(dataZipFilepath)
}

## Read only the data from 2007-02-01 to 2007-02-02 from the file to conserve memory.  Skipping suggested memory check due to subsetting
##  the file prior to reading it
##
##  Using a dd/MM/yyyy format here as this is what the file uses.  Also 
startingFileRow = grep("1/2/2007", readLines(dataFilename))
endingFileRow = grep("3/2/2007", readLines(dataFilename))-1
dat = read.table(dataFilename, sep=";", header=FALSE,skip=startingFileRow,nrows=endingFileRow - startingFileRow)

## Set the column names since we skipped over the head
names(dat) = names(read.table(dataFilename, header=TRUE, nrow=1, sep=";"))

## Normalize column types
dat$DateTime = strptime(paste0(dat$Date, " ", dat$Time), "%d/%m/%Y %H:%M:%S") 
dat$Global_active_power = as.numeric(dat$Global_active_power)
dat$Global_reactive_power = as.numeric(dat$Global_reactive_power)
dat$Voltage = as.numeric(dat$Voltage)
dat$Sub_metering_1 = as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 = as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 = as.numeric(dat$Sub_metering_3)
