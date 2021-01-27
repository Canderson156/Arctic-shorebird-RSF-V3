#PCA/CCA landcover



sb_env <- readRDS("Robjects/sb_env.RDS")

RUTU <- sb_env %>%
  filter(Species == "RUTU") 

hab <- RUTU %>%
  select(contains(c(
    "00_missing_data",
    "01_tussock_graminoid",
    "02_wet_sedge",
    "03_nontussock_graminoid_dwarf_shrub",
    "04_dry_graminoid_prostrate_dwarf_shrub_tundra",
    "05_low_shrub",
    "06_tall_shrub",
    "07_prostrate_dwarf_shrub",
    "08_sparsely_vegetated_bedrock",
    "09_sparsely_vegetated_till",
    "10_bare_soil_cryptogam_frost_boils",
    "11_wetlands",
    "12_barren",
    "13_ice_snow",
    "14_shadow",
    "15_water")))

PCA_hab <- princomp(hab)

comp <- rcomp(hab)

PCA_comp <- princomp(comp)

ggbiplot(PCA_hab)
ggbiplot(PCA_comp)
