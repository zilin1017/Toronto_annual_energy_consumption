


#### Workspace setup ####
library(opendatatoronto)
library(dplyr)
library(readr)
library(readxl)
#### Download data ####
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/0600cad8-d024-483b-a9a8-ecfc3e32e375/resource/9353c7fe-d33d-47e9-9934-c6ca8bf04c75/download/annual-energy-consumption-data-2021.xlsx", 
              destfile = "~/Desktop/Toronto_annual_energy_consumption/data/raw_data/annual-energy-consumption-data-2021.xlsx", 
              mode = "wb")


#### Save data ####

raw_data<- read_excel("~/Desktop/Toronto_annual_energy_consumption/data/raw_data/annual-energy-consumption-data-2021.xlsx")

head(raw_data)

write_csv(raw_data, "data/raw_data/raw_data.csv")       
