library(dplyr)
library(sqldf)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px",
    bg = "white")
intervalData <- read.csv.sql("household_power_consumption.txt", 
                             sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                             sep=";",
                             colClasses = c("character", "character", "numeric", "numeric",  
                                            "numeric", "numeric", "numeric", "numeric", "numeric"))

mutated <- mutate(intervalData, dateTime = as.POSIXct(paste(Date, Time), format ="%d/%m/%Y %H:%M:%S"))
plot(mutated$dateTime, mutated$Global_active_power, type="l", ylab="Global Active Power(kilowatts)", xlab="")
dev.off()