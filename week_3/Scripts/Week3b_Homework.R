##This code will run a penguin data.
##
##created by :Helia Tehrai
##created on :2/21/2023
####################################

##libraries--------------------
library(palmerpenguins)
library(tidyverse)
library(here)

###################################
##load data.
penguins %>%
  count(species) %>%
  ggplot() + geom_col(aes(x = species, y = n, fill = species)) +
  geom_label(aes(x = species, y = n, label = n)) +
  scale_fill_manual(values = c("pink","blue","orange")) +
  theme_classic() +
labs(title = 'Penguins species & count')

ggsave(here("week_3","Outputs","Penguins_homework.png"))

