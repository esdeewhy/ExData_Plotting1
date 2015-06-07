getwd()

## reading data
myData<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)

# Formating Date
myData$Date<- as.Date(myData$Date, format = "%d/%m/%Y")

## Subsetting data to the range dates
data<- subset(myData, myData$Date >= "2007-02-01" & Date <= "2007-02-02")

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting graph 1: 

hist(data$Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "red")
