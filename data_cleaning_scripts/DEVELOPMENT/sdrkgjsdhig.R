


included_surveys <- readRDS("Robjects/included_surveys.RDS")


plots_2019 <- unique(included_surveys$Plot[included_surveys$Year == 2019])


resurv <- included_surveys %>%
  filter(Plot %in% plots_2019,
         Region_code %in% c(3,7,9))



plots_90s <- unique(resurv$Plot[resurv$Year != 2019])



resurv <- included_surveys %>%
  filter(Plot %in% plots_2019,
         Region_code %in% c(3,7,9),
         Plot %in% plots_90s)



xxx <- resurv %>%
  select(Plot, Region_code) %>%
  distinct()


