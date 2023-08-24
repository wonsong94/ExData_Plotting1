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
## Problem 3
png("C:/Users/wss/Desktop/exploratory/ExData_Plotting1/plot3.png")
plot(as.numeric(Sub_metering_1) ~ AllDate, tab_all, type='l', col='black', 
     xlab = "",
     ylab = "Energy sub metering")
lines(as.numeric(Sub_metering_2) ~ AllDate, tab_all, col='red')
lines(as.numeric(Sub_metering_3) ~ AllDate, tab_all, col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       fill=c("black", "red","blue"))
dev.off()
