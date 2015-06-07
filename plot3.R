getwd()

## reading data
myData<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)

## Formating Date
myData$Date<- as.Date(myData$Date, format = "%d/%m/%Y")

## Subsetting data to the range dates
data<- subset(myData, myData$Date >= "2007-02-01" & Date <= "2007-02-02")

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting 3 and saving as png: 
x<- data$Datetime
y1<- data$Sub_metering_1
y2<- data$Sub_metering_2
y3<- data$Sub_metering_3
png('plot3.png', width = 480, height = 480, units = "px", pointsize = 12)
with(data, {
    plot(x,y1,type="l", col="black", ylab = "Energy sub metering", xlab = "")
    lines(x,y2,col="red")
    lines(x,y3,col="blue")
    labels<- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", labels, col = c("black", "red", "blue"), lty = 1, cex=0.75, lwd = 3, x.intersp = 1, y.intersp = 3)
})
dev.off ()
