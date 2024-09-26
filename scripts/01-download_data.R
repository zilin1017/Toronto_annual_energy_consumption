


#### Workspace setup ####
library(opendatatoronto)
library(dplyr)

#### Download data ####

# get package
package <- show_package("0600cad8-d024-483b-a9a8-ecfc3e32e375")
package

# get all resources for this package
resources <- list_package_resources("0600cad8-d024-483b-a9a8-ecfc3e32e375")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

#### Save data ####

resource_id <- "9353c7fe-d33d-47e9-9934-c6ca8bf04c75"

# Download the data
raw_data <- get_resource(resource_id)

# Save it as a CSV (if needed)
write_csv(raw_data, "data/raw_data/raw_data.csv")

# View the data

head(raw_data)

