#Reading file and changing the data types as required for analysis purposes

fdata = read.table("C:\\AA\\CourseraDataScienceDataSets\\household_power_consumption.txt",header = TRUE, sep = ";")
fdata$Date<-as.Date(fdata$Date,"%d/%m/%Y")
fdata1<-fdata[fdata$Date=="2007-02-01"| fdata$Date=="2007-02-02",]
fdata1$Time<-as.character(fdata1$Time)
fdata1$Global_active_power<-as.character(fdata1$Global_active_power)
fdata1$Global_reactive_power<-as.character(fdata1$Global_reactive_power)
fdata1$Voltage<-as.character(fdata1$Voltage)
fdata1$Global_intensity<-as.character(fdata1$Global_intensity)
fdata1$Sub_metering_1<-as.character(fdata1$Sub_metering_1)
fdata1$Sub_metering_2<-as.character(fdata1$Sub_metering_2)
fdata1$Sub_metering_3<-as.character(fdata1$Sub_metering_3)
fdata1$CompleteTime<-strptime(paste(fdata1$Date,fdata1$Time),format="%Y-%m-%d %T")


#Plot3.R
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(fdata1$CompleteTime,as.numeric(fdata1$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(fdata1$CompleteTime,as.numeric(fdata1$Sub_metering_2),col="red")
lines(fdata1$CompleteTime,as.numeric(fdata1$Sub_metering_3),col="blue")
legend("topright",col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()
