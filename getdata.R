# make a temporary data directory for the data if necessary

print("Checking the data directory exists")
destDir = "./data"
if (!file.exists(destDir)) {
  dir.create(destDir)
}

# download the zip file if necessary

print("Checking the data file has been downloaded")
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile="./data/household_power_consumption.zip"
if (!file.exists(zipFile)) {
  print("Downloading the file")
  download.file(fileUrl, destfile=zipFile, method="curl")
}

# unzip the file if necessary

print("Checking the data file has been unzipped")
destFile = "data/household_power_consumption.txt"
if (!file.exists(destFile)) {
  print("Unzipping the file")
  unzip(destFile, exdir=destDir)
}

# now load the data

print("Reading in the data file")
data = read.csv(destFile, sep=";", na.strings=c("?"))

# create subset for 2007-02-01 and 2007-02-02

d <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

# format the date field

d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$Day <- strftime(d$Date, '%a')

# create function for creating plots with x-axis labelled by day
plot_by_day <- function(...) {
  plot(..., xaxt="n")
  axis(side=1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
}