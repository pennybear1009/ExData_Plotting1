## read file into R (set missing value to ?)
file <- read.table("household_power_consumption.txt",header=TRUE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sep=";", na.strings ="?")
## subset file with 2 days data
dat <- subset(file, Date=="1/2/2007"|Date=="2/2/2007")
## convert Date and Time into Date/Time class
DT <- paste(dat$Date,dat$Time)
dat$DT <- strptime(DT,format="%d/%m/%Y %H:%M:%S")

## create a png file and write plot into it
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2),oma=c(0,0,0,0),mar=c(4,4,2,1))
with(dat, {
        plot(DT,Global_active_power, type='l',ylab="Global Active Power",xlab="")
        plot(DT,Voltage, type='l', xlab="datetime", ylab="Voltage")
        plot(DT,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
        points(DT,Sub_metering_1, type="l", col="black")
        points(DT,Sub_metering_2, type="l",col="red")
        points(DT,Sub_metering_3, type="l",col="blue")
        legend("topright", col=c("black","red","blue"),lty=c(1,1,1),border="white",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(DT,Global_reactive_power, type='l', xlab="datetime", ylab="Global_reactive_power")
})
dev.off()