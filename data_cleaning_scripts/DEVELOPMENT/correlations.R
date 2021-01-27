pred_data <- sb_env %>%
  select(-Species, -Region_code, -Region_name, -Sub_region_code, -Sub_region_name) %>%
  distinct()

pred_data_250 <- pred_data %>%
  filter(buffer_size == 250) %>%
  select(-buffer_size, -Plot)

pred_data_10k <- pred_data %>%
  filter(buffer_size == 10000) %>%
  select(-buffer_size, -Plot)

M_250 <- cor(pred_data_250)
corrplot(M_250)

M_10k <- cor(pred_data_10k)
corrplot(M_10k, method = "pie")
