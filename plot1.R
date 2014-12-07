plot1 <- function(directory){

##directory allows user to pass a file path to set the WD for importation of data
        
##set WD directory
setwd(directory)

##Read Data
dat <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

##Subset Data for dates 1/2/2007 & 2/2/2007
subsetdat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")
        
##Opens PNG device
png(filename = "./plot1.png", width = 480, height = 480, bg = "white")

##Creates Histogram with x label, mainlabel to PNG device
hist(subsetdat$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "Red")

##Closes PNG device
dev.off()

}