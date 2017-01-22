# read data and subset with observations from February 1st and 2nd, 2007
energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
smpl <- energy[as.character(energy$Date)=="1/2/2007"|as.character(energy$Date)=="2/2/2007",]

# set system locale and create variable date-time variable
Sys.setlocale("LC_TIME", "C")
smpl$datetime <- strptime(paste(smpl$Date, smpl$Time), "%d/%m/%Y %H:%M:%S")

#Create plot 2 and write it to a png file
png(file="plot2.png")
plot(smpl$datetime, smpl$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
