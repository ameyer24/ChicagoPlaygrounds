## Explore the Data

## Tidy the Park Data
## This could probably be used to create
CPD_Parks_Tidy <- CPD_Parks %>%
  gather("facility_type", "count", c(12:78))
## Remove 0s in Park Tidy Data
CPD_Parks_Tidy1 <- CPD_Parks_Tidy %>%
  filter(count > 0)
######### FACILITIES

## Summarize Fac Info and Compare to Tidied Data


## Do we have detailed information for all those facilties?
CPD_Facs1 <- Chicago_Facilities_final %>%
  group_by(Park_Name, facility_n) %>%
  count()

## Select similar information from CPD_Parks
CPD_Parks1 <- CPD_Parks_Tidy1 %>%
  select(Park_Name, facility_type, count)







# total number of playgrounds
sum(CPD_Parks$playground)

# total number of parks with playgrounds
parks_with_playgrounds <- CPD_Parks %>%
  filter(playground >=1)

## explore the data
## how many different types of facilities are there?
CPD_fac_summary <- CPD_Facs%>%
  group_by(facility_n, facility_t) %>%
  count()

## Get just the playgrounds
CPD_PGs <- filter(CPD_Combined,
                  facility_n == "Playground" | facility_n == "Playground Park")

## Spray Features Exploration
CPD_SFs <- filter(CPD_Combined, facility_n == "Spray Feature")

CPDFacsList <- CPD_Parks_Tidy 


