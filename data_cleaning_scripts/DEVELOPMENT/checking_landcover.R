###why does barren change so much between 4 and 4.4 km?

why_4sum <- lc_var %>%
  filter(buffer_size %in% c(4000, 4400))

#the biggest jump is in bedrock, although there is also a decent drop in tall shrub and it plateaus there

#UPDATE: after re-doing proportion calculations, there are do big jumps

why_4all <- prop_lc %>%
  filter(buffer_size %in% c(4000, 4400),
         lc_class == "tall_shrub")

why_4all_range <- prop_lc %>%
  filter(buffer_size %in% c(4000, 4400),
         lc_class == "water") %>%
  group_by(Plot) %>%
  summarize(range = max(freq) - min(freq))



###I think I just need to re-run them all again this evening




#hwat does tall shrub look like in my original results





#what is the difference in number of pixels between 4 and 4.4km?


dif_cells4 <- prop_lc %>%
  group_by(Plot, buffer_size) %>%
  summarize(n_cells = sum(n))
  
dif_cells_mean <- prop_lc %>%
  group_by(Plot, buffer_size) %>%
  summarize(n_cells = sum(n)) %>%
  ungroup() %>%
  group_by(buffer_size) %>%
  summarize(mean_cells = mean(n_cells))


dif_cells_mean$increase <- 0

for(i in 2:26) {
  dif_cells_mean$increase[i] = dif_cells_mean$mean_cells[i]/dif_cells_mean$mean_cells[i-1]*100
}
 

