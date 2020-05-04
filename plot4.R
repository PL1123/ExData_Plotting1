#Getting to the correct directory with the dataset
getwd()
setwd("./dataset")

#read in the data
plotdata <- read.table("household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?", stringsAsFactors = FALSE, 
                       dec=".")
plotdatasub <- plotdata[plotdata$Date %in% c("1/2/2007", "2/2/2007"),]
GAP <- as.numeric(plotdatasub$Global_active_power)
#Similar as plot2 [use as.numeric]
time_date <- paste(plotdatasub$Date, plotdatasub$Time, sep="")
time <- strptime(time_date, "%d/%m/%Y%H:%M:%S")
sub_1 <- as.numeric(plotdatasub$Sub_metering_1)
sub_2 <- as.numeric(plotdatasub$Sub_metering_2)
sub_3 <- as.numeric(plotdatasub$Sub_metering_3)
GRP <- as.numeric(plotdatasub$Global_reactive_power)
vol <- as.numeric(plotdatasub$Voltage)
GI <- as.numeric(plotdatasub$Global_intensity)
png("plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))
### Plotting each; same as previous plot (mostly similar)
plot(time,GAP,xlab="",ylab="Global Active Power", type = "l")
plot(time,vol, xlab="Datetime", ylab="Voltage", type="l")
plot(time, sub_1, xlab="", ylab="Energy sub meeting", type = "l")
lines(time, sub_2, col="red", type="l")
lines(time, sub_3, col="blue", type="l")
legend("topright", legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd = 2, lty = 1)
plot(time, GRP, xlab="Datetime", ylab="Global reactive power", type = "l")
dev.off()





