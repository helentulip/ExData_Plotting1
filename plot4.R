rawdata<-read.table("household_power_consumption.txt",header=T,sep=";",comment.char="%",stringsAsFactor=FALSE,na.string="?")
rawdata<-na.omit(rawdata)
data<-rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]
data$Time<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
with(data,{
    plot(data$Time,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
    plot(data$Time,data$Voltage,type="l",ylab="Voltage",xlab="datetime")
    plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",lwd=1,type="l",xlab="")
    lines(data$Time,data$Sub_metering_2,col="red")
    lines(data$Time,data$Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5,bty="n")
    plot(data$Time,data$Global_reactive_power,type="l",ylab="Global_rective_power",xlab="datetime")
})
dev.copy(png,file="plot4")
dev.off()