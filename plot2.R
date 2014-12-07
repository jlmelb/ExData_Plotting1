plot2 <- function(directory){
        
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
        png(filename = "./plot2.png", width = 480, height = 480, bg = "white")
        
        ##Creates continuous plot with no xlabel and a ylabel
        with(subsetdat, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
        
        ##Closes PNG device
        dev.off()
        
}