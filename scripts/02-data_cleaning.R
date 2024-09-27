#### Preamble ####
# Purpose: Cleans the raw data recorded by two into an analysis data
# Author: Irene Liu
# Date: 26 September 2024
# Contact: liuzilin.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv", skip=5)

cleaned_data <-
  raw_data |>
  dplyr::select(c(`Portfolio Manager Property ID`, `Property GFA - Self-Reported (m²)`, `Electricity Use - Grid Purchase (kWh)`),`Primary Property Type - Self Selected`) |>
  dplyr::mutate(ID = `Portfolio Manager Property ID`,
                Area = `Property GFA - Self-Reported (m²)`,
                kWh = `Electricity Use - Grid Purchase (kWh)`,
                Property_Type = `Primary Property Type - Self Selected` )|>
  dplyr::mutate(kWh = as.numeric(kWh)) |>
  dplyr::filter(Area < 2500 & Area > 30) |>
  dplyr::mutate(log_Area = log(Area))

#### Save data ####
write.csv(cleaned_data, "data/analysis_data/analysis_data.csv")


