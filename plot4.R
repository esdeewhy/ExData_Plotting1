getwd()

# reading data
myData<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)

# Formating Date
myData$Date<- as.Date(myData$Date, format = "%d/%m/%Y")

# Subsetting data to the range dates
data<- subset(myData, myData$Date >= "2007-02-01" & Date <= "2007-02-02")

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plotting 4 and saving as png file:
png('plot4.png', width = 480, height = 480, units = "px", pointsize = 12)
#  Set up plotting in two rows and two columns, plotting along rows first.
par( mfrow = c( 2, 2 ), mar = c(4,4,2,1), oma = c(0,0,2,0))

x<- data$Datetime
y1<- data$Sub_metering_1
y2<- data$Sub_metering_2
y3<- data$Sub_metering_3
y4<- data$Global_active_power
y5<- data$Voltage
y6<- data$Global_reactive_power
with(data, { 
 plot(x, y4, type = "l", xlab = "", ylab = "Global Active Power", col = "black") # plot on column 1, row 1
 plot(x, y5, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")  # plot on column 2, row 1
 plot(x,y1,type="l", col="black", ylab = "Energy sub metering", xlab = "") # plot on column 1, row 2
 lines(x,y2,col="red")
 lines(x,y3,col="blue")
 labels<- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
 legend("topright", bty = "n", labels, col = c("black", "red", "blue"), lty = 1, lwd = 2)
 plot(x, y6, type = "l", xlab = "datetime", ylab = "Global_reactive_power", col = "black")  # plot on column 2, row 2
})
dev.off()