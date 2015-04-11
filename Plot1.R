library(graphics)
## read 
epc <- read.csv("household_power_consumption.txt", sep= ";", header = TRUE)

epc$Date <- as.Date(strptime(epc$Date,"%d/%m/%Y")) ## convert Date to 'date'

## select February 1st and 2nd of 2007 for sample
epcsubset <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02") 

##convert Global_active_power from factor to numeric

epcsubset$Global_active_power <- 
    as.numeric(levels(epcsubset$Global_active_power))[epcsubset$Global_active_power]

## open a graphic device , set output file to Plot1.png
## default height 480 and width 480
png("Plot1.png")
hist(epcsubset$Global_active_power,col = 'red',main = "Global Active Power",
     ,xlab = "Global Active Power(kilowatts)")
dev.off()



