## Determine Community Area and Neighborhood for each Park
## Determine Community Area and Neighborhood for each Facility.


## Load Community Areas data from Chicago Data Portal
Chicago_Community_Areas_rawgeo <- read_sf("https://data.cityofchicago.org/resource/igwz-8jzy.geojson")
# class(Chicago_Community_Areas_rawgeo)
# plot(Chicago_Community_Areas_rawgeo)
# st_crs(Chicago_Community_Areas_rawgeo)
Chicago_Community_Areas_geo <- st_transform(Chicago_Community_Areas_rawgeo,32616)

## Look at Chicago Park Facilities Information
Chicago_Facilities_final_geo <- Chicago_Facilities_final

CFFg1 <- Chicago_Facilities_final_geo %>%
  select(Park_Name,
         lat,
         long)

CFFg2 <- st_as_sf(CFFg1,
                  coords = c("long","lat"),
                  crs = 4326,
                  agr = "constant")
CFFg3 <- st_transform(CFFg2,32616)
CFFg4 <- st_join(CFFg3, Chicago_Community_Areas_geo ["community"])
## YES! I added the community area into the Facilities Data Set
## Let's look at the Park level information now.

CFFg5 <- CFFg4 %>%
  filter (community is.na)
