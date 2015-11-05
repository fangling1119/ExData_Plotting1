##?????????
memory.limit()
household_power_consumption<-read.table("./household_power_consumption.txt",header = TRUE, sep = ";")
str(household_power_consumption)
dim(household_power_consumption)
##?????????   using data from the dates 2007-02-01 and 2007-02-02
dates<-household_power_consumption$Date
times<-household_power_consumption$Time
dates<-as.Date(dates,"%d/%m/%Y")
i<-grep("2007-02-01", dates)
j<-grep("2007-02-02", dates)
k<-c(i,j)
hpc<-household_power_consumption[k,]

##plot4
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
dates<-as.Date(hpc$Date,"%d/%m/%Y")
time<-strptime(paste(dates,hpc$Time),"%Y-%m-%d %H:%M:%S")   
Global_active_power<-as.numeric(as.character(hpc$Global_active_power))
plot(time,Global_active_power,main="",xlab="",ylab="Global Active Power",type="l",cex=1)
Voltage<-as.numeric(as.character(hpc$Voltage))
plot(time,Voltage,main="",xlab="datetime",ylab="Voltage",type="l",cex=1)
Sub_metering_1<-as.numeric(as.character(hpc$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(hpc$Sub_metering_2))
Sub_metering_3<-hpc$Sub_metering_3
plot(time,Sub_metering_1,col="black",main="",xlab="",ylab="Energy sub metering",type="l",cex=0.9)
lines(time,Sub_metering_2,col="red")
lines(time,Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "),cex = 0.5,bty="n")
Global_reactive_power<-as.numeric(as.character(hpc$Global_reactive_power))
plot(time,Global_reactive_power,main="",xlab="datetime",ylab="Global_reactive_power",type="l",cex=1)
dev.off()