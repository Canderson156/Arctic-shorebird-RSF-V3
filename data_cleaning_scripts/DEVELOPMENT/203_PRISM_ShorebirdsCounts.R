### filtering to only shorebird data ###########################################################################################################################



included_surveys <- readRDS("Robjects/included_surveys.RDS")
all_polygons <- readRDS("Robjects/all_polygons.RDS")





#list of shorebird species

sb_list <- included_surveys %>%
  filter(Group == "Shorebirds") %>%
  select(Species) %>%
  unique() %>%
  na.omit() %>%
  pull(Species)


#create a dataframe of all species in all plots
plot_sp <- expand.grid(included_surveys$Plot, sb_list) %>%
  distinct()
colnames(plot_sp) <- c("Plot", "Species")




#all plot info to merge with shorebird counts

all_plot_info <- included_surveys %>%
  select(Plot,
         Region_name, 
         Region_code, 
         Sub_region_name, 
         Sub_region_code,
         Year,
         Plot_area) %>%
  distinct() %>%
  merge(plot_sp, all = TRUE)






#all shorebirds, all years
# I don't think I will use all of these, but they're worth keeping incase I change my mind later


#add together counts where surveys were done on the same day 
#(ie. was originally subplots which were the grouped together)

sb_date <- included_surveys %>%
  filter(Group == "Shorebirds") %>%
  group_by(Plot, Date, Species) %>%
  mutate(sum_birds = sum(total_birds)) %>%
  select(Plot, Year, Month, Day, Date, yday, Species, sum_birds) %>%
  distinct() %>%
  ungroup() %>%
  merge(all_plot_info, all = TRUE) %>%
  mutate(sum_birds = ifelse(is.na(sum_birds), 0, round(sum_birds))) # I added multiple observations together. I did have a note that I was uncertain whether they should be added or if only one should be kept and that I should confer with Isabel
#  mutate(uniqueID = paste(Plot, Date, Year, Species, sep = "_"),
#         dup = allDuplicated(uniqueID))




#maximum birds that were observed on each plot in one year


sb_year <- sb_date %>%
  group_by(Plot, Year, Species) %>%
  mutate(max_birds = max(sum_birds)) %>%
  select( -Month, -Day, -Date, -yday, -sum_birds) %>%
  distinct()  




#all shorebirds, mean between years (from mean within years), rounded up 


sb_mean <- sb_year %>%
  ungroup() %>%
  group_by(Plot, Species) %>%
  mutate(mean_birds_allyrs = ceiling(mean(max_birds))) %>%
  select(-Year, -max_birds) %>%
  distinct()


#all shorebirds, max of all years
sb_max <- sb_year %>%
  ungroup() %>%
  group_by(Plot, Species) %>%
  mutate(max_birds_allyrs = max(max_birds)) %>%
  select(-Year, -max_birds) %>%
  distinct()




# all shorebird species added together, years seperate

sb_year_grouped <- sb_year %>%
  ungroup() %>%
  group_by(Plot, Year) %>%
  mutate(sum_shorebirds = sum(max_birds)) %>%
  select(-Species, -max_birds) %>%
  distinct()  





# all shorebird species added together, years averaged

sb_mean_grouped <- sb_mean %>%
  ungroup() %>%
  group_by(Plot) %>%
  mutate(sum_shorebirds = sum(mean_birds_allyrs)) %>%
  select(-Species, -mean_birds_allyrs) %>%
  distinct()




# make a present/absent variable

sb_year <- sb_year %>%
  mutate(presence = max_birds > 0)

sb_year_grouped <- sb_year_grouped %>%
  mutate(presence = sum_shorebirds > 0)

sb_mean <- sb_mean %>%
  mutate(presence = mean_birds_allyrs > 0)

sb_max <- sb_max %>%
  mutate(presence = max_birds_allyrs > 0)

sb_mean_grouped <- sb_mean_grouped %>%
  mutate(presence = sum_shorebirds > 0)





#identify which species have an adequate sample size (observed in a minimum of 20 plots)

sp_keep <- sb_year %>%
  ungroup() %>%
  group_by(Species) %>%
  summarize(n_plots_observed = sum(presence == TRUE)) %>%
  filter(n_plots_observed > 20, Species != "UNSH")


#remove species with an inadequate sample size. don't need to do this for the grouped ones because they include all species


sb_year <- sb_year %>%
  filter(Species %in% sp_keep$Species)

sb_mean <- sb_mean %>%
  filter(Species %in% sp_keep$Species)

sb_max <- sb_max %>%
  filter(Species %in% sp_keep$Species)














#adding locations

#sb_year <- merge(sb_year, all_polygons)
#sb_year_grouped <- merge(sb_year_grouped, all_polygons)
#sb_mean <- merge(sb_mean, all_polygons)
#sb_mean_grouped <- merge(sb_mean_grouped, all_polygons)




#individual species seperated

#sb_year_species <- sb_year %>%
#  ungroup() %>%
#  group_by(Species) %>%
#  group_split()

#sb_mean_species <- sb_mean %>%
#  ungroup() %>%
#  group_by(Species) %>%
#  group_split()
  
  

#names(sb_year_species) <- sort(sb_list)
#names(sb_mean_species) <- sort(sb_list)




#saveRDS
saveRDS(sb_year, "Robjects/sb_year.RDS")
saveRDS(sb_year_grouped, "Robjects/sb_year_grouped.RDS")
saveRDS(sb_mean, "Robjects/sb_mean.RDS")
saveRDS(sb_max, "Robjects/sb_max.RDS")
saveRDS(sb_mean_grouped, "Robjects/sb_mean_grouped.RDS")
saveRDS(sb_year_species, "Robjects/sb_year_species.RDS")
saveRDS(sb_mean_species, "Robjects/sb_mean_species.RDS")



