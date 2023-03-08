##Intro map markdown Scripts
##Create by :Helia Tehrani
##Date :03/07/2023
###################

#Load Libraries 
library(tidyverse)
library(here)
library(maps)
library(mapdata)
library(mapproj)
library(ggplot2)


##Today's data
# Read in data on population in California by county
popdata<-read_csv(here("week_7","Data","CAPopdata.csv"))
#read in data on number of seastars at different field sites
stars<-read_csv(here("week_7","Data","stars.csv"))

#Data from entire World
world<-map_data("world")
head(world)

# get data for the USA
usa<-map_data("usa")
head(usa)
# get data for italy
italy<-map_data("italy")
head(italy)
# get data for states
states<-map_data("state")
head(states)
# get data for counties
counties<-map_data("county")
head(counties)
ggplot()+
  geom_polygon(data = world, aes(x = long, y = lat, group = group))
ggplot()+
  geom_polygon(data = world, aes(x = long, y = lat))
ggplot()+
  geom_polygon(data = world, 
               aes(x = long, y = lat, group = group),
               color = "black")
ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat, 
                   group = group, 
                   fill = region),
               color = "black") +
  guides(fill = FALSE)
ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat,
                   group = group,
                   fill = region),
               color = "black")+
  guides(fill = FALSE)+
  theme_minimal()
ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = region),
               color = "black")+
  theme_minimal()+
  guides(fill = FALSE)+
  theme(panel.background = element_rect(fill = "lightblue"))
ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = region),
               color = "black")+
  theme_minimal()+
  guides(fill = FALSE)+
  theme(panel.background = element_rect(fill = "lightblue"))+
  coord_map(projection = "mercator",
            xlim = c(-180,180))
ggplot()+
  geom_polygon(data = world, 
               aes(x = long,
                   y = lat,
                   group = group, 
                   fill = region),
               color = "black")+
  theme_minimal()+
  guides(fill = FALSE)+
  theme(panel.background = element_rect(fill = "lightblue"))+
  coord_map(projection = "sinusoidal",
            xlim = c(-180,180))
# Use the states dataset
head(states)
#Use the states dataset
CA_data<-states %>%
  filter(region == "california")
ggplot()+
  geom_polygon(data = CA_data, 
               aes(x = long, 
                   y = lat, 
                   group = group), 
               color = "Orange")+
  coord_map()+
  theme_void()
# Look at the county data
head(counties)[1:3,] # only showing the first 3 rows for space
# Look at the county data
head(popdata)
CApop_county<-popdata %>%
  select("subregion" = County, Population)  %>% # rename the county col
  inner_join(counties) %>%
  filter(region == "california") # some counties have same names in other states
head(CApop_county)
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),
               color = "black")+
  coord_map()+
  theme_void()
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),  
               color = "black")+
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")
head(stars)
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),  
               color = "black")+
  geom_point(data = stars, # add a point at all my sites
             aes(x = long,
                 y = lat))+
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")
#Make points proportional to number of stars.
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),  
               color = "black")+
  geom_point(data = stars, # add a point at all my sites 
             aes(x = long, 
                 y = lat,
                 size = star_no))+
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")
#Make a better legend label.
ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),  
               color = "black")+
  geom_point(data = stars, # add a point at all my sites 
             aes(x = long, 
                 y = lat,
                 size = star_no))+ 
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")+
  labs(size = "# stars/m2")
ggsave(here("week_7","Output","CApop.pdf"))
