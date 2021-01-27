#import data

all_coordsLONG <- read.csv("exported/all_coords/all_coordsLONG_2020_09_03.csv") %>%
  select(-X)

bigdata <- read.csv("exported/bigdata_cleaned.csv")

good_g3a_alert_ch  <- readRDS("Robjects/good_g3a_alert_ch.RDS")

all_points <- readRDS("Robjects/all_points.RDS")
all_polygons <- readRDS("Robjects/all_polygons.RDS")
all_lines <-readRDS("Robjects/all_lines.RDS")
all_missing <- readRDS("Robjects/all_missing.RDS")


#select the columns I want to send to Isabel

keep <- bigdata %>%
  select(Plot = Standardized_Plot_Name,
         UTM_2_Type,
         Province_or_Territory,
         Map_datum,
         Comment_UTM,
         Comment_Datamanagement_location,
         Source_File_coordinates,
         Source_worksheet_coordinates,
         Source_page_coordinates) %>%
  distinct()
  





for_Isabel <- merge(all_coordsLONG, keep, by = "Plot") %>%
  arrange(Plot, Coordinate_Order)


for_Isabel$Comment_UTM[for_Isabel$Plot %in% good_g3a_alert_ch$Plot] <- "Coortinates are for a convex hull that encloses all subplots that were grouped to form a single standardized plot. For coordinates of all original subplot, see PRISM GIS shapefiles"

for_Isabel <- for_Isabel %>%
  rename(Coordinate_Type = UTM_2_Type) %>%
  mutate(Coordinate_Type = ifelse(Plot %in% all_lines$Plot, "point in line", "plot corner")) %>%
  mutate(Coordinate_Type = ifelse(Plot %in% all_points$Plot, "point", Coordinate_Type)) %>%
  mutate(Coordinate_Type = ifelse(Plot %in% all_missing$Plot, "missing", Coordinate_Type))

for_Isabel$final_coords_source <- "Isabel compliation"

for_Isabel <- for_Isabel %>%
  mutate(final_coords_source  = ifelse(Plot %in% g0_no_coords$Plot, NA, final_coords_source )) %>%
  mutate(final_coords_source  = ifelse(Plot %in% g3_yes_gis$Plot, "GIS shapefiles", final_coords_source ))

for_Isabel$Map_datum <- "NAD 1983"

write.csv(for_Isabel, "exported/prism_finalized_coordinates_20200903.csv")

