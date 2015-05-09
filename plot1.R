## Plot1.R
## Create a histogram plot and PNG file using data for the dates 2007-02-01 and 2007-02-02

## Read data from text file
d <- read.table("household_power_consumption.txt", 
     header = TRUE,
     na.strings = "?",
     sep=";", 
     colClasses = c("character", "character", "numeric", "numeric", "numeric",
                    "numeric", "numeric", "numeric","numeric"))

## Create a histogram plot
hist(subset(d, 
    as.Date(d$Date, "%d/%m/%Y") >= as.Date("2007-02-01") &
    as.Date(d$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))$Global_active_power,
    xlab = "Global Active Power (kilowatts)", 
    ylab = "Frequency",
    main = "Global Active Power",
    col = "red")

## Copy Global Active Power to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
## Don't forget to close the PNG device
dev.off()                           
