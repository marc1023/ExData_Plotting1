##Get the data for February 1-2, 2007 and creates new time variable.

file<-"exdata-data-household_power_consumption/household_power_consumption.txt"
header<-read.table(file,nrows=1,header=FALSE,sep =';',stringsAsFactors=FALSE)
dat<-read.table(file,skip=66637,nrows=2880,header=FALSE,sep=';')
colnames(dat)<-unlist(header)
dat$Date_and_Time<-apply(dat[,c(1,2)],1,paste,collapse="-")
dat$Date_and_Time<-strptime(dat$Date_and_Time,"%d/%m/%Y-%H:%M:%S")

##Plot and save png file of Submetering 1, 2, and 3 over time.

png(filename='plot3.png')
plot(
	dat$Date_and_Time,
	dat$Sub_metering_1,
	type="n",
	xlab="",
	ylab="Energy sub metering"
	)
lines(
	dat$Date_and_Time,
	dat$Sub_metering_1,
	type="l",
	col="black"
	)
lines(
	dat$Date_and_Time,
	dat$Sub_metering_2,
	type="l",
	col="red"
	)
lines(
	dat$Date_and_Time,
	dat$Sub_metering_3,
	type="l",
	col="blue"
	)
legend(
	"topright",
	c("Sub_metering_1","Sub_metering_3","Sub_metering_3"),
	lwd=c(2.5,2.5,2.5),
	col=c("black","red","blue")
	)
dev.off()