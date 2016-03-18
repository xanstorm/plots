#Plot 3
setwd("/Users/stephenhobbs1/Data science/4-Exploratory Data/1")
data <- read.table("household_power_consumption.txt",header = TRUE, sep =";", stringsAsFactors = FALSE, na.strings = "?") 
##nrows=10 to see 10 rows Read text file, look @ 1st 10 rows, read 1 2 col as character vector, not factor vector; na.strings 
#change ? which in data stands for no value, to NA.
index <- (data$Date=="1/2/2007") |(data$Date=="2/2/2007")#Subsets data for these days, creates an object called index
df<-data[index,] # Create subset of data with dates above

#Plot
paste(df$Date,df$Time,sep = " ") #Combine date and time to char vector
DateTime<-strptime(paste(df$Date,df$Time,sep = " "),format="%d/%m/%Y %H:%M:%S")# Creates datetime vector
df.tidy<-cbind(DateTime,df[,-(1:2)])

png(file="Plot3.png",width = 480, height = 480)
with(df.tidy, {
        plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        points(DateTime, Sub_metering_2, type = "l", col="red")
        points(DateTime, Sub_metering_3, type = "l", col="blue")
        legend("topright", legend=paste("Sub_metering_", 1:3,sep=""), col=c("black","red","blue"),lty=1)
})
dev.off()
