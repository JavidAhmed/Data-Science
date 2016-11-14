
#import required library

library("lubridate")


#import the given file into data frame
hh_power_cons <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors = F, header = T, strip.white = T)

#change data type of Date column to Date data type.
hh_power_cons$Date <- as.Date(hh_power_cons$Date, "%d/%m/%Y")

#Filter only two months of data
hh_power_cons_feb <- hh_power_cons[month(hh_power_cons$Date) == 2 & year(hh_power_cons$Date) == 2007 &day(hh_power_cons$Date) %in% c(1,2),]

#draw a histogram
hist(as.numeric(hh_power_cons_feb$Global_active_power), main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "Red")


dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()







