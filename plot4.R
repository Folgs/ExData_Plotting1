mydata<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings = "?")
##We pick the dates we want.
mydata<-mydata[(mydata$Date=="2/2/2007")|(mydata$Date=="1/2/2007"),]

##Then we convert the columns we will is into their units
mydata$Time<-paste(mydata$Date,mydata$Time,sep=" ")
mydata$Time<-strptime(mydata$Time,format="%d/%m/%Y %H:%M:%S")

##We set the space to save the four plots
par(mfrow=c(2,2))

##We open the file and save the four plots, and close it.
png(filename = "plot4.png")

plot(x=mydata$Time,mydata$Global_active_power,type="l",xlab="Days",ylab="Global Active Power (kilowatts)")

plot(mydata$Time,mydata$Sub_metering_1,type="l",xlab="Days",ylab="Energy sub metering")
lines(x=mydata$Time,y=mydata$Sub_metering_2,col="red")
lines(x=mydata$Time,y=mydata$Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_meterring_1","Sub_metering_2","Sub_metering_3"),pch=c("l","l","l"),col=c("black","red","blue"))

plot(mydata$Time,mydata$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(mydata$Time,mydata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()