plot3 <- function(directory){
        
        ##directory allows user to pass a file path to set the WD for importation of data
        
        ##set WD directory
        setwd(directory)
        
        ##Read Data
        dat <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = F)
        
        ##Subset Data for dates 1/2/2007 & 2/2/2007
        subsetdat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")
        
        ##Pastes the Date and Time columns into new Column
        subsetdat <- cbind(DateTime = paste(subsetdat$Date, subsetdat$Time), subsetdat)
        
        ##convert DateTime column values in character type
        subsetdat[,"DateTime"] <- as.character(subsetdat$DateTime)
        
        ##Converts to posix valid date
        subsetdat[[1]] <- strptime(subsetdat$DateTime, format = "%d/%m/%Y %H:%M:%S")
        
        ##Opens PNG device
        png(filename = "./plot3.png", width = 480, height = 480, bg = "white")
        
        ##Creates empty plot with ylab
        with(subsetdat, plot(DateTime, Sub_metering_1, type = "n",xlab = "", ylab = "Energy sub metering"))
        
        ##Plots Sub_metering_1 values in black
        with(subsetdat, points(DateTime, Sub_metering_1, type = "l", col = "black"))
        
        ##Plots Sub_metering_2 values in red
        with(subsetdat, points(DateTime, Sub_metering_2, type = "l", col = "red"))
        
        ##Plots Sub_metering_3 values in blue
        with(subsetdat, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
        
        ##sets legend for 3 sub_metering columns
        legend("topright", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
               lty = 1)
        
        ##Closes PNG device
        dev.off()
        
}