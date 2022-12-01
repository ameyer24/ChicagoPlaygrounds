## To make this data useful, I need to add the oids to each data set.

## Chicago Parks

Chicago_Parks_final<- Chicago_Parks %>%
  left_join(Chicago_Parks_omeka,
            by = c("Chicago_Park_id" = "Chicago_Park_id"))

# rm(Chicago_Parks,Chicago_Parks_omeka)

## Chicago Wards
Chicago_Wards_final<- Chicago_Wards %>%
  left_join(Chicago_Wards_omeka,
            by = c("Chicago_Ward_id" = "Chicago_Ward_id"))




## Neighborhoods
Chicago_Neighborhood_final <- Chicago_Neighborhood %>%
  left_join(Chicago_Neighborhood_omeka,
            by = c("Chicago_Neighborhood_id" = "Chicago_Neighborhood_id"))
## Community Areas
Chicago_Community_Areas_final <- Chicago_Community_Areas %>%
  left_join(Chicago_Community_Areas_omeka,
            by = c("Chicago_Community_Area_id" = "Chicago_Community_Area_id"))



## Add Omeka ID to the Facilities data
Chicago_Facilities_final <- Chicago_Facilities %>%
  left_join(Chicago_Playgrounds_omeka,
            by = c("Chicago_Fac_id" = "Chicago_Fac_id",
                   "Fac_Name" = "Chicago_Fac_name"))

## Need to match on two criteria because some rows have garbage ids.

## Do Chicago Facilities

Chicago_Facilities_final <- Chicago_Facilities %>%
  left_join(
    Chicago_Wards_omeka, Chicago_Ward_omekaid,
    by = c("ward" = "Chicago_Ward_ID")) %>%
  left_join(
    Chicago_Parks_omeka, CPD_Park_omekaid,
    by = c("Chicago_Park_ID" = "Chicago_Park_ID"))
