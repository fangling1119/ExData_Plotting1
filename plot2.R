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

##plot2
png(filename="plot2.png",width=480,height=480)
dates<-as.Date(hpc$Date,"%d/%m/%Y")
time<-strptime(paste(dates,hpc$Time),"%Y-%m-%d %H:%M:%S")   
Global_active_power<-as.numeric(as.character(hpc$Global_active_power))
plot(time,Global_active_power,main="",xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()


