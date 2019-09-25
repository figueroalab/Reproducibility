library(tidyverse)
library(readxl)

#how to post scripts in slack

#`some text` press enter (back tick, content,backtick, enter)

#if you have a longer bit, you can multiple lines within ``` then use shift and enter gives you a new line, 
#shift enter again and close off code with ``` press enter

#final way, when you have more coed like 10-11 lines, 
#use paper click, create new, creat snippet, put code in content, remember to enter the type of code

BOM_data <- read_csv("data/BOM_data.csv")
BOM_stations <-read_csv("data/BOM_stations.csv")

BOM_data
BOM_stations

BOM_data %>% 
  separate(col = Temp_min_max, into = c("min","max"), sep = "/") %>% 
  group_by(Station_number)


