#### Preamble ####
# Purpose: Downloads and saves the data from  opendatatoronto
# Author: Irene Liu
# Date: 24 September 2024
# Contact: liuzilin.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
my_data <- readxl::read_excel("data/raw_data/annual-energy-consumption-data-2021.xlsx", skip = 5)
my_data <- my_data|>
  dplyr::select(c(`Portfolio Manager Property ID`, `Property GFA - Self-Reported (m²)`, `Electricity Use - Grid Purchase (kWh)`)) |>
  dplyr::mutate(ID = `Portfolio Manager Property ID`,
                Area = `Property GFA - Self-Reported (m²)`,
                kWh = `Electricity Use - Grid Purchase (kWh)`) |>
  dplyr::mutate(kWh = as.numeric(kWh)) |>
  dplyr::filter(Area < 2500 & Area > 30) |>
  dplyr::mutate(log_Area = log(Area))

write.csv(my_data, "data/analysis_data/analysis_data.csv")



