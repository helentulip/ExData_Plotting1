rawdata<-read.table("household_power_consumption.txt",header=T,sep=";",comment.char="%",stringsAsFactor=FALSE,na.string="?")
rawdata<-na.omit(rawdata)
data<-rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]
data$Time<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
dev.copy(png,file="plot1")
dev.off()