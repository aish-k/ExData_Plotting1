powerdata<- read.csv("C:/Users/Aishwarya/Documents/Data Science Specialization John hopkins/Exploratory data Analytics/Week 1/Assignment/ExData_Plotting1/household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors = FALSE)
powerdata$Date<-as.Date(powerdata$Date , format="%d/%m/%Y")
powerdata <- subset(powerdata, Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y"))
powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
powerdata$Voltage <- as.numeric(powerdata$Voltage)
powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

powerdata$DateTime <- as.POSIXct(paste(powerdata$Date, powerdata$Time))
png(filename="plot4.png",width=480,height = 480)

par(mfcol = c(2, 2), mar = c(4, 4, 3, 2))
#graph 1
with(powerdata,plot(Global_active_power~DateTime,type="l",ylab = "Global Active Power",xlab=""))

#Graph 2: 

plot(powerdata$Sub_metering_1~powerdata$DateTime,type = "l",xlab="",ylab="Energy Sub metering")
lines(powerdata$Sub_metering_2~powerdata$DateTime,type = "l",col="red")
lines(powerdata$Sub_metering_3~powerdata$DateTime,type = "l",col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))


#Graph 3: 
with(powerdata,plot(Voltage~DateTime,type="l",ylab = "Voltage",xlab="datetime"))

#graph 4: 
with(powerdata,plot(Global_reactive_power~DateTime,type="l",ylab = "Global_reactive_power",xlab="datetime"))

dev.off()