# read data and subset with observations from February 1st and 2nd, 2007
energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
smpl <- energy[as.character(energy$Date)=="1/2/2007"|as.character(energy$Date)=="2/2/2007",]

# set system locale and create date-time variable
Sys.setlocale("LC_TIME", "C")
smpl$datetime <- strptime(paste(smpl$Date, smpl$Time), "%d/%m/%Y %H:%M:%S")

#Create plot 3 and write it to a png file
png(file="plot3.png")
plot(smpl$datetime, smpl$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(smpl$datetime, smpl$Sub_metering_2, type = "l", col = "red")
points(smpl$datetime, smpl$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
