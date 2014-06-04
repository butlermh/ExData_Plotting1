# download data if necessary, then load it into memory

source("getdata.R")

# note getdata also defines a function plot_by_day for plotting time series labelled by day

plot_by_day(d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# write to .png file
dev.copy(png, file="plot2.png")
dev.off()

