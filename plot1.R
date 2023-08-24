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
## Problem 1
Global_active_power <- as.numeric(tab_all$Global_active_power)
png("C:/Users/wss/Desktop/exploratory/ExData_Plotting1/plot1.png")
hist(Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
