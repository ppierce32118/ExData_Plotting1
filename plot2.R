## Create a line plot and PNG file using data for the dates 2007-02-01 and 2007-02-02

## Read data from text file
d <- read.table("household_power_consumption.txt", 
                header = TRUE,
                na.strings = "?",
                sep=";", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric",
                               "numeric", "numeric", "numeric","numeric"))

## Create a line plot
plot(subset(d, 
    as.Date(d$Date, "%d/%m/%Y") >= as.Date("2007-02-01") &
    as.Date(d$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))$Global_active_power, 
    axes=T, ylim=c(0,8), typ='l', xaxt = "n", ann=F)
axis(1, at=seq(1, 2880, by=1440), labels=F, lwd=1, lwd.ticks=1)
axis(1, at=c(1, 1441, 2881), c("Thu", "Fri", "Sat"))
title(ylab = "Global Active Power (kilowatts)")

## Copy Global Active Power to a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
## Don't forget to close the PNG device
dev.off()                           
