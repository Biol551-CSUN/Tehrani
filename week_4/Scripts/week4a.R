### Today we are going to plot penguin data ####
### Created by:Helia Tehrani#############
### Updated on: 2022-02-15 ####################

#### Load Libraries ######
library(palmerpenguins)
library(tidyverse)
library(here)
### Load data ######
# The data is part of the package and is called penguins
glimpse(penguins)
head(penguins)
filter(.data = penguins, sex == "female" )
filter(.data = penguins, 
       sex == "female" )
filter(.data = penguins,
       sex = "females")
filter(.data = penguins, 
       sex == "females")
filter(.data == penguins, 
       sex == females)
filter(.data = penguins, 
       sex == "females")
filter(.data = penguins, sex == "female", body_mass_g >5000)
filter(.data = penguins, sex == "female", body_mass_g >5000)
filter(.data = penguins, sex == "female" & body_mass_g >5000)
filter(.data = penguins, 
       body_mass_g <5000,
       body_mass_g >3000)
       filter(.data = penguins,
              island %in% c("Dream","Biscoe")) 
       data2<-mutate(.data = penguins, 
                     body_mass_kg = body_mass_g/1000,
                     bill_length_depth = bill_length_mm/bill_depth_mm)
       # convert mass to kg 
       # calculate the ratio of bill length to depth
       data2<- mutate(.data = penguins,
                      after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))
       View(data2)
       me %>%
         wake_up(time = "6:00") %>%
         music(turn = "on", to = "Beyonce") %>%
         shower(wash_hair = TRUE) %>%
         get_dressed(pants = TRUE, shirt = TRUE) %>%
         penguins %>% # use penguin dataframe
         filter(sex == "female") %>% #select females
         mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
         select(Species = species, island, sex, log_mass)
       penguins %>% # 
         summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE))      
       penguins %>% # 
         summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
                   min_flipper = min(flipper_length_mm, na.rm=TRUE))      
       penguins %>%
         group_by(island) %>%
         summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
                   max_bill_length = max(bill_length_mm, na.rm=TRUE))      
       penguins %>%
         group_by(island, sex) %>%
         summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
                   max_bill_length = max(bill_length_mm, na.rm=TRUE))      
       penguins %>%
         drop_na(sex)      
       penguins %>%
         drop_na(sex) %>%
         group_by(island, sex) %>%
         summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))      
       penguins %>%
         drop_na(sex) %>%
         ggplot(aes(x = sex, y = flipper_length_mm)) +
         geom_boxplot()       
       library(devtools) # load the development tools library
       devtools::install_github("jhollist/dadjoke")     