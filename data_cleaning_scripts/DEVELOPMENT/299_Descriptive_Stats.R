
sb_env <- readRDS("Robjects/sb_env_buffer.RDS")


## number of plots used in final analysis




## sample size by species in final analysis - presence

n_sp_p <- sb_env %>%
  select(Plot, Species, presence) %>%
  filter(presence == TRUE) %>%
  distinct() %>%
  group_by(Species) %>%
  count(presence) %>%
  filter(n > 15)

min(n_sp_p$n)
mean(n_sp_p$n)
max(n_sp_p$n)

## sample size by species in final analysis - abundance

n_sp_a <- sb_env %>%
  select(Plot, Species, max_birds_allyrs) %>%
  distinct() %>%
  group_by(Species) %>%
  summarize(sum = sum(max_birds_allyrs))



#why does sp_env have the species with inadequate sample sizes?