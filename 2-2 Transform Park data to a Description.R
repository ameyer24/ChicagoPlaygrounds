## Write descriptions for all the Chicago Parks from the data
## Actually, let's look at the facility information.
## Mostly because the names are better.

Chicago_Facilties_summary <- Chicago_Facilities_final %>%
  group_by(Park_Name,Chicago_Park_ID, facility_n) %>%
  count()

## Smash two dataframes together

Chicago_Park_Description1 <- 


## First, rename a bunch of columns so they are better



## This wasn't a great idea

# rename(Chicago_Parks_final,
#        ="wheelchr_a",
#       "Archery Range" ="archery_ra",
#        ="artificial",
#        ="band_shell",
#        ="baseball_b",
#        ="basketball",
#        ="basketba_1",
#        ="beach",
#        ="boat_launc",
#        ="boat_lau_1",
#        ="boat_slips",
#        ="bocce_cour",
#        ="bowling_gr",
#        ="casting_pi",
#        ="football_s",
#        ="community_",
#        ="community",
#        ="conservato",
#        ="cultural_c",
#        ="dog_friend",
#        ="fitness_ce",
#        ="fitness_co",
#        ="gallery",
#        ="garden",
#        ="golf_cours",
#        ="golf_drivi",
#        ="golf_putti",
#        ="gymnasium",
#        ="gymnastic_",
#        ="gymnastic",
#        ="handball_r",
#        ="horseshoe_",
#        ="horseshoe",
#        ="iceskating",
#        ="pool_indoo",
#        ="baseball_j",
#        ="mountain_b",
#        ="nature_cen",
#        ="pool_outdo",
#        ="zoo",
#        ="playground",
#        ="playgrou_1",
#        ="rowing_clu",
#        ="volleyball",
#        ="senior_cen",
#        ="shuffleboa",
#        ="skate_park",
#        ="sled_hill",
#        ="sport_roll",
#        ="spray_feat",
#        ="baseball_s",
#        ="tennis_cou",
#        ="track",
#        ="volleyba_1",
#        ="water_play",
#        ="water_slid",
#        ="boxing_cen",
#        ="wetland_ar",
#        ="lagoon",
#        ="cricket_fi",
#        ="climbing_w",
#        ="game_table",
#        ="carousel",
#        ="croquet",
#        ="handball_i",
#        ="harbor",
#        ="modeltrain",
#        ="modelyacht",
#        ="nature_bir",
#        ="minigolf")