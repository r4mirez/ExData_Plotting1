# The following script can be used to plot the exercise 4 of
# Course Project 1 into the file "plot4.png", provided the file
# "household_power_consumption.txt" is located in the working
# directory. If you want to plot it to screen, just copy the
# code to R avoiding the first and the last code lines.
# As long as my computer works in spanish, I had to begin
# with the function Sys.setlocale("LC_TIME", "English"), so the
# week days show in english. If your computer already works in
# english, it will not be necessary.

#Graphics device on:
png("plot4.png", width = 480, height = 480, units= "px")

# Dataframe df loaded from text file:
df <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
# Date converted to time object:
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
# Dataframe myData created as subset for the selected days:
myData <- subset(df, df$Date == "2007-02-01" | df$Date == "2007-02-02")
myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))
myData$Global_reactive_power <- as.numeric(as.character(myData$Global_reactive_power))
myData$Voltage <- as.numeric(as.character(myData$Voltage))
# New time vector combining Date and Time cols:
time <- paste(myData$Date, myData$Time, sep=" ")
time <- as.POSIXlt(time, "%Y-%m-%d %H:%M:%S")
myData$Sub_metering_1 <- as.numeric(as.character(myData$Sub_metering_1))
myData$Sub_metering_2 <- as.numeric(as.character(myData$Sub_metering_2))
myData$Sub_metering_3 <- as.numeric(as.character(myData$Sub_metering_3))
# Preparing canvas (2x2):
par(mfcol = c(2,2), mar=c(5,5,1,1))
# Plotting top-left:
plot(time, myData$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(time, myData$Global_active_power, type="l")
# Plotting bottom-left:
plot(time, myData$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(time, myData$Sub_metering_1, col="black", type="l")
lines(time, myData$Sub_metering_2, col="red", type="l")
lines(time, myData$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
# Plotting top-right:
plot(time, myData$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(time, myData$Voltage, type="l")
# Plotting bottom-right:
plot(time, myData$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(time, myData$Global_reactive_power, type="l")

#Graphics device off:
dev.off()