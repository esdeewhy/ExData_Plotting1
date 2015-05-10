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

# Plotting 2: 
x<- data$Datetime
y<- data$Global_active_power
with(data, {
  plot(x, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", col = "black") 
})


