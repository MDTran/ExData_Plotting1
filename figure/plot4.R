## http://rstudio-pubs-static.s3.amazonaws.com/19163_76f1855972154fac8b8846373c236cd0.html
options(stringsAsFactors = FALSE)
readFile <-  read.table("c:/dung/datascience/Explanatoryanalysis/household_power_consumption.txt", sep=";", header=TRUE,na.strings = "?")

readFile <- na.omit(readFile)
## https://github.com/rdpeng/ExData_Plotting1

## http://stackoverflow.com/questions/19455070/confusing-error-in-r-error-in-scanfile-what-nmax-sep-dec-quote-skip-nli
head (readFile)

nrow (readFile)

names (readFile)

head (readFile)

##readFile$V1 <-  as.Date(readFile$V1 , format = "%d/%m/%y")
##head(readFile)

summary (readFile)

str (readFile)


##http://rstudio-pubs-static.s3.amazonaws.com/19163_76f1855972154fac8b8846373c236cd0.html

##V3: chr  "Global_active_power" "4.216" "5.360" "5.374" ...
## V4: chr  "Global_reactive_power" "0.418" "0.436" "0.498" ...
## V5: chr  "Voltage" "234.840" "233.630" "233.290" ...
## V6: chr  "Global_intensity" "18.400" "23.000" "23.000" ...
## V7: chr  "Sub_metering_1" "0.000" "0.000" "0.000" ...
## V8: chr  "Sub_metering_2" "1.000" "1.000" "2.000" ...
## V9: chr  "Sub_metering_3" "17.000" "16.000" "17.000" ...


readFile$Global_active_power <- as.numeric (readFile$Global_active_power)
readFile$Global_reactive_power <- as.numeric (readFile$Global_reactive_power)
readFile$Voltage <- as.numeric (readFile$Voltage)
readFile$Global_intensity <- as.numeric (readFile$Global_intensity)

str (readFile)


readFile$Date
readFile$Date <- as.Date (readFile$Date, format='%d/%m/%Y')  ## original format of %d/%m/%Y
readFile$Date
date <- c("2007-02-01","2007-02-02")
##readFile = subset(readFile, as.Date(readFile$Date) >= '2007-02-01' & as.Date(readFile$Date) <= '2007-02-02')
readFile = subset(readFile, as.Date(readFile$Date) >= date[1] & as.Date(readFile$Date) <= date[2])
getOption ("max.print")
readFile[1500:1505,]


## coi choi ma thoi . Looking at only

## answer 1

##hist (readFile$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts", ylab = "Frequency")


## answer 2

readFile$datetime <- paste (readFile$Date,readFile$Time)

readFile$datetime <- strptime (readFile$datetime,format = "%Y-%m-%d %H:%M:%S")

head(readFile)

str (readFile)

##plot (readFile$datetime,readFile$Global_active_power,type="l",main = "" , xlab = "", ylab = "Global active power (kilowatts)")





## answer 3






dev.off()


## answer 4

png("c:/dung/datascience/Explanatoryanalysis/Plot4.png", width = 3, height = 4, units = 'in', res = 300)

par (mfrow = c(2,2))


plot (readFile$datetime,readFile$Global_active_power,type="l",main = "" , xlab = "", ylab = "Global active power")

plot (readFile$datetime,readFile$Voltage,type="l",main = "" , xlab = "datetime", ylab = "Voltage")



plot (readFile$datetime,readFile$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")


points (readFile$datetime,readFile$Sub_metering_2,type = "l", col = "red")
points (readFile$datetime,readFile$Sub_metering_3,type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty = "n", )


plot (readFile$datetime,readFile$Global_reactive_power,type="l",main = "" , xlab = "", ylab = "Global_reactive_power")

dev.off()

#############################################################



