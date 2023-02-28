##week_5b Script /Lab
##creat By: Helia Tehrani
##creat on :2023_02_23
# updated on 2023_02_28
##################

##Load libraries
library(tidyverse)
library(here)
library(lubridate)
library(CatterPlots)
library(devtools)
library(ggplot2)
library(beyonce)
library(hrbrthemes)
#Data Wrangling
conData<- read_csv(here("week_5","Data","condData.csv")) %>%
 mutate(date= mdy_hms(date), #mutate to see time in year,month, date ,hours 
        date=round_date(date,"10 second")) #I round to the nearest 10 second
View(conData)

DepthData<-read_csv(here("week_5","Data" , "DepthData.csv" ))#read depth data
view(DepthData)

full_data<- inner_join(conData,DepthData)  #complete joine 
  full_data <- inner_join(conData,DepthData) %>% # complete join without na's
  mutate(date = round_date(date, "minute")) %>% #rounding time to min
  group_by(date) %>% #group time by date
  summarise(avg_temp = mean(Temperature), #summarize function to get mean of all variables
            avg_salinity = mean(Salinity),
            avg_depth = mean(Depth))
#I recieve error in inner_join(ConData, DepthData) : object 'ConData' not found
View(full_data)

          
view(full_data)
ggplot(full_data,
       aes(x = date))+
  geom_line(aes(y = avg_temp,
                color = "Teperature"))+
  geom_line(aes(y = avg_salinity,
                color= "Salinity"))+
  labs(x = "Date",
       y = "",
       title = "Average Temperature and Salinity Over Time",
       color = "Variables")+
  scale_color_manual(values = c("pink", "green"))+
theme_classic()
#my favorite theme is classic.
#my graph look like is kind of wierd.(lol)

