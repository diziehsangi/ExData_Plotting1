library(sqldf)
library(dplyr)

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
intervalData <- read.csv.sql("household_power_consumption.txt", 
                             sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                             sep=";",
                             colClasses = c("character", "character", "numeric", "numeric",  
                                            "numeric", "numeric", "numeric", "numeric", "numeric"))

par(mfrow=c(2,2))
#top left
plot(mutated$dateTime, mutated$Global_active_power, type="l", ylab="Global Active Power", xlab="")
#top right
plot(mutated$dateTime, mutated$Voltage, type="l", ylab="Voltage", xlab="datetime")
#bottom left
plot(mutated$dateTime, mutated$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(mutated$dateTime, mutated$Sub_metering_2, type="l", col="red")
points(mutated$dateTime, mutated$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", lty=c(1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#bottom right
plot(mutated$dateTime, mutated$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()