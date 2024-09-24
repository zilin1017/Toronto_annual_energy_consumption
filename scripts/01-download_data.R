#### Preamble ####
# Purpose: Downloads and saves the data from  opendatatoronto
# Author: Irene Liu
# Date: 24 September 2024
# Contact: liuzilin.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(opendatatoronto)
library(dplyr)
library(readr)
library(readxl)
#### Download data ####
consumption-data <- download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/0600cad8-d024-483b-a9a8-ecfc3e32e375/resource/9353c7fe-d33d-47e9-9934-c6ca8bf04c75/download/annual-energy-consumption-data-2021.xlsx", 
              destfile = "~/Desktop/Toronto_annual_energy_consumption/data/raw_data/annual-energy-consumption-data-2021.xlsx", 
              mode = "wb")


#### Save data ####

consumption_data <- read_excel("~/Desktop/Toronto_annual_energy_consumption/data/raw_data/annual-energy-consumption-data-2021.xlsx")

head(consumption_data)

         
