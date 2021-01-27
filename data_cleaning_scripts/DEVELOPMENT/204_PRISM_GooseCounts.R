### Adding goose data ###########################################################################################################################

#currently I'm not using this

#import data
included_surveys <- readRDS("Robjects/included_surveys.RDS")



#which species are geese
geese_sp <- c("CAGO", "SNGO", "ROGO", "CACG", "GWFG")

#filter out all of the goose observations from the included surveys
geese_plots <- included_surveys %>%
  filter(Species %in% geese_sp) %>%
  select(Plot,
         plot_date,
         plot_year,
         total_birds) %>%
  group_by(plot_date) %>% 
  mutate(sum_geese_survey = sum(total_birds)) %>%
  ungroup() %>%
  select(-plot_date, -total_birds) %>%
  distinct() %>%
  group_by(plot_year) %>%
  mutate(mean_geese_year = mean(sum_geese_survey)) %>%
  ungroup() %>%
  select(-plot_year, -sum_geese_survey) %>%
  distinct() %>%
  group_by(Plot) %>% 
  mutate(mean_geese = round(mean(mean_geese_year))) %>%
  ungroup() %>%
  select(-mean_geese_year) %>%
  distinct()


#add this as a covatiate to shorebird obsercation data
#not updated, might need to change which shorebird data this is merged with
#SB <- SB %>%
#  merge(geese_plots, all = TRUE) %>%
#  mutate(mean_geese = ifelse(is.na(mean_geese), 0, mean_geese))



