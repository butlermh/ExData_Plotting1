# download data if necessary, then load it into memory

source("getdata.R")

# note getdata also defines a function plot_by_day for plotting time series labelled by day

par(mfrow = c(2, 2))

# first plot - Global active power
plot_by_day(d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# second plot - Voltage
plot_by_day(d$Voltage, type="l", xlab="datetime", ylab="Voltage")

# third plot - energy sub metering
plot_by_day(d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(d$Sub_metering_2, type="l", col="red")
lines(d$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c("solid", "solid", "solid"), bty="n")

# fourth plot - Global reactive power
plot_by_day(d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# write to .png file
dev.copy(png, file="plot4.png")
dev.off()
