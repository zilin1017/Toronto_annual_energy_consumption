#### Preamble ####
# Purpose: Downloads and saves the data from  opendatatoronto
# Author: Irene Liu
# Date: 26 September 2024
# Contact: liuzilin.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
# Simulate data
set.seed(30)

# Define the number of random entries you want to generate
number_of_entries <- 1000

# Define constraints for your data (adjust based on your needs)
min_area <- 30
max_area <- 2500
min_kWh <- 100
max_kWh <- 22000000

# Simulate random data for 'dates', 'Area', 'kWh', and 'Property_Type'
simulated_data <- tibble(
  ID = seq(1, number_of_entries),  # Simulated IDs
  Area = runif(n = number_of_entries, min = min_area, max = max_area),  # Random areas
  kWh = runif(n = number_of_entries, min = min_kWh, max = max_kWh),  # Random electricity usage
  Property_Type = sample(c("Library", "Office", "Fire Station", "Heated Swimming Pool", "Other"), 
                         size = number_of_entries, replace = TRUE)  # Random property types
)

# Apply any additional transformations (e.g., filtering)
simulated_data <- simulated_data %>%
  filter(Area < 2500 & Area > 30) %>%
  mutate(log_Area = log(Area))

# View the first few rows of the simulated dataset
head(simulated_data)

# Write the simulated data to a CSV file
write_csv(simulated_data, "data/raw_data/simulated_data.csv")




