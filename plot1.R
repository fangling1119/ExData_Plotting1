##读数据
memory.limit()
household_power_consumption<-read.table("./household_power_consumption.txt",header = TRUE, sep = ";")
str(household_power_consumption)
dim(household_power_consumption)
##取子集   using data from the dates 2007-02-01 and 2007-02-02
dates<-household_power_consumption$Date
times<-household_power_consumption$Time
dates<-as.Date(dates,"%d/%m/%Y")
i<-grep("2007-02-01", dates)
j<-grep("2007-02-02", dates)
k<-c(i,j)
hpc<-household_power_consumption[k,]


##plot1
png(filename="plot1.png",width=480,height=480)
Global_active_power<-as.numeric(as.character(hpc$Global_active_power))
hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

