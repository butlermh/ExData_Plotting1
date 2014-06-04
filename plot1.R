# download data if necessary, then load it into memory

source("getdata.R")

hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# write to .png file
dev.copy(png, file="plot1.png")
dev.off()




