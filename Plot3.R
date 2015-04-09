library(graphics)
## read 
epc <- read.csv("household_power_consumption.txt", sep= ";", header = TRUE)
                
## create a 'date' type variable form Date column for subsetting
epc$Date2 <- as.Date(strptime(epc$Date,"%d/%m/%Y"))

## select February 1st and 2nd of 2007 for sample
epcsubset <- subset(epc, Date2 >= "2007-02-01" & Date2 <= "2007-02-02") 

## convert Sub_metering_1 and sub_metering_2 from factors to numeric
epcsubset$Sub_metering_1 <- 
    as.numeric(levels(epcsubset$Sub_metering_1))[epcsubset$Sub_metering_1]
epcsubset$Sub_metering_2 <- 
    as.numeric(levels(epcsubset$Sub_metering_2))[epcsubset$Sub_metering_2]

##open graphic device and save plot into file Plot3.png 
png("Plot3.png", width = 480, height = 480)

## plot grpah for Sub_metering_1
plot(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
     epcsubset$Sub_metering_1, type = "l", xlab="", 
     ylab = "Energy Sub metering")
lines(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
     epcsubset$Sub_metering_2,col="red")
lines(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
      epcsubset$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub-metering1","Sub-metering2","Sub-metering3"),
       col = c("black","red","blue"), lty = c(1,1,1))

dev.off()