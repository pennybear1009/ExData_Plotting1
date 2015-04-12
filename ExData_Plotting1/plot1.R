## read file into R (set missing value to ?)
file <- read.table("household_power_consumption.txt",header=TRUE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sep=";", na.strings ="?")
## subset file with 2 days data
dat <- subset(file, Date=="1/2/2007"|Date=="2/2/2007")
## convert Date and Time into Date/Time class
DT <- paste(dat$Date,dat$Time)
dat$DT <- strptime(DT,format="%d/%m/%Y %H:%M:%S")

## create a png file and write plot into it
png(filename="plot1.png", width=480, height=480)
with(dat,hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)"))
dev.off()


