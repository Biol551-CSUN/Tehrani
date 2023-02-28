##week5b Script 
library(tidyverse)
library(here)
library(lubridate)
now() #what time is it now?
now(tzone = "EST") # what time is it on the east coast
now(tzone = "GMT") # what time in GMT
today()
today(tzone = "GMT")
am(now()) # is it morning?
leap_year(now()) # is it a leap year?
ymd("2021-02-24")
mdy("02/24/2021")
mdy("February 24 2021")
dmy("24/02/2021")
ymd_hms("2021-02-24 10:22:20 PM")
mdy_hms("02/24/2021 22:22:20")
mdy_hm("February 24 2021 10:22 PM")
# make a character string
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")
# convert to datetimes
datetimes <- mdy_hms(datetimes)
month(datetimes)
month(datetimes, label = TRUE)
month(datetimes, label = TRUE, abbr = FALSE) #Spell it out
day(datetimes) # extract day
wday(datetimes, label = TRUE) # extract day of week
hour(datetimes)
minute(datetimes)
second(datetimes)
datetimes + hours(4) # this adds 4 hours
datetimes + days(2) # this adds 2 days
round_date(datetimes, "minute") # round to nearest minute
round_date(datetimes, "5 mins") # round to nearest 5 minute
#read in the data
conData<- read_csv(here("Week_5","Data","condData.csv"))

conData<-conData%>%
mutate(Date=mdy_hm(Date))
