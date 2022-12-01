## Do what I need to do
## Add the omekaID for the neighborhoods and the community areas to the playground data

Chicago_Facilities_update1 <- Chicago_Facilities

# Chicago_Facilities_update2 <- Chicago_Facilities_update1 %>%
#   select(Park_Name,
#          lat,
#          long)

Chicago_Facilities_update2 <- st_as_sf(Chicago_Facilities_update1 ,
                  coords = c("long","lat"),
                  crs = 4326,
                  agr = "constant",
                  remove = FALSE)

Chicago_Facilities_update3 <- st_transform(Chicago_Facilities_update2,32616)

Chicago_Facilities_update4 <- st_join(Chicago_Facilities_update3,
                                      Chicago_Community_Areas_final ["Chicago_Community_Area_oid"])
# 
# Chicago_Facilities_update5 <- rename(Chicago_Facilities_update4,
#                                      "omeka_id_community_area" = "o:id")

Chicago_Facilities_update5 <- st_join(Chicago_Facilities_update4,
                                      Chicago_Neighborhood_final ["Chicago_Neighborhood_oid"])

# Chicago_Facilities_update7 <- rename(Chicago_Facilities_update6,
#                                      "omeka_id_neighborhood" = "o:id")

## YES! I added the community area and neighborhood into the Facilities Data Set
## get just the playgrounds

Chicago_Playgrounds <- Chicago_Facilities_update5 %>%
  filter(facility_n %in% c("Playground",
                           "Playground Park"))

## United the columns
Chicago_Playgrounds_1 <- Chicago_Playgrounds %>%
  unite(col = location_omeka_ids,
        c("Chicago_Community_Area_oid","Chicago_Neighborhood_oid"),
        sep = ";")



  

Chicago_Playgrounds_upload <- Chicago_Playgrounds_1 %>%
  ungroup()%>%
  rename("schema:identifier"      = "Chicago_Fac_id",
         "schema:addressLocality" = "location_omeka_ids",
         "schema:latitude"        = "lat",
         "schema:longitude"       = "long",
  ) %>%
  select(starts_with("schema")) %>%
  st_drop_geometry() %>%
  add_column(map_zoom = 14) %>%
write_csv("Chicago_Playgrounds_toLoad.csv")

