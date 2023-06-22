## Import data from City of Chicago Data Portal
################################################################################
## Import Rectangular Data
################################################################################

## Load Chicago Park Information
Chicago_Parks_raw <- read.socrata("https://data.cityofchicago.org/resource/ejsh-fztr.csv")

## Load Chicago Park Facilities Information
Chicago_Facilities_raw <- read.socrata("https://data.cityofchicago.org/resource/eix4-gf83.csv")

## Load Chicago Ward Information (this data set is out of date as of 2023-05)
Chicago_Wards_raw <- read.socrata("https://data.cityofchicago.org/resource/htai-wnw4.csv")

################################################################################
## Import GIS Data from the City of Chicago Data Portal
################################################################################
## Using the read feature from the sf package 
Chicago_Ward_Boundaries_geo <- read_sf("https://data.cityofchicago.org/resource/p293-wvbd.geojson")
Chicago_Ward_Boundaries_raw <- st_transform(Chicago_Ward_Boundaries_geo,32616)

## Load Chicago Community Areas data from Chicago Data Portal
Chicago_Community_Areas_geo <- read_sf("https://data.cityofchicago.org/resource/igwz-8jzy.geojson")
Chicago_Community_Areas_raw <- st_transform(Chicago_Community_Areas_geo,32616)

## Load Chicago Neighborhood data from Chicago Data Portal
Chicago_Neighborhood_geo <- read_sf("https://data.cityofchicago.org/resource/y6yq-dbs2.geojson")
Chicago_Neighborhood_raw <- st_transform(Chicago_Neighborhood_geo,32616)

################################################################################
## Clean Up Trash
################################################################################

rm(Chicago_Ward_Boundaries_geo,
   Chicago_Neighborhood_geo,
   Chicago_Community_Areas_geo)
