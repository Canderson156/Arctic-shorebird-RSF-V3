
sb_year <- readRDS("Robjects/sb_year.RDS")
sb_max <- readRDS("Robjects/sb_max.RDS")
buffers <- readRDS("Robjects/buffers.RDS")
prop_lc <- readRDS("Robjects/prop_lcALL_10km_09302020.RDS")
#prop_lc <- readRDS("Robjects/prop_lcALL_10km.RDS")






prop_lc <- prop_lc %>%
  ungroup %>%
  dplyr::select(-ID) %>%
  dplyr::rename(lc_code = landcover_mosaic_lcc)

landcover_classes <- data.frame(lc_code = 0:15,
                                lc_class = c(
                                  "missing_data",
                                  "tussock_graminoid",
                                  "wet_sedge",
                                  "nontussock_graminoid",
                                  "nontussock_graminoid",
                                  "shrub",
                                  "shrub",
                                  "shrub",
                                  "sparsely_vegetated",
                                  "sparsely_vegetated",
                                  "sparsely_vegetated",
                                  "wetlands",
                                  "barren",
                                  "ice_snow",
                                  "shadow",
                                  "water"),
                                lc_group = c(
                                  "missing data",
                                  "graminoid",
                                  "graminoid",
                                  "graminoid",
                                  "graminoid",
                                  "shrub",
                                  "shrub",
                                  "shrub",
                                  "sparsely_vegetated",
                                  "sparsely_vegetated",
                                  "sparsely_vegetated",
                                  "wetland",
                                  "barren",
                                  "ice_snow",
                                  "shadow",
                                  "water"))

#saveRDS(landcover_classes, "Robjects/landcoverclasses.RDS")

landcover_classes <- landcover_classes %>%
  select(-lc_group)


prop_lc <- merge(prop_lc, landcover_classes) %>%
  select(-lc_code) %>%
  group_by(buffer_size, lc_class, Plot) %>%
  summarize(n = sum(n))

prop_lc$Plot <- as.character(prop_lc$Plot)
prop_lc$buffer_size <- as.numeric(prop_lc$buffer_size)



#add frequency



prop_lc <- prop_lc %>% 
  group_by(buffer_size, Plot) %>%
  mutate(freq = n / sum(n)) %>%
  ungroup()




#identify plots that have >10% missing and shadow combined


rm_missing <- prop_lc %>%
  filter(lc_class %in% c("missing_data", "shadow")) %>%
  select(-lc_class) %>%
  group_by(Plot, buffer_size) %>%
  summarize(missing = sum(freq)) %>%
  filter(missing > 0.1) %>%
  select(Plot) %>%
  distinct()




#remove the plots that have >10% missing and shadow combined
#remove missing and shadow classes
#recalculate frequency with missing removed



#remove column n here if desired
prop_lc <- prop_lc %>% 
  filter(Plot %notin% rm_missing$Plot,
         lc_class %notin% c("missing_data", "shadow")) %>%
  group_by(buffer_size, Plot) %>%
  mutate(freq = n / sum(n)) %>%
  select(-n) %>%
  ungroup()

#saveRDS(prop_lc, "Robjects/prop_lc_noMissing.RDS")


#### how much variation is there in the different types of landcovers as you increase radius

lc_var <- prop_lc %>%
  group_by(buffer_size, lc_class) %>%
  summarize(range = max(freq) - min(freq)) %>%
  ungroup()

hist(lc_var$range)
quantile(lc_var$range)

lc_var_mean <- lc_var %>%
  group_by(lc_class) %>%
  summarize(mean = mean(range))


ggplot(prop_lc, aes(x = lc_class, y = freq)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

ggplot(lc_var, aes(x = lc_class, y = range)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_y_continuous(breaks = seq(0, 1, 0.1)) +
  xlab("Landcover Class") +
  ylab("Range in landcover proportion (0.25 to 10 km radius")
  


ggplot(lc_var, aes(x = buffer_size, y = range, colour = lc_class)) +
  geom_line(size = 2) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_y_continuous(breaks = seq(0, 1, 0.1))



#wide version

prop_lc_wide <- prop_lc %>%
  spread(lc_class, freq, fill = 0)


#summarize group

#group <- prop_lc %>%
#  group_by(Plot, lc_group, buffer_size) %>%
#  summarize(sum_group = sum(freq)) %>%
#  ungroup() %>%
#  mutate(lc_group = paste("group", lc_group, sep = "_")) %>%
#  spread(lc_group, sum_group, fill = 0)



all_polygons_df <- prop_lc_wide
#all_polygons_df <- merge(all_polygons_df, group, by = "Plot")
rm(prop_lc_wide)



sb_env <- merge(all_polygons_df, sb_max)


temp <- readRDS("Robjects/all_polygons_df.RDS") %>%
  select(Plot, temp_30_min_june) %>%
  distinct()

sb_env <- sb_env %>%
  merge(temp)




saveRDS(sb_env, "Robjects/sb_env_buffer_merged.RDS")
sb_env <- readRDS("Robjects/sb_env_buffer.RDS")


#wide version 


# need to do this without the temperature column to have enough space

sb_env_buffer_wide <- sb_env %>%
  gather(key = "landcover", 
         value = "freq",
         -Plot,
         -buffer_size,
         -Year,
         -Species,                                     
         -Region_name,                               
         -Region_code,                                 
         -Sub_region_name,                             
         -Sub_region_code,                             
         -max_birds,                                  
         -presence
  ) %>%
  spread(buffer_size, freq)


buffer_cols <- paste("R",
                     as.numeric(colnames(sb_env_buffer_wide)[colnames(sb_env_buffer_wide) %in% buffers])/1000,
                     sep = "_")

saveRDS(buffer_cols, "Robjects/buffercols.RDS")

colnames(sb_env_buffer_wide)[colnames(sb_env_buffer_wide) %in% buffers] <- buffer_cols




saveRDS(sb_env_buffer_wide, "Robjects/sb_env_buffer_wide.RDS")





















