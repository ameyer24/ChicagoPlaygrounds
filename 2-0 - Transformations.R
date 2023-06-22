## Transform the Chicago Park Data
################################################################################
## Create Names for all the Parks
### If the park is named "Park ###" that's a good title, if not add " Park" to the end.
### Spell out abbreviations.
## Add Address
## Create unique identifiers

Chicago_Parks <- Chicago_Parks_raw %>%
  mutate(Park_Name = if_else(
    str_detect(label, "Park "),
    label,
    str_c(label, " Park"))) %>%
  mutate(Park_Name = str_replace(Park_Name, " Sq ", " Square ")) %>%
  mutate(Park_Name = str_replace(Park_Name, " Mem'l ", " Memorial ")) %>%
  mutate(Park_Name = str_replace(Park_Name, " CC ", " Community Center ")) %>%
  mutate(location = str_to_title(location)) %>%
  mutate(Park_Address = str_c(location, " Chicago, IL ", zip)) %>%
  mutate(Chicago_Ward_id = str_c("Chicago_Ward_", ward)) %>%
  mutate(Chicago_Park_id = str_c("Chicago_Park_", park_no))

## Transform Facilities Information
################################################################################
## Adding the Park Name, Park Address, and Ward into CPD_Facs DF.
Chicago_Facilities <- Chicago_Facilities_raw %>%
  inner_join(select(Chicago_Parks, Park_Name, Park_Address, park_no, ward), by = "park_no") %>%
  mutate(facility_n = str_to_title(facility_n)) %>%
  group_by(Park_Name,facility_n) %>%
  arrange(park, facility_n) %>%
  mutate(id = row_number()) %>%
  mutate(max_id = max(id)) %>%
  mutate(Fac_Name = if_else(
    max_id == 1,
    str_c(Park_Name, "-", facility_n, sep = " "),
    str_c(Park_Name, "-", facility_n, id, sep = " "))) %>%
  mutate(Chicago_Fac_id = str_c("Chicago_Park_Facility_", objectid_1)) %>%
  mutate(the_geom = str_sub(the_geom, 8, nchar(the_geom)-1)) %>%
  separate(the_geom, c("long","lat"), sep=" ") %>%
  select(-x_coord, -y_coord) %>%
  mutate(Chicago_Park_id = str_c("Chicago_Park_", park_no))

###############################################################################
# Chicago_Facilities_1 <- Chicago_Facilities_raw %>%
#   inner_join(select(Chicago_Parks, Park_Name, Park_Address, park_no, ward), by = "park_no") %>%
#   mutate(facility_n = str_to_title(facility_n))
# 
# ## Create Unique Names for each Facility
# Chicago_Facilities_2 <- Chicago_Facilities_1 %>%
#   group_by(Park_Name,facility_n) %>%
#   arrange(park, facility_n) %>%
#   mutate(id = row_number()) %>%
#   mutate(max_id = max(id)) %>%
#   mutate(Fac_Name = if_else(
#     max_id == 1,
#     str_c(Park_Name, "-", facility_n, sep = " "),
#     str_c(Park_Name, "-", facility_n, id, sep = " "))) %>%
#   select(-id, -max_id)
# ## Create Unique IDs for each facility
# Chicago_Facilities_3 <- Chicago_Facilities_2 %>%
#   mutate(Fac_ID = str_c("Chicago_Park_Facility_", objectid))
# ## Get the best lat and long data
# Chicago_Facilities_4 <- Chicago_Facilities_3 %>%
#   mutate(the_geom = str_sub(the_geom, 8, nchar(the_geom)-1)) %>%
#   separate(the_geom, c("long","lat"), sep=" ") %>%
#   select(-x_coord, -y_coord)
# ## Update the ID for Chicago Wards and Chicago Parks
# Chicago_Facilities_5 <- Chicago_Facilities_4 %>%
#   mutate(Chicago_Park_id = str_c("Chicago_Park_", park_no))
# ## Rename because the transformations are done
# Chicago_Facilities <- Chicago_Facilities_5
# rm(Chicago_Facilities_1,
#    Chicago_Facilities_2,
#    Chicago_Facilities_3,
#    Chicago_Facilities_4,
#    Chicago_Facilities_5)

## Ward Transformations
################################################################################
Chicago_Wards <- Chicago_Wards_raw %>% 
  mutate(Ward_Name = str_c("Ward ", ward)) %>%
  mutate(Chicago_Ward_id = str_c("Chicago_Ward_", ward)) %>%
  mutate(Ward_Address = str_c(address, " Chicago, IL ", zipcode))

## Community Area Transformations
################################################################################
Chicago_Community_Areas <- Chicago_Community_Areas_raw %>% 
  mutate(community = str_to_title(community)) %>%
  mutate(Chicago_Community_Area_id = str_pad(area_numbe, 2, side="left", pad="0")) %>%
  mutate(community = str_c(community, " (Community Area)"))
  


## Neighborhood Transformations
################################################################################
Chicago_Neighborhood <- Chicago_Neighborhood_raw %>%
  select(-c(sec_neigh)) %>%
  mutate(Chicago_Neighborhood_id = row_number()) %>%
  mutate(Chicago_Neighborhood_id = str_pad(Chicago_Neighborhood_id, 2, side="left", pad="0")) %>%
  mutate(pri_neigh = str_c(pri_neigh, " (Neighborhood)"))



## We can get rid of the raw data now
rm(Chicago_Facilities_raw,
   Chicago_Parks_raw,
   Chicago_Wards_raw,
   Chicago_Community_Areas_raw,
   Chicago_Neighborhood_raw)
  
