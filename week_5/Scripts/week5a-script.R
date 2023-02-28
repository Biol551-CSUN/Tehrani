library(tidyverse)
library(here)
EnviroData<-read_csv(here("Week_5","Data", "site.characteristics.data.csv"))
TPCData<-read_csv(here("Week_5","Data","Topt_data.csv"))
glimpse(EnviroData)
glimpse(TPCData)
EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured,
              values_from = values)
View(EnviroData_wide)
EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured, # pivot the data wider
              values_from = values) %>%
  arrange(site.letter) # arrange the dataframe by site
View(EnviroData_wide)
FullData_left<- left_join(TPCData, EnviroData_wide)
head(FullData_left)
FullData_left<- left_join(TPCData, EnviroData_wide) %>%
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character data
head(FullData_left)
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T1
T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2
left_join(T1, T2)
right_join(T1, T2)
inner_join(T1, T2)
full_join(T1, T2)
semi_join(T1, T2)
anti_join(T1, T2)
library(cowsay)
say("hello", by = "shark")
say("I want pets", by = "cat")
