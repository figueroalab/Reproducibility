library(tidyverse)
library(readxl)

#after downloading data(w/o opening file in excel)

BOM_data <- read_csv("data/BOM_data.csv")
BOM_stations <-read_csv("data/BOM_stations.csv")

#view files

BOM_data
BOM_stations

#question 1: For each station, how many days have 
#a minimum temperature, 
#a maximum temperature 
#and a rainfall measurement recorded?

BOM_data %>% 
  separate(col = Temp_min_max, into = c("min","max"), sep = "/") %>% 
  group_by(Station_number) %>%  
  filter(min != "-" & max != "-" & Rainfall!= "-") %>% 
  summarise(Days = n())


BOM_data %>% 
  separate(col = Temp_min_max, into = c("min","max"), sep = "/") %>% 
  filter(min != "-" & max != "-" & Rainfall!= "-") %>% 
  write_csv("BOM_split_data.csv")

BOM_split_data <-read_csv("BOM_split_data.csv")

#question 2 Which month saw the lowest average daily temperature difference?

BOM_split_data %>% 
  mutate(diff = max-min) %>% #calculate the difference in temp per
  group_by(Month) %>% 
  mutate(avr = mean(diff)) %>%
  arrange(desc(avr)) %>% 
  tail(n=10)

#june?

            
#question 3 Which state saw the lowest average daily temperature difference?

BOM_split_data %>% 
  mutate(diff = max-min) %>% #calculate the difference in temp per
  mutate(avr = mean(diff)) %>% 
  write_csv("BOM_diff_temp.csv")

BOM_diff_temp <-read_csv("BOM_diff_temp.csv") # I will use this file to join by Station_number

#tidy dataframe
BOM_stations %>% 
  gather(Station_number, info, )


