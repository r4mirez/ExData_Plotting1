# The following script can be used to plot the exercise 3 of
# Course Project 1 into the file "plot3.png", provided the file
# "household_power_consumption.txt" is located in the working
# directory. If you want to plot it to screen, just copy the
# code to R avoiding the first and the last code lines.
# As long as my computer works in spanish, I had to begin
# with the function Sys.setlocale("LC_TIME", "English"), so the
# week days show in english. If your computer already works in
# english, it will not be necessary.

#Graphics device on:
png("plot3.png", width = 480, height = 480, units= "px")

# Dataframe df loaded from text file:
df <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
# Date converted to time object:
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
# Dataframe myData created as subset for the selected days:
myData <- subset(df, df$Date == "2007-02-01" | df$Date == "2007-02-02")
# New time vector combining Date and Time cols:
time <- paste(myData$Date, myData$Time, sep=" ")
time <- as.POSIXlt(time, "%Y-%m-%d %H:%M:%S")
myData$Sub_metering_1 <- as.numeric(as.character(myData$Sub_metering_1))
myData$Sub_metering_2 <- as.numeric(as.character(myData$Sub_metering_2))
myData$Sub_metering_3 <- as.numeric(as.character(myData$Sub_metering_3))
# Plotting:
plot(time, myData$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(time, myData$Sub_metering_1, col="black", type="l")
lines(time, myData$Sub_metering_2, col="red", type="l")
lines(time, myData$Sub_metering_3, col="blue", type="l")
# Legend:
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Graphics device off:
dev.off()