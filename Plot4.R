library(graphics)
## read 
epc <- read.csv("household_power_consumption.txt", sep= ";", header = TRUE
)

## create a 'date' type variable from Date column for subsetting
epc$Date2 <- as.Date(strptime(epc$Date,"%d/%m/%Y")) ## convert Date to 'date'

## select February 1st and 2nd of 2007 for sample

epcsubset <- subset(epc, Date2 >= "2007-02-01" & Date2 <= "2007-02-02")  

## convert  Votlage, Global reactive power, Global activve power, submetering1
## submetering 2 to numeric data type
epcsubset$Voltage <- as.numeric(levels(epcsubset$Voltage))[epcsubset$Voltage]
epcsubset$Global_active_power <- 
    as.numeric(levels(epcsubset$Global_active_power))[epcsubset$Global_active_power]
epcsubset$Global_reactive_power <- 
    as.numeric(levels(epcsubset$Global_reactive_power))[epcsubset$Global_reactive_power]
epcsubset$Sub_metering_1 <- 
        as.numeric(levels(epcsubset$Sub_metering_1))[epcsubset$Sub_metering_1]
epcsubset$Sub_metering_2 <- 
        as.numeric(levels(epcsubset$Sub_metering_2))[epcsubset$Sub_metering_2]

## open graphic device to write save plot into a Plot4.png

png("Plot4.png")

## set grpahical paramters : 

## to display 4 plots in 2 * 2
par(mfcol = c(2,2))
## set margins to accomodate 4 plots
par(mar=c(4,4,2,2))

plot(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
     epcsubset$Global_active_power, type = "l", xlab="", 
     ylab = "Global Active Power (kilowatts)")
plot(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
     epcsubset$Sub_metering_1, type = "l", xlab="", 
     ylab = "Energy Sub metering")
lines(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
      epcsubset$Sub_metering_2,col="red")
lines(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
      epcsubset$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub-metering1","Sub-metering2","Sub-metering3"),
       col = c("black","red","blue"), bty = "n", lty = c(1,1,1),cex = 1)
plot(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
    epcsubset$Voltage, type = "l", xlab = "datetime",ylab = "Voltage")
plot(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
     epcsubset$Global_reactive_power, type = "l", xlab = "datetime",ylab = "Global Reactive Power")
dev.off()