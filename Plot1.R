setwd("/Users/stephenhobbs1/Data science/4-Exploratory Data/1")
data <- read.table("household_power_consumption.txt",header = TRUE, sep =";", stringsAsFactors = FALSE, na.strings = "?") 
##nrows=10 to see 10 rows Read text file, look @ 1st 10 rows, read 1 2 col as character vector, not factor vector; na.strings 
#change ? which in data stands for no value, to NA.
index <- (data$Date=="1/2/2007") |(data$Date=="2/2/2007")#Subsets data for these days, creates an object called index
df<-data[index,] # Create subset of data with dates above



#Plot
png(file="Plot1.png",width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)", 
xlim=c(0,7.5), axes=FALSE)
axis(1, at=c(0,2,4,6),labels = TRUE)
axis(2, at=c(0,200,400,600,800,1000,1200), labels = TRUE)
dev.off()
