## Prepare Chicago Ward Data for Upload
Chicago_Wards_upload <- Chicago_Wards_final %>%
  rename("schema:name"            = "Ward_Name",
         "schema:identifier"      = "Ward_ID",
         "schema:address"         = "Ward_Address",
         "schema:telephone"       = "ward_phone",
         "schema:givenName"       = "alderman",
         "schema:email"           = "email",
         "schema:url"             = "website") %>%
  select(starts_with("schema")) %>%
  write_csv("Chicago_Wards_toLoad.csv")
## DO THIS AGAIN.

Chicago_Community_Areas_upload <- Chicago_Community_Areas1 %>%
  rename("schema:name"            = "community",
         "schema:identifier"      = "Chicago_Community_Area_id") %>%
  select(starts_with("schema")) %>%
  write_csv("Chicago_Community_Areas_toLoad.csv")

Chicago_Neighborhood_upload <- Chicago_Neighborhood %>%
  rename("schema:name"            = "pri_neigh",
         "schema:identifier"      = "Chicago_Neighborhood_id") %>%
  select(starts_with("schema")) %>%
  write_csv("Chicago_Neighborhoods_toLoad.csv")


## Prepare Chicago Park Data for Upload
Chicago_Parks_upload <- Chicago_Parks_final %>%
  rename("schema:name"            = "Park_Name",
         "schema:identifier"      = "Park_ID",
         "schema:address"         = "Park_Address",
         "schema:materialExtent"  = "acres",
         "schema:addressLocality" = "Chicago_Ward_omekaid",
         ) %>%
  select(starts_with("schema")) %>%
  write_csv("Chicago_Parks_toLoad.csv")

## Prepare Chicago Playground Data for Upload
Chicago_Playgrounds_upload <- Chicago_Playgrounds %>%
  ungroup()%>%
  rename("schema:name"            = "Fac_Name",
         "schema:identifier"      = "Fac_ID",
         "schema:containedInPlace"= "CPD_Parks_omekaid",
         "schema:address"         = "Park_Address",
         "schema:addressLocality" = "Chicago_Ward_omekaid",
         "schema:latitude"        = "lat",
         "schema:longitude"       = "long",
  ) %>%
  select(starts_with("schema")) %>%
  write_csv("Chicago_Playgrounds_toLoad.csv")


## Prepare ALL Chicago Water Facilities Data for Upload
Chicago_Water_upload <- Chicago_Water %>%
  ungroup()%>%
  rename("schema:name"            = "Fac_Name",
         "schema:identifier"      = "Fac_ID",
         "schema:containedInPlace"= "CPD_Parks_omekaid",
         "schema:address"         = "Park_Address",
         "schema:addressLocality" = "Chicago_Ward_omekaid",
         "schema:latitude"        = "lat",
         "schema:longitude"       = "long",
  ) %>%
  select(starts_with("schema")) %>%
  write_csv("Chicago_Water_toLoad.csv")

## Prepare ALL Chicago  Facilities Data for Upload
Chicago_Other_Facilties_upload <- Chicago_Other_Facilties %>%
  ungroup()%>%
  rename("schema:name"            = "Fac_Name",
         "schema:identifier"      = "Fac_ID",
         "schema:containedInPlace"= "CPD_Parks_omekaid",
         "schema:address"         = "Park_Address",
         "schema:addressLocality" = "Chicago_Ward_omekaid",
         "schema:latitude"        = "lat",
         "schema:longitude"       = "long",
  ) %>%
  select(starts_with("schema")) %>%
  write_csv("Chicago_Other_Facilities_toLoad.csv")

