# download data if necessary, then load it into memory

source("getdata.R")

# note the getdata script also defines a function plot_by_day for plotting time series labelled by day

par(mfrow = c(1, 1))
plot_by_day(d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(d$Sub_metering_2, type="l", col="red")
lines(d$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c("solid", "solid", "solid"))

# write to .png file
dev.copy(png, file="plot3.png")
dev.off()
