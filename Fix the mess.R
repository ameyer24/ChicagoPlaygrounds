## Just try to fix this mess

Chicago_Playgrounds_mess <- read_csv("omeka_export.csv")

## Just get the rows I need to add back.
# lat
# long
# subject
# amenities

Chicago_Playground_mess1 <- Chicago_Playgrounds_mess %>%
  select(c("schema:amenityFeature",
           "schema:description",
           "dcterms:subject",
           "schema:name...17",
           "schema:identifier...18",
           "schema:latitude...22",
           "schema:longitude...23",
           "schema:alternateName",
           "schema:address...20",
           "schema:containedInPlace...19")) %>%
  add_column(map_zoom = 14)
## Not terrible but not great either...

## Delete those URLS
# http://chicagoplaygrounds.com/api/items/3192
# http://chicagoplaygrounds.com/api/items/
# Get just the number
Chicago_Playground_mess2 <- Chicago_Playground_mess1 %>%
  mutate_at("schema:amenityFeature",
            str_replace_all,
            "http://chicagoplaygrounds.com/api/items/", "") %>%
  mutate_at("schema:amenityFeature",
            str_replace_all,
            "http://chicagoplaygrounds.com/api/item_sets/", "") %>%
  mutate_at("dcterms:subject",
            str_replace_all,
            "http://chicagoplaygrounds.com/api/items/", "") %>%
  mutate_at("schema:containedInPlace...19",
            str_replace_all,
            "http://chicagoplaygrounds.com/api/items/", "")

## Let's even fix some problems
## rethinking the location stuff...
## That data isn't in this dataset so I'll need to add it.

Chicago_Facilities_update2 <- st_as_sf(Chicago_Playground_mess2 ,
                                       coords = c("schema:longitude...23",
                                                  "schema:latitude...22"),
                                       crs = 4326,
                                       agr = "constant",
                                       remove = FALSE)

Chicago_Facilities_update3 <- st_transform(Chicago_Facilities_update2,32616)

Chicago_Facilities_update4 <- st_join(Chicago_Facilities_update3,
                                      Chicago_Community_Areas_final ["Chicago_Community_Area_oid"])


Chicago_Facilities_update5 <- st_join(Chicago_Facilities_update4,
                                      Chicago_Neighborhood_final ["Chicago_Neighborhood_oid"])

## Great.
## Combine

Chicago_Facilities_update6 <- Chicago_Facilities_update5 %>%
  unite("schema:geoWithin",
        Chicago_Community_Area_oid:Chicago_Neighborhood_oid,
        sep = ";") %>%
  add_column("dcterms:isPartOf" = "")


## export this
Chicago_Playgrounds_upload <- Chicago_Facilities_update6 %>%
  write_csv("Chicago_Playgrounds_mess_toLoad.csv",
            na="")
