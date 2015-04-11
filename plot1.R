library(sqldf)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
intervalData <- read.csv.sql("household_power_consumption.txt", 
                   sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                   sep=";",
                   colClasses = c("character", "character", "numeric", "numeric",  
                            "numeric", "numeric", "numeric", "numeric", "numeric"))

hist(intervalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)", ylim=c(0,1200))
dev.off()