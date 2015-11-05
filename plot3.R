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

##plot3
png(filename="plot3.png",width=480,height=480)
dates<-as.Date(hpc$Date,"%d/%m/%Y")
time<-strptime(paste(dates,hpc$Time),"%Y-%m-%d %H:%M:%S")   
Sub_metering_1<-as.numeric(as.character(hpc$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(hpc$Sub_metering_2))
Sub_metering_3<-hpc$Sub_metering_3
plot(time,Sub_metering_1,col="black",main="",xlab="",ylab="Energy sub metering",type="l")
lines(time,Sub_metering_2,col="red")
lines(time,Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),cex = 1)
dev.off()

