## Divide Data - get only certain types of facilities
## Get Playgrounds
Chicago_Playgrounds <- Chicago_Facilities_joined %>%
  filter(facility_n %in% c("Playground",
                           "Playground Park"))

Chicago_Water <- Chicago_Facilities_joined %>%
  filter(facility_n %in% c("Spray Feature",
                           "Water Playground",
                           "Beach",
                           "Pool (Outdoor)",
                           "Pool (Indoor)",
                           "Water Slide"))

Chicago_Other_Facilties <- Chicago_Facilities_joined %>%
  filter(!facility_n %in% c("Playground",
                            "Playground Park",
                            "Spray Feature",
                            "Water Playground",
                            "Beach","Pool (Outdoor)",
                            "Pool (Indoor)",
                            "Water Slide"))
