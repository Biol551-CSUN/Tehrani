##Week_7b Lecture scripts
##creat by:Helia Tehrani
##Date:03/09/2023
####################

#Laod Libraries:
library(ggmap)
library(tidyverse)
library(here)
library(ggsn)
ChemData<-read_csv(here("week_7","Data","chemicaldata_maunalua.csv"))
glimpse(ChemData)
#Location as a string:
  
Oahu<-get_map("Oahu")
ggmap(Oahu)
#Make a data frame of lon and lat coordinates
WP<-data.frame(lon = -157.7621, lat = 21.27427) # coordinates for Wailupe
# Get base layer
Map1<-get_map(WP)
# plot it
ggmap(Map1)
Map1<-get_map(WP,zoom = 17)
ggmap(Map1)
#Change the map type

Map1<-get_map(WP,zoom = 17, maptype = "satellite")
ggmap(Map1)
Map1<-get_map(WP,zoom = 17, maptype = "watercolor")
ggmap(Map1)
Map1<-get_map(WP,zoom = 17, maptype = "satellite") 
ggmap(Map1)+
  geom_point(data = ChemData,
             aes(x = Long, y = Lat, color = Salinity),
             size = 4) +
  scale_color_viridis_c()
geocode("the white house")
## # A tibble: 1 x 2
##     lon   lat
##   <dbl> <dbl>
## 1 -77.0  38.9
geocode("California State University, Northridge")
## # A tibble: 1 x 2
##     lon   lat
##   <dbl> <dbl>
## 1 -119.  34.2
library(emojifont)
search_emoji('smile')
ggplot() + 
  geom_emoji('smile_cat', 
             x=1:5, y=1:5, 
             size=10)
