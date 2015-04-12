## read file into R (set missing value to ?)
file <- read.table("household_power_consumption.txt",header=TRUE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sep=";", na.strings ="?")
## subset file with 2 days data
dat <- subset(file, Date=="1/2/2007"|Date=="2/2/2007")
## convert Date and Time into Date/Time class
DT <- paste(dat$Date,dat$Time)
dat$DT <- strptime(DT,format="%d/%m/%Y %H:%M:%S")

## create a png file and write plot into it
png(filename="plot3.png", width=480, height=480)
plot(dat$DT,dat$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(dat$DT,dat$Sub_metering_1, type="l", col="black")
points(dat$DT,dat$Sub_metering_2, type="l",col="red")
points(dat$DT,dat$Sub_metering_3, type="l",col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


