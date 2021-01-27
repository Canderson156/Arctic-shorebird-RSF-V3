

#AMGP model

AMGP_presence <- AMGP_lc %>%
  select(Plot, Year, presence) %>%
  distinct()

AMGP_02_10000 <- AMGP_lc %>%
  filter(landcover == "02_wet_sedge") %>%
  select(Plot, Year, R_10000) %>%
  rename(`02_wet_sedge` = R_10000) %>%
  distinct()

AMGP_10_800  <- AMGP_lc %>%
  filter(landcover == "10_bare_soil_cryptogam_frost_boils") %>%
  select(Plot, Year, R_800) %>%
  rename(`10_bare_soil_cryptogam_frost_boils` = R_800) %>%
  distinct()

AMGP_04_4400 <- AMGP_lc %>%
  filter(landcover == "04_dry_graminoid_prostrate_dwarf_shrub_tundra") %>%
  select(Plot, Year, R_4400) %>%
  rename(`04_dry_graminoid_prostrate_dwarf_shrub_tundra` = R_4400) %>%
  distinct()



AMGP_soe <- merge(AMGP_presence, AMGP_02_10000, by = c("Plot", "Year"))
AMGP_soe <- merge(AMGP_soe, AMGP_10_800, by = c("Plot", "Year"))
AMGP_soe <- merge(AMGP_soe, AMGP_04_4400, by = c("Plot", "Year"))


AMGP_test0 <- glm(presence ~ 
                   `04_dry_graminoid_prostrate_dwarf_shrub_tundra`,
                 AMGP_soe, 
                 family = binomial)

AMGP_test1 <- glm(presence ~ 
                   `10_bare_soil_cryptogam_frost_boils`,
                 AMGP_soe, 
                 family = binomial)

AMGP_test2 <- glm(presence ~ 
                   `02_wet_sedge`,
                 AMGP_soe, 
                 family = binomial)

AMGP_test3 <- glm(presence ~ 
                   `04_dry_graminoid_prostrate_dwarf_shrub_tundra` +
                   `10_bare_soil_cryptogam_frost_boils`,
                 AMGP_soe, 
                 family = binomial)

AMGP_test4 <- glm(presence ~ 
                   `04_dry_graminoid_prostrate_dwarf_shrub_tundra` +
                   `02_wet_sedge`,
                 AMGP_soe, 
                 family = binomial)

AMGP_test5 <- glm(presence ~ 
                   `10_bare_soil_cryptogam_frost_boils` +
                   `02_wet_sedge`,
                 AMGP_soe, 
                 family = binomial)

AMGP_test6 <- glm(presence ~ 
                   `04_dry_graminoid_prostrate_dwarf_shrub_tundra` +
                   `10_bare_soil_cryptogam_frost_boils` +
                   `02_wet_sedge`,
                 AMGP_soe, 
                 family = binomial)


AIC(AMGP_test0,AMGP_test1,AMGP_test2,AMGP_test3,AMGP_test4,AMGP_test5,AMGP_test6)





