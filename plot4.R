## Create a line plot and PNG file using data for the dates 2007-02-01 and 2007-02-02

## Read data from text file
d <- read.table("household_power_consumption.txt", 
                header = TRUE,
                na.strings = "?",
                sep=";", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric",
                               "numeric", "numeric", "numeric","numeric"))
d1 <- subset(d, 
             as.Date(d$Date, "%d/%m/%Y") >= as.Date("2007-02-01") &
             as.Date(d$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

par(mfrow = c(2, 2))

## Create a line plot
plot(d1$Global_active_power, 
     axes=T,  typ='l', xaxt = "n", ann=F)
axis(1, at=seq(1, 2880, by=1440), labels=F, lwd=1, lwd.ticks=1)
axis(1, at=c(1, 1441, 2881), c("Thu", "Fri", "Sat"))
title(ylab = "Global Active Power")

## Create a line plot
plot(d1$Voltage, 
     axes=T,  typ='l', xaxt = "n", ann=F)
axis(1, at=seq(1, 2880, by=1440), labels=F, lwd=1, lwd.ticks=1)
axis(1, at=c(1, 1441, 2881), c("Thu", "Fri", "Sat"))
title(xlab = "datetime", ylab = "Voltage")

## Create a line plot
plot(d1$Sub_metering_1, axes=T, typ='l', xaxt = "n", ann=F)
lines(d1$Sub_metering_2, typ='l', col="red")
lines(d1$Sub_metering_3, typ='l', col="blue")
axis(1, at=seq(1, 2880, by=1440), labels=F, lwd=1, lwd.ticks=1)
axis(1, at=c(1, 1441, 2881), c("Thu", "Fri", "Sat"))
title(ylab = "Energy sub metering")
legend("topright", lwd=1, col = c("black","red", "blue"),  
       bty = "n", pt.cex=1, cex=0.7,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create a line plot
plot(d1$Global_reactive_power, 
     axes=T,  typ='l', xaxt = "n", ann=F)
axis(1, at=seq(1, 2880, by=1440), labels=F, lwd=1, lwd.ticks=1)
axis(1, at=c(1, 1441, 2881), c("Thu", "Fri", "Sat"))
title(xlab = "datetime", ylab = "Global_reactive_power")

## Copy Global Active Power to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
## Don't forget to close the PNG device
dev.off()                           
