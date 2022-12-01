## Import data from Omeka site
################################################################################
## In order to link the data I need the IDs from Omeka S
## First, export the data from the Omeka S site as CSV
## Add to the "From_OmekaS folder" with proper names
## Then I need to load that data into R to get the ids

## Just load the data we need.
Chicago_Parks_omeka_raw <- read_csv("From_OmekaS/parks_export.csv",
                                    col_select = c(4,18))
## rename the columns
Chicago_Parks_omeka <- Chicago_Parks_omeka_raw %>%
  rename("Chicago_Park_oid"    = 1) %>%
  rename("Chicago_Park_id"     = 2)

Chicago_Playgrounds_omeka_raw <- read_csv("From_OmekaS/playgrounds_export.csv",
                                          col_select = c(4,10,18))

Chicago_Playgrounds_omeka <- Chicago_Playgrounds_omeka_raw %>%
  rename("Chicago_Fac_oid"  = 1) %>%
  rename("Chicago_Fac_name" = 2) %>%
  rename("Chicago_Fac_id"   = 3)

## Get the Omeka IDs for the Wards
Chicago_Wards_omeka_raw <- read_csv("From_OmekaS/wards_export.csv",
                                    col_select = c(4,22))

## I just need the "o:id" column and the "schema:name" and "schema:identifier"
Chicago_Wards_omeka <- Chicago_Wards_omeka_raw %>%
  rename("Chicago_Ward_oid" = 1) %>%
  rename("Chicago_Ward_id"  = 2)

## Get the Omeka IDs for the Community Areas
Chicago_Community_Areas_omeka_raw <- read_csv("From_OmekaS/community_areas_export.csv",
                                              col_select = c(4,18))

## I just need the "o:id" column and the "schema:name" and "schema:identifier"
Chicago_Community_Areas_omeka <- Chicago_Community_Areas_omeka_raw %>%
  rename("Chicago_Community_Area_oid" = 1) %>%
  rename("Chicago_Community_Area_id"  = 2)

## Get the Omeka IDs for the Neighborhoods
Chicago_Neighborhood_omeka_raw <- read_csv("From_OmekaS/neighborhoods_export.csv",
                                           col_select = c(4,18))
## I just need the "o:id" column and the "schema:name" and "schema:identifier"
Chicago_Neighborhood_omeka <- Chicago_Neighborhood_omeka_raw %>%
  rename("Chicago_Neighborhood_oid" = 1) %>%
  rename("Chicago_Neighborhood_id"  = 2)



## We don't need to keep the raw data anymore.
rm(Chicago_Parks_omeka_raw,
   Chicago_Playgrounds_omeka_raw,
   Chicago_Wards_omeka_raw,
   Chicago_Community_Areas_omeka_raw,
   Chicago_Neighborhood_omeka_raw)
