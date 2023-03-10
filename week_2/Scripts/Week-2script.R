### This is my first script. I am learning how to import data
### Created by: Helia Tehrani manesh
### Created on : 2023-02-02
###########################

### Load libraries ########## 
library(tidyverse)
library(here)
### Read in data ###
WeightData<-read_csv(here("week_2","data","weightdata.csv"))
### Data Analysis #####
head(WeightData) # Looks at the top 6 lines of the dataframe
tail(WeightData) # Looks at the bottom 6 lines of the dataframe
View(WeightData) # opens a new window to look at the entire dataframe
