library(dplyr)
library(lubridate)
setwd("C:/Users/wss/Desktop/exploratory/ExData_Plotting1/")
table <- tibble::as.tibble(read.table("household_power_consumption.txt", sep = ";", header = TRUE))

int <- interval(ymd("2001-01-01"), ymd("2002-01-01"))

tab_all <- table %>% mutate(AllDate = paste(Date, Time, sep = " ")) %>% 
  mutate(AllDate = dmy_hms(AllDate)) %>%
  select(-c(Date, Time)) %>% 
  filter(AllDate %within% interval(ymd("2007-02-01"), ymd("2007-02-03")))

Sys.setlocale("LC_TIME", "en_US")
## Problem 4
png("C:/Users/wss/Desktop/exploratory/ExData_Plotting1/plot4.png")

par(mfrow=c(2,2))

# Plot 1: Global Active Power for all dates
plot(Global_active_power ~ AllDate, tab_all, xaxt = "n", type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
axis.POSIXct(1, at=tab_all$AllDate, labels=format(tab_all$AllDate, "%a"))

# Plot 2: Voltage for all dates
plot(Voltage ~ AllDate, tab_all, xaxt = "n", type = "l", 
     xlab = "datetime",
     ylab = "Voltage")
axis.POSIXct(1, at=tab_all$AllDate, labels=format(tab_all$AllDate, "%a"))

# Plot 3: Energy Sub metering
## Problem 3
plot(as.numeric(Sub_metering_1) ~ AllDate, tab_all, type='l', col='black', 
     xlab = "",
     ylab = "Energy sub metering")
lines(as.numeric(Sub_metering_2) ~ AllDate, tab_all, col='red')
lines(as.numeric(Sub_metering_3) ~ AllDate, tab_all, col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       fill=c("black", "red","blue"))
axis.POSIXct(1, at=tab_all$AllDate, labels=format(tab_all$AllDate, "%a"))

# Plot 4: Global Reactive Power for all dates
plot(Global_reactive_power ~ AllDate, tab_all, xaxt = "n", type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power (kilowatts)")
axis.POSIXct(1, at=tab_all$AllDate, labels=format(tab_all$AllDate, "%a"))

dev.off()
