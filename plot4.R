#import required library
library("lubridate")


#import the given file into data frame
hh_power_cons <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors = F, header = T, strip.white = T)

#change data type of Date column to Date data type.
hh_power_cons$Date <- as.Date(hh_power_cons$Date, "%d/%m/%Y")

#Filter only two months of data
hh_power_cons_feb <- hh_power_cons[month(hh_power_cons$Date) == 2 & year(hh_power_cons$Date) == 2007 &day(hh_power_cons$Date) %in% c(1,2),]

#create 2x2 plot spaces
par(mfrow =c(2,2))

plot(datetime, as.numeric(hh_power_cons_feb$Global_active_power), type = "l", xlab = "",ylab = "Global Active Power")
plot(datetime, as.numeric(hh_power_cons_feb$Voltage), type = "l", xlab = "",ylab = "Voltage")

#generate the plot and add more lines to the same.
plot(datetime, as.numeric(hh_power_cons_feb$Sub_metering_1), type = "l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(hh_power_cons_feb$Sub_metering_2), type = "l", col = "red")
lines(datetime, as.numeric(hh_power_cons_feb$Sub_metering_3), type = "l", col = "blue")

#give legends to the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2,bty = 0, col=c("black", "red", "blue"))




plot(datetime, as.numeric(hh_power_cons_feb$Global_reactive_power), type = "l", xlab = "",ylab = "Global Reactive Power")


dev.copy(png, file = "plot4.png", width = 480, height = 480)

dev.off()


