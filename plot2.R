##Get the data for February 1-2, 2007 and creates new time variable.

file<-"exdata-data-household_power_consumption/household_power_consumption.txt"
header<-read.table(file,nrows=1,header=FALSE,sep =';',stringsAsFactors=FALSE)
dat<-read.table(file,skip=66637,nrows=2880,header=FALSE,sep=';')
colnames(dat)<-unlist(header)
dat$Date_and_Time<-apply(dat[,c(1,2)],1,paste,collapse="-")
dat$Date_and_Time<-strptime(dat$Date_and_Time,"%d/%m/%Y-%H:%M:%S")

##Plot and save png file of Global Active Power over time

png(filename='plot2.png')
plot(
	dat$Date_and_Time,
	dat$Global_active_power,
	type="n",
	xlab="",
	ylab="Global Active Power (kilowatts)"
	)
lines(
	dat$Date_and_Time,
	dat$Global_active_power,
	type="l"
	)
dev.off()