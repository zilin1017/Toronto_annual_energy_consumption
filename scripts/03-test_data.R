#### Preamble ####
# Purpose: Downloads and saves the data from  opendatatoronto
# Author: Irene Liu
# Date: 26 September 2024
# Contact: liuzilin.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run the files "01-download_data.R" and "02-data_cleaning.R"


#### Workspace setup ####
#install.packages("testthat")
library(tidyverse)
library(dplyr)
library(readr)

#### Test data ####
simulated_data <- read_csv(here::here("data/raw_data/simulated_data.csv"))

data <- simulated_data

# Write the tests
all(!is.na(data$ID))

all(!is.na(data$Area))

all(!is.na(data$kWh))

all(!is.na(data$Property_Type))

all(!is.na(data$log_Area))

#Area values are between 30 and 2500
all(data$Area>= 30 & data$Area <= 2500)

#kWh values are between 1 and 21972259
all(data$kWh >= 1 & data$kWh <= 22000000)

#log_Area values are between 3 and 8
all(data$log_Area >= 3 & data$log_Area <= 8)