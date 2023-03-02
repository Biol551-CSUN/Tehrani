########2023_02_14 Homework Script###
### Created by: Helia Tehrani
### Created on 2023_02_14
###############################

###Load Library 
library(palmerpenguins)
library(tidyverse)
library(here)
library(praise)
library(devtools)
library(beyonce)
library(ggthemes)
library(ggplot2)
library(hrbrthemes)
library (nationalparkcolors)


#calculate the mean and variance of body mass by species, island, amd sex without any NA's
fit_penguin <- penguins %>%
  drop_na(species, island, sex) %>%
  group_by(species, island, sex) %>%
  summarise(mean_body_mass = mean(body_mass_g, na.rm = TRUE), 
            variance_body_mass = var(body_mass_g, na.rm = TRUE))
fit_females <- filter(.data = penguins, sex == "female" ) %>% #filter outmales
  mutate(log_mass = log(body_mass_g)) %>% #log body mass
  select(species, island, sex, log_mass) #select species, island, sex, and log body mass
ggplot(data=fit_females,
       aes(x = island,
           y = log_mass,
           fill = species))+
  geom_boxplot()+ #boxplot
  scale_fill_manual(values= park_palette("Yosemite")) + 
  labs(title = "Distribution of Penguin Body Mass per Island",
       x = "Island", y = "Body Mass (g)",
       fill = "Species") +
  theme_clean() + #clean theme
  theme(axis.title = element_text(size = 10), #bigger x and y axis titles
        plot.title = element_text(hjust=0.4), #adjust the plot title to the middle
        panel.background = element_rect(fill = "pink")) #change panel background
ggsave(here("Week_4","Output","fit_female_penguins.png"))

       
       