library(graphics)
## read 
epc <- read.csv("household_power_consumption.txt", sep= ";", header = TRUE)

epc$Date2 <- as.Date(strptime(epc$Date,"%d/%m/%Y")) ## convert Date to 'date'

## select February 1st and 2nd of 2007 for sample
epcsubset <- subset(epc, Date2 >= "2007-02-01" & Date2 <= "2007-02-02") 

##convert Global_active_power from factor to numeric
epcsubset$Global_active_power <- 
    as.numeric(levels(epcsubset$Global_active_power))[epcsubset$Global_active_power]

## open a graphic device , set output file to Plot2.png
png("Plot2.png", width = 480, height = 480)

##plot date + time vs global active power
plot(strptime(paste(epcsubset$Date,epcsubset$Time), "%d/%m/%Y %H:%M:%S"),
     epcsubset$Global_active_power, type = "l", xlab="", 
     ylab = "Global Active Power (kilowatts)")

#close device
dev.off()