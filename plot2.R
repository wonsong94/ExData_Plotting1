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
## Problem 2
png("C:/Users/wss/Desktop/exploratory/ExData_Plotting1/plot2.png")
plot(Global_active_power ~ AllDate, tab_all, xaxt = "n", type = "l", 
     ylab = "Global Active Power (kilowatts)")
axis.POSIXct(1, at=tab_all$AllDate, labels=format(tab_all$AllDate, "%a"))
dev.off()
