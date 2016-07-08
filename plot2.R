mydata<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings = "?")
##We pick the dates we want.
mydata<-mydata[(mydata$Date=="2/2/2007")|(mydata$Date=="1/2/2007"),]

##Then we convert the columns we will is into their units
mydata$Time<-paste(mydata$Date,mydata$Time,sep=" ")
mydata$Time<-strptime(mydata$Time,format="%d/%m/%Y %H:%M:%S")

#We now open de device and make the plot
png(filename = "plot2.png")
plot(x=mydata$Time,mydata$Global_active_power,type="l",xlab="Days",ylab="Global Active Power (kilowatts)")
dev.off()