## Determine if there is a spray feature near a playground.
## If there is, add that to the playground item in Omeka.


Chicago_Fac_geo <- st_as_sf(Chicago_Facilities ,
                            coords = c("long","lat"),
                            crs = 4326,
                            agr = "constant",
                            remove = FALSE)



AJM <- st_distance(Chicago_Fac_geo)















Chicago_Playgrounds <- Chicago_Fac_geo %>%
  filter(facility_n %in% c("Playground",
                           "Playground Park"))

Chicago_Water <- Chicago_Fac_geo %>%
  filter(facility_n %in% c("Spray Feature",
                           "Water Playground",
                           "Beach",
                           "Pool (Outdoor)",
                           "Pool (Indoor)",
                           "Water Slide"))




Chicago_Spray <- Chicago_Facilities %>%
  filter(facility_n %in% c("Spray Feature")) %>%
  select(c("park_no","facility_n"))


## Start easy; do only the parks with 1 playground.
Chicago_Playgrounds_A1 <- Chicago_Playgrounds %>%
  group_by(park_no) %>%
  filter(n() ==1)

## Do a left join.
## Match on park_no
## 
Chicago_Playgrounds_A2 <- Chicago_Playgrounds_A1 %>%
  left_join(Chicago_Spray,
            by = "park_no")








## Worry about these later
Chicago_Playgrounds_B1 <- Chicago_Playgrounds %>%
  group_by(park_no) %>%
  filter(n() >1)
