library(dplyr)
library(sqldf)

png(filename = "plot3.png",
    width = 480, height = 480, units = "px",
    bg = "white")
intervalData <- read.csv.sql("household_power_consumption.txt", 
                             sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                             sep=";",
                             colClasses = c("character", "character", "numeric", "numeric",  
                                            "numeric", "numeric", "numeric", "numeric", "numeric"))

mutated <- mutate(intervalData, dateTime = as.POSIXct(paste(Date, Time), format ="%d/%m/%Y %H:%M:%S"))
plot(mutated$dateTime, mutated$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(mutated$dateTime, mutated$Sub_metering_2, type="l", col="red")
points(mutated$dateTime, mutated$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()