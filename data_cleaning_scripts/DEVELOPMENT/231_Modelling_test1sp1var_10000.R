


#calculate landcover at different spatial scales

sb_year <- readRDS("Robjects/sb_year.RDS")
all_polygons <- readRDS("Robjects/all_polygons.RDS")
all_points <- readRDS("Robjects/all_points.RDS")
landcover <- raster("data/landcover/Northern_Land_Cover_2000/landcover_mosaic_lcc.tif")



#find the center of all plots

polygon_centroids <- all_polygons %>%
  st_transform(LCC) %>%
  st_centroid()
#warning is becasue all the associated dataframe information is carried over to the point,
#and R doesn't know if that data is still valid for the new spatial object. 
#warning means it's assuming this is fine. 
#(online example was a country boundary polygon to a point. the point no longer IS the country)



all_centroids <- all_points %>%
  st_transform(LCC) %>%
  filter(not.na(st_dimension(all_points$geometry))) %>%
  rbind(polygon_centroids)

saveRDS(all_centroids, "Robjects1020km/all_centroids.RDS")


all_centroids1 <- all_centroids[1:100,]
all_centroids2 <- all_centroids[101:200,]
all_centroids3 <- all_centroids[201:300,]
all_centroids4 <- all_centroids[301:400,]
all_centroids5 <- all_centroids[401:500,]
all_centroids6 <- all_centroids[501:600,]
all_centroids7 <- all_centroids[601:700,]
all_centroids8 <- all_centroids[701:800,]
all_centroids9 <- all_centroids[801:900,]
all_centroids10 <- all_centroids[901:1000,]
all_centroids11 <- all_centroids[1001:1100,]
all_centroids12 <- all_centroids[1101:1200,]
all_centroids13 <- all_centroids[1201:1300,]
all_centroids14 <- all_centroids[1301:1400,]
all_centroids15 <- all_centroids[1401:1500,]
all_centroids16 <- all_centroids[1501:1600,]
all_centroids17 <- all_centroids[1601:1700,]
all_centroids18 <- all_centroids[1701:1800,]
all_centroids19 <- all_centroids[1801:1900,]
all_centroids20 <- all_centroids[1901:2000,]
all_centroids21 <- all_centroids[2001:2100,]
all_centroids22 <- all_centroids[2101:2200,]
all_centroids23 <- all_centroids[2201:2300,]
all_centroids24 <- all_centroids[2301:2400,]
all_centroids25 <- all_centroids[2401:2500,]
all_centroids26 <- all_centroids[2501:2600,]
all_centroids27 <- all_centroids[2601:2700,]
all_centroids28 <- all_centroids[2701:2800,]
all_centroids29 <- all_centroids[2801:2839,] %>%
  na.omit()


#calculate the landscape cover within 400m - 5km



buffers1 <- seq(from = 11000, length.out = 3, by = 1000)
buffers2 <- seq(from = 14000, length.out = 2, by = 1000)
buffers3 <- seq(from = 16000, length.out = 1, by = 1000)
buffers4 <- seq(from = 17000, length.out = 1, by = 1000)
buffers5 <- seq(from = 18000, length.out = 1, by = 1000)



buffers <- unique(c(buffers1, buffers2, buffers3, buffers4, buffers5))
#saveRDS(buffers, "Robjects1020km/buffers.RDS")

Sys.time()


plot_lc1_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids1, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc1_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids1, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc1_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids1, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc1_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids1, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc1_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids1, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc1_1, "Robjects1020km/plot_lc1_1.RDS")
saveRDS(plot_lc1_2, "Robjects1020km/plot_lc1_2.RDS")
saveRDS(plot_lc1_3, "Robjects1020km/plot_lc1_3.RDS")
saveRDS(plot_lc1_4, "Robjects1020km/plot_lc1_4.RDS")
saveRDS(plot_lc1_5, "Robjects1020km/plot_lc1_5.RDS")

rm(plot_lc1_1)
rm(plot_lc1_2)
rm(plot_lc1_3)
rm(plot_lc1_4)
rm(plot_lc1_5)



plot_lc2_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids2, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc2_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids2, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc2_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids2, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc2_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids2, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc2_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids2, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc2_1, "Robjects1020km/plot_lc2_1.RDS")
saveRDS(plot_lc2_2, "Robjects1020km/plot_lc2_2.RDS")
saveRDS(plot_lc2_3, "Robjects1020km/plot_lc2_3.RDS")
saveRDS(plot_lc2_4, "Robjects1020km/plot_lc2_4.RDS")
saveRDS(plot_lc2_5, "Robjects1020km/plot_lc2_5.RDS")

rm(plot_lc2_1)
rm(plot_lc2_2)
rm(plot_lc2_3)
rm(plot_lc2_4)
rm(plot_lc2_5)



plot_lc3_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids3, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc3_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids3, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc3_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids3, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc3_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids3, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc3_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids3, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc3_1, "Robjects1020km/plot_lc3_1.RDS")
saveRDS(plot_lc3_2, "Robjects1020km/plot_lc3_2.RDS")
saveRDS(plot_lc3_3, "Robjects1020km/plot_lc3_3.RDS")
saveRDS(plot_lc3_4, "Robjects1020km/plot_lc3_4.RDS")
saveRDS(plot_lc3_5, "Robjects1020km/plot_lc3_5.RDS")

rm(plot_lc3_1)
rm(plot_lc3_2)
rm(plot_lc3_3)
rm(plot_lc3_4)
rm(plot_lc3_5)

plot_lc4_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids4, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc4_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids4, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc4_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids4, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc4_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids4, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc4_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids4, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc4_1, "Robjects1020km/plot_lc4_1.RDS")
saveRDS(plot_lc4_2, "Robjects1020km/plot_lc4_2.RDS")
saveRDS(plot_lc4_3, "Robjects1020km/plot_lc4_3.RDS")
saveRDS(plot_lc4_4, "Robjects1020km/plot_lc4_4.RDS")
saveRDS(plot_lc4_5, "Robjects1020km/plot_lc4_5.RDS")

rm(plot_lc4_1)
rm(plot_lc4_2)
rm(plot_lc4_3)
rm(plot_lc4_4)
rm(plot_lc4_5)



plot_lc5_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids5, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc5_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids5, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc5_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids5, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc5_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids5, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc5_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids5, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc5_1, "Robjects1020km/plot_lc5_1.RDS")
saveRDS(plot_lc5_2, "Robjects1020km/plot_lc5_2.RDS")
saveRDS(plot_lc5_3, "Robjects1020km/plot_lc5_3.RDS")
saveRDS(plot_lc5_4, "Robjects1020km/plot_lc5_4.RDS")
saveRDS(plot_lc5_5, "Robjects1020km/plot_lc5_5.RDS")

rm(plot_lc5_1)
rm(plot_lc5_2)
rm(plot_lc5_3)
rm(plot_lc5_4)
rm(plot_lc5_5)



plot_lc6_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids6, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc6_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids6, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc6_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids6, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc6_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids6, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc6_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids6, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc6_1, "Robjects1020km/plot_lc6_1.RDS")
saveRDS(plot_lc6_2, "Robjects1020km/plot_lc6_2.RDS")
saveRDS(plot_lc6_3, "Robjects1020km/plot_lc6_3.RDS")
saveRDS(plot_lc6_4, "Robjects1020km/plot_lc6_4.RDS")
saveRDS(plot_lc6_5, "Robjects1020km/plot_lc6_5.RDS")

rm(plot_lc6_1)
rm(plot_lc6_2)
rm(plot_lc6_3)
rm(plot_lc6_4)
rm(plot_lc6_5)



plot_lc7_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids7, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc7_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids7, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc7_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids7, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc7_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids7, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc7_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids7, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc7_1, "Robjects1020km/plot_lc7_1.RDS")
saveRDS(plot_lc7_2, "Robjects1020km/plot_lc7_2.RDS")
saveRDS(plot_lc7_3, "Robjects1020km/plot_lc7_3.RDS")
saveRDS(plot_lc7_4, "Robjects1020km/plot_lc7_4.RDS")
saveRDS(plot_lc7_5, "Robjects1020km/plot_lc7_5.RDS")

rm(plot_lc7_1)
rm(plot_lc7_2)
rm(plot_lc7_3)
rm(plot_lc7_4)
rm(plot_lc7_5)



plot_lc8_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids8, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc8_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids8, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc8_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids8, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc8_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids8, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc8_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids8, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc8_1, "Robjects1020km/plot_lc8_1.RDS")
saveRDS(plot_lc8_2, "Robjects1020km/plot_lc8_2.RDS")
saveRDS(plot_lc8_3, "Robjects1020km/plot_lc8_3.RDS")
saveRDS(plot_lc8_4, "Robjects1020km/plot_lc8_4.RDS")
saveRDS(plot_lc8_5, "Robjects1020km/plot_lc8_5.RDS")

rm(plot_lc8_1)
rm(plot_lc8_2)
rm(plot_lc8_3)
rm(plot_lc8_4)
rm(plot_lc8_5)



plot_lc9_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids9, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc9_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids9, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc9_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids9, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc9_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids9, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc9_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids9, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc9_1, "Robjects1020km/plot_lc9_1.RDS")
saveRDS(plot_lc9_2, "Robjects1020km/plot_lc9_2.RDS")
saveRDS(plot_lc9_3, "Robjects1020km/plot_lc9_3.RDS")
saveRDS(plot_lc9_4, "Robjects1020km/plot_lc9_4.RDS")
saveRDS(plot_lc9_5, "Robjects1020km/plot_lc9_5.RDS")

rm(plot_lc9_1)
rm(plot_lc9_2)
rm(plot_lc9_3)
rm(plot_lc9_4)
rm(plot_lc9_5)



plot_lc10_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids10, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc10_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids10, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc10_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids10, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc10_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids10, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc10_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids10, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc10_1, "Robjects1020km/plot_lc10_1.RDS")
saveRDS(plot_lc10_2, "Robjects1020km/plot_lc10_2.RDS")
saveRDS(plot_lc10_3, "Robjects1020km/plot_lc10_3.RDS")
saveRDS(plot_lc10_4, "Robjects1020km/plot_lc10_4.RDS")
saveRDS(plot_lc10_5, "Robjects1020km/plot_lc10_5.RDS")

rm(plot_lc10_1)
rm(plot_lc10_2)
rm(plot_lc10_3)
rm(plot_lc10_4)
rm(plot_lc10_5)



plot_lc11_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids11, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc11_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids11, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc11_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids11, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc11_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids11, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc11_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids11, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc11_1, "Robjects1020km/plot_lc11_1.RDS")
saveRDS(plot_lc11_2, "Robjects1020km/plot_lc11_2.RDS")
saveRDS(plot_lc11_3, "Robjects1020km/plot_lc11_3.RDS")
saveRDS(plot_lc11_4, "Robjects1020km/plot_lc11_4.RDS")
saveRDS(plot_lc11_5, "Robjects1020km/plot_lc11_5.RDS")

rm(plot_lc11_1)
rm(plot_lc11_2)
rm(plot_lc11_3)
rm(plot_lc11_4)
rm(plot_lc11_5)



plot_lc12_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids12, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc12_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids12, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc12_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids12, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc12_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids12, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc12_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids12, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc12_1, "Robjects1020km/plot_lc12_1.RDS")
saveRDS(plot_lc12_2, "Robjects1020km/plot_lc12_2.RDS")
saveRDS(plot_lc12_3, "Robjects1020km/plot_lc12_3.RDS")
saveRDS(plot_lc12_4, "Robjects1020km/plot_lc12_4.RDS")
saveRDS(plot_lc12_5, "Robjects1020km/plot_lc12_5.RDS")

rm(plot_lc12_1)
rm(plot_lc12_2)
rm(plot_lc12_3)
rm(plot_lc12_4)
rm(plot_lc12_5)



plot_lc13_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids13, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc13_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids13, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc13_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids13, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc13_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids13, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc13_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids13, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc13_1, "Robjects1020km/plot_lc13_1.RDS")
saveRDS(plot_lc13_2, "Robjects1020km/plot_lc13_2.RDS")
saveRDS(plot_lc13_3, "Robjects1020km/plot_lc13_3.RDS")
saveRDS(plot_lc13_4, "Robjects1020km/plot_lc13_4.RDS")
saveRDS(plot_lc13_5, "Robjects1020km/plot_lc13_5.RDS")

rm(plot_lc13_1)
rm(plot_lc13_2)
rm(plot_lc13_3)
rm(plot_lc13_4)
rm(plot_lc13_5)



plot_lc14_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids14, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc14_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids14, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc14_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids14, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc14_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids14, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc14_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids14, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc14_1, "Robjects1020km/plot_lc14_1.RDS")
saveRDS(plot_lc14_2, "Robjects1020km/plot_lc14_2.RDS")
saveRDS(plot_lc14_3, "Robjects1020km/plot_lc14_3.RDS")
saveRDS(plot_lc14_4, "Robjects1020km/plot_lc14_4.RDS")
saveRDS(plot_lc14_5, "Robjects1020km/plot_lc14_5.RDS")

rm(plot_lc14_1)
rm(plot_lc14_2)
rm(plot_lc14_3)
rm(plot_lc14_4)
rm(plot_lc14_5)



plot_lc15_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids15, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc15_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids15, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc15_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids15, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc15_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids15, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc15_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids15, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc15_1, "Robjects1020km/plot_lc15_1.RDS")
saveRDS(plot_lc15_2, "Robjects1020km/plot_lc15_2.RDS")
saveRDS(plot_lc15_3, "Robjects1020km/plot_lc15_3.RDS")
saveRDS(plot_lc15_4, "Robjects1020km/plot_lc15_4.RDS")
saveRDS(plot_lc15_5, "Robjects1020km/plot_lc15_5.RDS")

rm(plot_lc15_1)
rm(plot_lc15_2)
rm(plot_lc15_3)
rm(plot_lc15_4)
rm(plot_lc15_5)



plot_lc16_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids16, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc16_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids16, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc16_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids16, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc16_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids16, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc16_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids16, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc16_1, "Robjects1020km/plot_lc16_1.RDS")
saveRDS(plot_lc16_2, "Robjects1020km/plot_lc16_2.RDS")
saveRDS(plot_lc16_3, "Robjects1020km/plot_lc16_3.RDS")
saveRDS(plot_lc16_4, "Robjects1020km/plot_lc16_4.RDS")
saveRDS(plot_lc16_5, "Robjects1020km/plot_lc16_5.RDS")

rm(plot_lc16_1)
rm(plot_lc16_2)
rm(plot_lc16_3)
rm(plot_lc16_4)
rm(plot_lc16_5)



plot_lc17_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids17, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc17_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids17, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc17_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids17, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc17_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids17, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc17_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids17, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc17_1, "Robjects1020km/plot_lc17_1.RDS")
saveRDS(plot_lc17_2, "Robjects1020km/plot_lc17_2.RDS")
saveRDS(plot_lc17_3, "Robjects1020km/plot_lc17_3.RDS")
saveRDS(plot_lc17_4, "Robjects1020km/plot_lc17_4.RDS")
saveRDS(plot_lc17_5, "Robjects1020km/plot_lc17_5.RDS")

rm(plot_lc17_1)
rm(plot_lc17_2)
rm(plot_lc17_3)
rm(plot_lc17_4)
rm(plot_lc17_5)



plot_lc18_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids18, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc18_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids18, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc18_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids18, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc18_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids18, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc18_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids18, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc18_1, "Robjects1020km/plot_lc18_1.RDS")
saveRDS(plot_lc18_2, "Robjects1020km/plot_lc18_2.RDS")
saveRDS(plot_lc18_3, "Robjects1020km/plot_lc18_3.RDS")
saveRDS(plot_lc18_4, "Robjects1020km/plot_lc18_4.RDS")
saveRDS(plot_lc18_5, "Robjects1020km/plot_lc18_5.RDS")

rm(plot_lc18_1)
rm(plot_lc18_2)
rm(plot_lc18_3)
rm(plot_lc18_4)
rm(plot_lc18_5)



plot_lc19_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids19, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc19_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids19, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc19_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids19, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc19_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids19, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc19_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids19, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc19_1, "Robjects1020km/plot_lc19_1.RDS")
saveRDS(plot_lc19_2, "Robjects1020km/plot_lc19_2.RDS")
saveRDS(plot_lc19_3, "Robjects1020km/plot_lc19_3.RDS")
saveRDS(plot_lc19_4, "Robjects1020km/plot_lc19_4.RDS")
saveRDS(plot_lc19_5, "Robjects1020km/plot_lc19_5.RDS")

rm(plot_lc19_1)
rm(plot_lc19_2)
rm(plot_lc19_3)
rm(plot_lc19_4)
rm(plot_lc19_5)



plot_lc20_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids20, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc20_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids20, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc20_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids20, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc20_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids20, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc20_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids20, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc20_1, "Robjects1020km/plot_lc20_1.RDS")
saveRDS(plot_lc20_2, "Robjects1020km/plot_lc20_2.RDS")
saveRDS(plot_lc20_3, "Robjects1020km/plot_lc20_3.RDS")
saveRDS(plot_lc20_4, "Robjects1020km/plot_lc20_4.RDS")
saveRDS(plot_lc20_5, "Robjects1020km/plot_lc20_5.RDS")

rm(plot_lc20_1)
rm(plot_lc20_2)
rm(plot_lc20_3)
rm(plot_lc20_4)
rm(plot_lc20_5)



plot_lc21_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids21, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc21_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids21, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc21_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids21, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc21_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids21, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc21_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids21, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc21_1, "Robjects1020km/plot_lc21_1.RDS")
saveRDS(plot_lc21_2, "Robjects1020km/plot_lc21_2.RDS")
saveRDS(plot_lc21_3, "Robjects1020km/plot_lc21_3.RDS")
saveRDS(plot_lc21_4, "Robjects1020km/plot_lc21_4.RDS")
saveRDS(plot_lc21_5, "Robjects1020km/plot_lc21_5.RDS")

rm(plot_lc21_1)
rm(plot_lc21_2)
rm(plot_lc21_3)
rm(plot_lc21_4)
rm(plot_lc21_5)



plot_lc22_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids22, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc22_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids22, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc22_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids22, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc22_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids22, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc22_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids22, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc22_1, "Robjects1020km/plot_lc22_1.RDS")
saveRDS(plot_lc22_2, "Robjects1020km/plot_lc22_2.RDS")
saveRDS(plot_lc22_3, "Robjects1020km/plot_lc22_3.RDS")
saveRDS(plot_lc22_4, "Robjects1020km/plot_lc22_4.RDS")
saveRDS(plot_lc22_5, "Robjects1020km/plot_lc22_5.RDS")

rm(plot_lc22_1)
rm(plot_lc22_2)
rm(plot_lc22_3)
rm(plot_lc22_4)
rm(plot_lc22_5)



plot_lc23_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids23, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc23_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids23, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc23_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids23, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc23_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids23, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc23_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids23, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc23_1, "Robjects1020km/plot_lc23_1.RDS")
saveRDS(plot_lc23_2, "Robjects1020km/plot_lc23_2.RDS")
saveRDS(plot_lc23_3, "Robjects1020km/plot_lc23_3.RDS")
saveRDS(plot_lc23_4, "Robjects1020km/plot_lc23_4.RDS")
saveRDS(plot_lc23_5, "Robjects1020km/plot_lc23_5.RDS")

rm(plot_lc23_1)
rm(plot_lc23_2)
rm(plot_lc23_3)
rm(plot_lc23_4)
rm(plot_lc23_5)



plot_lc24_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids24, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc24_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids24, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc24_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids24, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc24_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids24, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc24_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids24, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc24_1, "Robjects1020km/plot_lc24_1.RDS")
saveRDS(plot_lc24_2, "Robjects1020km/plot_lc24_2.RDS")
saveRDS(plot_lc24_3, "Robjects1020km/plot_lc24_3.RDS")
saveRDS(plot_lc24_4, "Robjects1020km/plot_lc24_4.RDS")
saveRDS(plot_lc24_5, "Robjects1020km/plot_lc24_5.RDS")

rm(plot_lc24_1)
rm(plot_lc24_2)
rm(plot_lc24_3)
rm(plot_lc24_4)
rm(plot_lc24_5)



plot_lc25_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids25, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc25_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids25, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc25_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids25, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc25_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids25, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc25_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids25, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc25_1, "Robjects1020km/plot_lc25_1.RDS")
saveRDS(plot_lc25_2, "Robjects1020km/plot_lc25_2.RDS")
saveRDS(plot_lc25_3, "Robjects1020km/plot_lc25_3.RDS")
saveRDS(plot_lc25_4, "Robjects1020km/plot_lc25_4.RDS")
saveRDS(plot_lc25_5, "Robjects1020km/plot_lc25_5.RDS")

rm(plot_lc25_1)
rm(plot_lc25_2)
rm(plot_lc25_3)
rm(plot_lc25_4)
rm(plot_lc25_5)



plot_lc26_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids26, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc26_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids26, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc26_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids26, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc26_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids26, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc26_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids26, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc26_1, "Robjects1020km/plot_lc26_1.RDS")
saveRDS(plot_lc26_2, "Robjects1020km/plot_lc26_2.RDS")
saveRDS(plot_lc26_3, "Robjects1020km/plot_lc26_3.RDS")
saveRDS(plot_lc26_4, "Robjects1020km/plot_lc26_4.RDS")
saveRDS(plot_lc26_5, "Robjects1020km/plot_lc26_5.RDS")

rm(plot_lc26_1)
rm(plot_lc26_2)
rm(plot_lc26_3)
rm(plot_lc26_4)
rm(plot_lc26_5)



plot_lc27_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids27, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc27_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids27, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc27_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids27, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc27_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids27, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc27_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids27, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc27_1, "Robjects1020km/plot_lc27_1.RDS")
saveRDS(plot_lc27_2, "Robjects1020km/plot_lc27_2.RDS")
saveRDS(plot_lc27_3, "Robjects1020km/plot_lc27_3.RDS")
saveRDS(plot_lc27_4, "Robjects1020km/plot_lc27_4.RDS")
saveRDS(plot_lc27_5, "Robjects1020km/plot_lc27_5.RDS")

rm(plot_lc27_1)
rm(plot_lc27_2)
rm(plot_lc27_3)
rm(plot_lc27_4)
rm(plot_lc27_5)



plot_lc28_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids28, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc28_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids28, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc28_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids28, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc28_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids28, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc28_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids28, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc28_1, "Robjects1020km/plot_lc28_1.RDS")
saveRDS(plot_lc28_2, "Robjects1020km/plot_lc28_2.RDS")
saveRDS(plot_lc28_3, "Robjects1020km/plot_lc28_3.RDS")
saveRDS(plot_lc28_4, "Robjects1020km/plot_lc28_4.RDS")
saveRDS(plot_lc28_5, "Robjects1020km/plot_lc28_5.RDS")

rm(plot_lc28_1)
rm(plot_lc28_2)
rm(plot_lc28_3)
rm(plot_lc28_4)
rm(plot_lc28_5)


plot_lc29_1 <- lapply(buffers1, function(x) raster::extract(landcover, all_centroids29, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc29_2 <- lapply(buffers2, function(x) raster::extract(landcover, all_centroids29, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc29_3 <- lapply(buffers3, function(x) raster::extract(landcover, all_centroids29, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc29_4 <- lapply(buffers4, function(x) raster::extract(landcover, all_centroids29, buffer = x , df = T, weights = T, normalizeWeights = T))
plot_lc29_5 <- lapply(buffers5, function(x) raster::extract(landcover, all_centroids29, buffer = x , df = T, weights = T, normalizeWeights = T))

saveRDS(plot_lc29_1, "Robjects1020km/plot_lc29_1.RDS")
saveRDS(plot_lc29_2, "Robjects1020km/plot_lc29_2.RDS")
saveRDS(plot_lc29_3, "Robjects1020km/plot_lc29_3.RDS")
saveRDS(plot_lc29_4, "Robjects1020km/plot_lc29_4.RDS")
saveRDS(plot_lc29_5, "Robjects1020km/plot_lc29_5.RDS")

rm(plot_lc29_1)
rm(plot_lc29_2)
rm(plot_lc29_3)
rm(plot_lc29_4)
rm(plot_lc29_5)



Sys.time()








plot_lc1_1 <- readRDS("Robjects1020km/plot_lc1_1.RDS")
names(plot_lc1_1) <- buffers1
plot_lc1_1  <- lapply(plot_lc1_1, as.data.frame)
plot_lc1_1 <- plot_lc1_1 %>% 
  bind_rows(.id = "buffer_size") #this merges all of the list elements into one dataframe. the names of the list become the .id in the new dataframe
plot_lc1_1 <- plot_lc1_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())



plot_lc1_2 <- readRDS("Robjects1020km/plot_lc1_2.RDS")
names(plot_lc1_2) <- buffers2
plot_lc1_2  <- lapply(plot_lc1_2, as.data.frame)
plot_lc1_2 <- plot_lc1_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc1_2 <- plot_lc1_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())


plot_lc1_3 <- readRDS("Robjects1020km/plot_lc1_3.RDS")
names(plot_lc1_3) <- buffers3
plot_lc1_3  <- lapply(plot_lc1_3, as.data.frame)
plot_lc1_3 <- plot_lc1_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc1_3 <- plot_lc1_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())


plot_lc1_4 <- readRDS("Robjects1020km/plot_lc1_4.RDS")
names(plot_lc1_4) <- buffers4
plot_lc1_4  <- lapply(plot_lc1_4, as.data.frame)
plot_lc1_4 <- plot_lc1_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc1_4 <- plot_lc1_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())


plot_lc1_5 <- readRDS("Robjects1020km/plot_lc1_5.RDS")
names(plot_lc1_5) <- buffers5
plot_lc1_5  <- lapply(plot_lc1_5, as.data.frame)
plot_lc1_5 <- plot_lc1_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc1_5 <- plot_lc1_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())


plot_lc1 <- rbind(plot_lc1_1, plot_lc1_2, plot_lc1_3, plot_lc1_4, plot_lc1_5)
rm(plot_lc1_1, plot_lc1_2, plot_lc1_3, plot_lc1_4, plot_lc1_5)
names1 <- data.frame(Plot = as.character(all_centroids1$Plot), ID = 1:length(all_centroids1$Plot))
plot_lc1 <- merge(plot_lc1, names1)









#load all these datasets that I made

plot_lc1_1 <- readRDS("Robjects1020km/plot_lc1_1.RDS")
plot_lc1_2 <- readRDS("Robjects1020km/plot_lc1_2.RDS")
plot_lc1_3 <- readRDS("Robjects1020km/plot_lc1_3.RDS")
plot_lc1_4 <- readRDS("Robjects1020km/plot_lc1_4.RDS")
plot_lc1_5 <- readRDS("Robjects1020km/plot_lc1_5.RDS")


names(plot_lc1_1) <- buffers1
names(plot_lc1_2) <- buffers2
names(plot_lc1_3) <- buffers3
names(plot_lc1_4) <- buffers4
names(plot_lc1_5) <- buffers5

plot_lc1_1  <- lapply(plot_lc1_1, as.data.frame)
plot_lc1_2  <- lapply(plot_lc1_2, as.data.frame)
plot_lc1_3  <- lapply(plot_lc1_3, as.data.frame)
plot_lc1_4  <- lapply(plot_lc1_4, as.data.frame)
plot_lc1_5  <- lapply(plot_lc1_5, as.data.frame)

plot_lc1_1 <- plot_lc1_1 %>% 
  bind_rows(.id = "buffer_size") #this merges all of the list elements into one dataframe. the names of the list become the .id in the new dataframe
plot_lc1_1 <- plot_lc1_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc1_2 <- plot_lc1_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc1_2 <- plot_lc1_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc1_3 <- plot_lc1_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc1_3 <- plot_lc1_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc1_4 <- plot_lc1_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc1_4 <- plot_lc1_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc1_5 <- plot_lc1_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc1_5 <- plot_lc1_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc1 <- rbind(plot_lc1_1, plot_lc1_2, plot_lc1_3, plot_lc1_4, plot_lc1_5)
rm(plot_lc1_1, plot_lc1_2, plot_lc1_3, plot_lc1_4, plot_lc1_5)
names1 <- data.frame(Plot = as.character(all_centroids1$Plot), ID = 1:length(all_centroids1$Plot))
plot_lc1 <- merge(plot_lc1, names1)





plot_lc2_1 <- readRDS("Robjects1020km/plot_lc2_1.RDS")
plot_lc2_2 <- readRDS("Robjects1020km/plot_lc2_2.RDS")
plot_lc2_3 <- readRDS("Robjects1020km/plot_lc2_3.RDS")
plot_lc2_4 <- readRDS("Robjects1020km/plot_lc2_4.RDS")
plot_lc2_5 <- readRDS("Robjects1020km/plot_lc2_5.RDS")

names(plot_lc2_1) <- buffers1
names(plot_lc2_2) <- buffers2
names(plot_lc2_3) <- buffers3
names(plot_lc2_4) <- buffers4
names(plot_lc2_5) <- buffers5

plot_lc2_1  <- lapply(plot_lc2_1, as.data.frame)
plot_lc2_2  <- lapply(plot_lc2_2, as.data.frame)
plot_lc2_3  <- lapply(plot_lc2_3, as.data.frame)
plot_lc2_4  <- lapply(plot_lc2_4, as.data.frame)
plot_lc2_5  <- lapply(plot_lc2_5, as.data.frame)

plot_lc2_1 <- plot_lc2_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc2_1 <- plot_lc2_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc2_2 <- plot_lc2_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc2_2 <- plot_lc2_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc2_3 <- plot_lc2_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc2_3 <- plot_lc2_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc2_4 <- plot_lc2_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc2_4 <- plot_lc2_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc2_5 <- plot_lc2_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc2_5 <- plot_lc2_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc2 <- rbind(plot_lc2_1, plot_lc2_2, plot_lc2_3, plot_lc2_4, plot_lc2_5)
rm(plot_lc2_1, plot_lc2_2, plot_lc2_3, plot_lc2_4, plot_lc2_5)
names2 <- data.frame(Plot = as.character(all_centroids2$Plot), ID = 1:length(all_centroids2$Plot))
plot_lc2 <- merge(plot_lc2, names2)






plot_lc3_1 <- readRDS("Robjects1020km/plot_lc3_1.RDS")
plot_lc3_2 <- readRDS("Robjects1020km/plot_lc3_2.RDS")
plot_lc3_3 <- readRDS("Robjects1020km/plot_lc3_3.RDS")
plot_lc3_4 <- readRDS("Robjects1020km/plot_lc3_4.RDS")
plot_lc3_5 <- readRDS("Robjects1020km/plot_lc3_5.RDS")

names(plot_lc3_1) <- buffers1
names(plot_lc3_2) <- buffers2
names(plot_lc3_3) <- buffers3
names(plot_lc3_4) <- buffers4
names(plot_lc3_5) <- buffers5

plot_lc3_1  <- lapply(plot_lc3_1, as.data.frame)
plot_lc3_2  <- lapply(plot_lc3_2, as.data.frame)
plot_lc3_3  <- lapply(plot_lc3_3, as.data.frame)
plot_lc3_4  <- lapply(plot_lc3_4, as.data.frame)
plot_lc3_5  <- lapply(plot_lc3_5, as.data.frame)

plot_lc3_1 <- plot_lc3_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc3_1 <- plot_lc3_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc3_2 <- plot_lc3_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc3_2 <- plot_lc3_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc3_3 <- plot_lc3_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc3_3 <- plot_lc3_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc3_4 <- plot_lc3_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc3_4 <- plot_lc3_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc3_5 <- plot_lc3_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc3_5 <- plot_lc3_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc3 <- rbind(plot_lc3_1, plot_lc3_2, plot_lc3_3, plot_lc3_4, plot_lc3_5)
rm(plot_lc3_1, plot_lc3_2, plot_lc3_3, plot_lc3_4, plot_lc3_5)
names3 <- data.frame(Plot = as.character(all_centroids3$Plot), ID = 1:length(all_centroids3$Plot))
plot_lc3 <- merge(plot_lc3, names3)


#memory limit - group togther, process, delete

prop_lc1_3 <- rbind(plot_lc1, plot_lc2, plot_lc3)
saveRDS(prop_lc1_3, "Robjects1020km/prop_lc1_3.RDS")
rm(plot_lc1, plot_lc2, plot_lc3)
rm(prop_lc1_3)


#######################

plot_lc4_1 <- readRDS("Robjects1020km/plot_lc4_1.RDS")
plot_lc4_2 <- readRDS("Robjects1020km/plot_lc4_2.RDS")
plot_lc4_3 <- readRDS("Robjects1020km/plot_lc4_3.RDS")
plot_lc4_4 <- readRDS("Robjects1020km/plot_lc4_4.RDS")
plot_lc4_5 <- readRDS("Robjects1020km/plot_lc4_5.RDS")


names(plot_lc4_1) <- buffers1
names(plot_lc4_2) <- buffers2
names(plot_lc4_3) <- buffers3
names(plot_lc4_4) <- buffers4
names(plot_lc4_5) <- buffers5

plot_lc4_1  <- lapply(plot_lc4_1, as.data.frame)
plot_lc4_2  <- lapply(plot_lc4_2, as.data.frame)
plot_lc4_3  <- lapply(plot_lc4_3, as.data.frame)
plot_lc4_4  <- lapply(plot_lc4_4, as.data.frame)
plot_lc4_5  <- lapply(plot_lc4_5, as.data.frame)

plot_lc4_1 <- plot_lc4_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc4_1 <- plot_lc4_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc4_2 <- plot_lc4_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc4_2 <- plot_lc4_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc4_3 <- plot_lc4_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc4_3 <- plot_lc4_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc4_4 <- plot_lc4_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc4_4 <- plot_lc4_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc4_5 <- plot_lc4_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc4_5 <- plot_lc4_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc4 <- rbind(plot_lc4_1, plot_lc4_2, plot_lc4_3, plot_lc4_4, plot_lc4_5)
rm(plot_lc4_1, plot_lc4_2, plot_lc4_3, plot_lc4_4, plot_lc4_5)
names4 <- data.frame(Plot = as.character(all_centroids4$Plot), ID = 1:length(all_centroids4$Plot))
plot_lc4 <- merge(plot_lc4, names4)





plot_lc5_1 <- readRDS("Robjects1020km/plot_lc5_1.RDS")
plot_lc5_2 <- readRDS("Robjects1020km/plot_lc5_2.RDS")
plot_lc5_3 <- readRDS("Robjects1020km/plot_lc5_3.RDS")
plot_lc5_4 <- readRDS("Robjects1020km/plot_lc5_4.RDS")
plot_lc5_5 <- readRDS("Robjects1020km/plot_lc5_5.RDS")

names(plot_lc5_1) <- buffers1
names(plot_lc5_2) <- buffers2
names(plot_lc5_3) <- buffers3
names(plot_lc5_4) <- buffers4
names(plot_lc5_5) <- buffers5

plot_lc5_1  <- lapply(plot_lc5_1, as.data.frame)
plot_lc5_2  <- lapply(plot_lc5_2, as.data.frame)
plot_lc5_3  <- lapply(plot_lc5_3, as.data.frame)
plot_lc5_4  <- lapply(plot_lc5_4, as.data.frame)
plot_lc5_5  <- lapply(plot_lc5_5, as.data.frame)

plot_lc5_1 <- plot_lc5_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc5_1 <- plot_lc5_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc5_2 <- plot_lc5_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc5_2 <- plot_lc5_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc5_3 <- plot_lc5_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc5_3 <- plot_lc5_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc5_4 <- plot_lc5_4 %>% 
  bind_rows(.id = "buffer_size") #promise evaluation warning?
plot_lc5_4 <- plot_lc5_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc5_5 <- plot_lc5_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc5_5 <- plot_lc5_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc5 <- rbind(plot_lc5_1, plot_lc5_2, plot_lc5_3, plot_lc5_4, plot_lc5_5)
rm(plot_lc5_1, plot_lc5_2, plot_lc5_3, plot_lc5_4, plot_lc5_5)
names5 <- data.frame(Plot = as.character(all_centroids5$Plot), ID = 1:length(all_centroids5$Plot))
plot_lc5 <- merge(plot_lc5, names5)




plot_lc6_1 <- readRDS("Robjects1020km/plot_lc6_1.RDS")
plot_lc6_2 <- readRDS("Robjects1020km/plot_lc6_2.RDS")
plot_lc6_3 <- readRDS("Robjects1020km/plot_lc6_3.RDS")
plot_lc6_4 <- readRDS("Robjects1020km/plot_lc6_4.RDS")
plot_lc6_5 <- readRDS("Robjects1020km/plot_lc6_5.RDS")

names(plot_lc6_1) <- buffers1
names(plot_lc6_2) <- buffers2
names(plot_lc6_3) <- buffers3
names(plot_lc6_4) <- buffers4
names(plot_lc6_5) <- buffers5

plot_lc6_1  <- lapply(plot_lc6_1, as.data.frame)
plot_lc6_2  <- lapply(plot_lc6_2, as.data.frame)
plot_lc6_3  <- lapply(plot_lc6_3, as.data.frame)
plot_lc6_4  <- lapply(plot_lc6_4, as.data.frame)
plot_lc6_5  <- lapply(plot_lc6_5, as.data.frame)

plot_lc6_1 <- plot_lc6_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc6_1 <- plot_lc6_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc6_2 <- plot_lc6_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc6_2 <- plot_lc6_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc6_3 <- plot_lc6_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc6_3 <- plot_lc6_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc6_4 <- plot_lc6_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc6_4 <- plot_lc6_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc6_5 <- plot_lc6_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc6_5 <- plot_lc6_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc6 <- rbind(plot_lc6_1, plot_lc6_2, plot_lc6_3, plot_lc6_4, plot_lc6_5)
rm(plot_lc6_1, plot_lc6_2, plot_lc6_3, plot_lc6_4, plot_lc6_5)
names6 <- data.frame(Plot = as.character(all_centroids6$Plot), ID = 1:length(all_centroids6$Plot))
plot_lc6 <- merge(plot_lc6, names6)


#memory limit - group togther, process, delete

prop_lc4_6 <- rbind(plot_lc4, plot_lc5, plot_lc6)
saveRDS(prop_lc4_6, "Robjects1020km/prop_lc4_6.RDS")
rm(plot_lc4, plot_lc5, plot_lc6)
rm(prop_lc4_6)






plot_lc7_1 <- readRDS("Robjects1020km/plot_lc7_1.RDS")
plot_lc7_2 <- readRDS("Robjects1020km/plot_lc7_2.RDS")
plot_lc7_3 <- readRDS("Robjects1020km/plot_lc7_3.RDS")
plot_lc7_4 <- readRDS("Robjects1020km/plot_lc7_4.RDS")
plot_lc7_5 <- readRDS("Robjects1020km/plot_lc7_5.RDS")

names(plot_lc7_1) <- buffers1
names(plot_lc7_2) <- buffers2
names(plot_lc7_3) <- buffers3
names(plot_lc7_4) <- buffers4
names(plot_lc7_5) <- buffers5

plot_lc7_1  <- lapply(plot_lc7_1, as.data.frame)
plot_lc7_2  <- lapply(plot_lc7_2, as.data.frame)
plot_lc7_3  <- lapply(plot_lc7_3, as.data.frame)
plot_lc7_4  <- lapply(plot_lc7_4, as.data.frame)
plot_lc7_5  <- lapply(plot_lc7_5, as.data.frame)

plot_lc7_1 <- plot_lc7_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc7_1 <- plot_lc7_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc7_2 <- plot_lc7_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc7_2 <- plot_lc7_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc7_3 <- plot_lc7_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc7_3 <- plot_lc7_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc7_4 <- plot_lc7_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc7_4 <- plot_lc7_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc7_5 <- plot_lc7_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc7_5 <- plot_lc7_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc7 <- rbind(plot_lc7_1, plot_lc7_2, plot_lc7_3, plot_lc7_4, plot_lc7_5)
rm(plot_lc7_1, plot_lc7_2, plot_lc7_3, plot_lc7_4, plot_lc7_5)
names7 <- data.frame(Plot = as.character(all_centroids7$Plot), ID = 1:length(all_centroids7$Plot))
plot_lc7 <- merge(plot_lc7, names7)

plot_lc8_1 <- readRDS("Robjects1020km/plot_lc8_1.RDS")
plot_lc8_2 <- readRDS("Robjects1020km/plot_lc8_2.RDS")
plot_lc8_3 <- readRDS("Robjects1020km/plot_lc8_3.RDS")
plot_lc8_4 <- readRDS("Robjects1020km/plot_lc8_4.RDS")
plot_lc8_5 <- readRDS("Robjects1020km/plot_lc8_5.RDS")

names(plot_lc8_1) <- buffers1
names(plot_lc8_2) <- buffers2
names(plot_lc8_3) <- buffers3
names(plot_lc8_4) <- buffers4
names(plot_lc8_5) <- buffers5

plot_lc8_1  <- lapply(plot_lc8_1, as.data.frame)
plot_lc8_2  <- lapply(plot_lc8_2, as.data.frame)
plot_lc8_3  <- lapply(plot_lc8_3, as.data.frame)
plot_lc8_4  <- lapply(plot_lc8_4, as.data.frame)
plot_lc8_5  <- lapply(plot_lc8_5, as.data.frame)

plot_lc8_1 <- plot_lc8_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc8_1 <- plot_lc8_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc8_2 <- plot_lc8_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc8_2 <- plot_lc8_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc8_3 <- plot_lc8_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc8_3 <- plot_lc8_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc8_4 <- plot_lc8_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc8_4 <- plot_lc8_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc8_5 <- plot_lc8_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc8_5 <- plot_lc8_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  
#promise evaluation warning?

plot_lc8 <- rbind(plot_lc8_1, plot_lc8_2, plot_lc8_3, plot_lc8_4, plot_lc8_5)
rm(plot_lc8_1, plot_lc8_2, plot_lc8_3, plot_lc8_4, plot_lc8_5)
names8 <- data.frame(Plot = as.character(all_centroids8$Plot), ID = 1:length(all_centroids8$Plot))
plot_lc8 <- merge(plot_lc8, names8)

plot_lc9_1 <- readRDS("Robjects1020km/plot_lc9_1.RDS")
plot_lc9_2 <- readRDS("Robjects1020km/plot_lc9_2.RDS")
plot_lc9_3 <- readRDS("Robjects1020km/plot_lc9_3.RDS")
plot_lc9_4 <- readRDS("Robjects1020km/plot_lc9_4.RDS")
plot_lc9_5 <- readRDS("Robjects1020km/plot_lc9_5.RDS")

names(plot_lc9_1) <- buffers1
names(plot_lc9_2) <- buffers2
names(plot_lc9_3) <- buffers3
names(plot_lc9_4) <- buffers4
names(plot_lc9_5) <- buffers5

plot_lc9_1  <- lapply(plot_lc9_1, as.data.frame)
plot_lc9_2  <- lapply(plot_lc9_2, as.data.frame)
plot_lc9_3  <- lapply(plot_lc9_3, as.data.frame)
plot_lc9_4  <- lapply(plot_lc9_4, as.data.frame)
plot_lc9_5  <- lapply(plot_lc9_5, as.data.frame)

plot_lc9_1 <- plot_lc9_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc9_1 <- plot_lc9_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc9_2 <- plot_lc9_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc9_2 <- plot_lc9_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc9_3 <- plot_lc9_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc9_3 <- plot_lc9_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc9_4 <- plot_lc9_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc9_4 <- plot_lc9_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc9_5 <- plot_lc9_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc9_5 <- plot_lc9_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc9 <- rbind(plot_lc9_1, plot_lc9_2, plot_lc9_3, plot_lc9_4, plot_lc9_5)
rm(plot_lc9_1, plot_lc9_2, plot_lc9_3, plot_lc9_4, plot_lc9_5)
names9 <- data.frame(Plot = as.character(all_centroids9$Plot), ID = 1:length(all_centroids9$Plot))
plot_lc9 <- merge(plot_lc9, names9)

#memory limit - group togther, process, delete

prop_lc7_9 <- rbind(plot_lc7, plot_lc8, plot_lc9)
saveRDS(prop_lc7_9, "Robjects1020km/prop_lc7_9.RDS")
rm(plot_lc7, plot_lc8, plot_lc9)
rm(prop_lc7_9)



plot_lc10_1 <- readRDS("Robjects1020km/plot_lc10_1.RDS")
plot_lc10_2 <- readRDS("Robjects1020km/plot_lc10_2.RDS")
plot_lc10_3 <- readRDS("Robjects1020km/plot_lc10_3.RDS")
plot_lc10_4 <- readRDS("Robjects1020km/plot_lc10_4.RDS")
plot_lc10_5 <- readRDS("Robjects1020km/plot_lc10_5.RDS")

names(plot_lc10_1) <- buffers1
names(plot_lc10_2) <- buffers2
names(plot_lc10_3) <- buffers3
names(plot_lc10_4) <- buffers4
names(plot_lc10_5) <- buffers5

plot_lc10_1  <- lapply(plot_lc10_1, as.data.frame)
plot_lc10_2  <- lapply(plot_lc10_2, as.data.frame)
plot_lc10_3  <- lapply(plot_lc10_3, as.data.frame)
plot_lc10_4  <- lapply(plot_lc10_4, as.data.frame)
plot_lc10_5  <- lapply(plot_lc10_5, as.data.frame)

plot_lc10_1 <- plot_lc10_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc10_1 <- plot_lc10_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc10_2 <- plot_lc10_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc10_2 <- plot_lc10_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc10_3 <- plot_lc10_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc10_3 <- plot_lc10_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc10_4 <- plot_lc10_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc10_4 <- plot_lc10_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc10_5 <- plot_lc10_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc10_5 <- plot_lc10_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc10 <- rbind(plot_lc10_1, plot_lc10_2, plot_lc10_3, plot_lc10_4, plot_lc10_5)
rm(plot_lc10_1, plot_lc10_2, plot_lc10_3, plot_lc10_4, plot_lc10_5)
names10 <- data.frame(Plot = as.character(all_centroids10$Plot), ID = 1:length(all_centroids10$Plot))
plot_lc10 <- merge(plot_lc10, names10)

plot_lc11_1 <- readRDS("Robjects1020km/plot_lc11_1.RDS")
plot_lc11_2 <- readRDS("Robjects1020km/plot_lc11_2.RDS")
plot_lc11_3 <- readRDS("Robjects1020km/plot_lc11_3.RDS")
plot_lc11_4 <- readRDS("Robjects1020km/plot_lc11_4.RDS")
plot_lc11_5 <- readRDS("Robjects1020km/plot_lc11_5.RDS")

names(plot_lc11_1) <- buffers1
names(plot_lc11_2) <- buffers2
names(plot_lc11_3) <- buffers3
names(plot_lc11_4) <- buffers4
names(plot_lc11_5) <- buffers5

plot_lc11_1  <- lapply(plot_lc11_1, as.data.frame)
plot_lc11_2  <- lapply(plot_lc11_2, as.data.frame)
plot_lc11_3  <- lapply(plot_lc11_3, as.data.frame)
plot_lc11_4  <- lapply(plot_lc11_4, as.data.frame)
plot_lc11_5  <- lapply(plot_lc11_5, as.data.frame)

plot_lc11_1 <- plot_lc11_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc11_1 <- plot_lc11_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc11_2 <- plot_lc11_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc11_2 <- plot_lc11_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc11_3 <- plot_lc11_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc11_3 <- plot_lc11_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc11_4 <- plot_lc11_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc11_4 <- plot_lc11_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc11_5 <- plot_lc11_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc11_5 <- plot_lc11_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc11 <- rbind(plot_lc11_1, plot_lc11_2, plot_lc11_3, plot_lc11_4, plot_lc11_5)
rm(plot_lc11_1, plot_lc11_2, plot_lc11_3, plot_lc11_4, plot_lc11_5)
names11 <- data.frame(Plot = as.character(all_centroids11$Plot), ID = 1:length(all_centroids11$Plot))
plot_lc11 <- merge(plot_lc11, names11)

plot_lc12_1 <- readRDS("Robjects1020km/plot_lc12_1.RDS")
plot_lc12_2 <- readRDS("Robjects1020km/plot_lc12_2.RDS")
plot_lc12_3 <- readRDS("Robjects1020km/plot_lc12_3.RDS")
plot_lc12_4 <- readRDS("Robjects1020km/plot_lc12_4.RDS")
plot_lc12_5 <- readRDS("Robjects1020km/plot_lc12_5.RDS")

names(plot_lc12_1) <- buffers1
names(plot_lc12_2) <- buffers2
names(plot_lc12_3) <- buffers3
names(plot_lc12_4) <- buffers4
names(plot_lc12_5) <- buffers5

plot_lc12_1  <- lapply(plot_lc12_1, as.data.frame)
plot_lc12_2  <- lapply(plot_lc12_2, as.data.frame)
plot_lc12_3  <- lapply(plot_lc12_3, as.data.frame)
plot_lc12_4  <- lapply(plot_lc12_4, as.data.frame)
plot_lc12_5  <- lapply(plot_lc12_5, as.data.frame)

plot_lc12_1 <- plot_lc12_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc12_1 <- plot_lc12_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc12_2 <- plot_lc12_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc12_2 <- plot_lc12_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc12_3 <- plot_lc12_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc12_3 <- plot_lc12_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc12_4 <- plot_lc12_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc12_4 <- plot_lc12_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc12_5 <- plot_lc12_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc12_5 <- plot_lc12_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc12 <- rbind(plot_lc12_1, plot_lc12_2, plot_lc12_3, plot_lc12_4, plot_lc12_5)
rm(plot_lc12_1, plot_lc12_2, plot_lc12_3, plot_lc12_4, plot_lc12_5)
names12 <- data.frame(Plot = as.character(all_centroids12$Plot), ID = 1:length(all_centroids12$Plot))
plot_lc12 <- merge(plot_lc12, names12)

#memory limit - group togther, process, delete

prop_lc10_12 <- rbind(plot_lc10, plot_lc11, plot_lc12)
saveRDS(prop_lc10_12, "Robjects1020km/prop_lc10_12.RDS")
rm(plot_lc10, plot_lc11, plot_lc12)
rm(prop_lc10_12)








plot_lc13_1 <- readRDS("Robjects1020km/plot_lc13_1.RDS")
plot_lc13_2 <- readRDS("Robjects1020km/plot_lc13_2.RDS")
plot_lc13_3 <- readRDS("Robjects1020km/plot_lc13_3.RDS")
plot_lc13_4 <- readRDS("Robjects1020km/plot_lc13_4.RDS")
plot_lc13_5 <- readRDS("Robjects1020km/plot_lc13_5.RDS")

names(plot_lc13_1) <- buffers1
names(plot_lc13_2) <- buffers2
names(plot_lc13_3) <- buffers3
names(plot_lc13_4) <- buffers4
names(plot_lc13_5) <- buffers5

plot_lc13_1  <- lapply(plot_lc13_1, as.data.frame)
plot_lc13_2  <- lapply(plot_lc13_2, as.data.frame)
plot_lc13_3  <- lapply(plot_lc13_3, as.data.frame)
plot_lc13_4  <- lapply(plot_lc13_4, as.data.frame)
plot_lc13_5  <- lapply(plot_lc13_5, as.data.frame)

plot_lc13_1 <- plot_lc13_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc13_1 <- plot_lc13_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc13_2 <- plot_lc13_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc13_2 <- plot_lc13_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc13_3 <- plot_lc13_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc13_3 <- plot_lc13_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc13_4 <- plot_lc13_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc13_4 <- plot_lc13_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc13_5 <- plot_lc13_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc13_5 <- plot_lc13_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc13 <- rbind(plot_lc13_1, plot_lc13_2, plot_lc13_3, plot_lc13_4, plot_lc13_5)
rm(plot_lc13_1, plot_lc13_2, plot_lc13_3, plot_lc13_4, plot_lc13_5)
names13 <- data.frame(Plot = as.character(all_centroids13$Plot), ID = 1:length(all_centroids13$Plot))
plot_lc13 <- merge(plot_lc13, names13)

plot_lc14_1 <- readRDS("Robjects1020km/plot_lc14_1.RDS")
plot_lc14_2 <- readRDS("Robjects1020km/plot_lc14_2.RDS")
plot_lc14_3 <- readRDS("Robjects1020km/plot_lc14_3.RDS")
plot_lc14_4 <- readRDS("Robjects1020km/plot_lc14_4.RDS")
plot_lc14_5 <- readRDS("Robjects1020km/plot_lc14_5.RDS")

names(plot_lc14_1) <- buffers1
names(plot_lc14_2) <- buffers2
names(plot_lc14_3) <- buffers3
names(plot_lc14_4) <- buffers4
names(plot_lc14_5) <- buffers5

plot_lc14_1  <- lapply(plot_lc14_1, as.data.frame)
plot_lc14_2  <- lapply(plot_lc14_2, as.data.frame)
plot_lc14_3  <- lapply(plot_lc14_3, as.data.frame)
plot_lc14_4  <- lapply(plot_lc14_4, as.data.frame)
plot_lc14_5  <- lapply(plot_lc14_5, as.data.frame)

plot_lc14_1 <- plot_lc14_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc14_1 <- plot_lc14_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc14_2 <- plot_lc14_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc14_2 <- plot_lc14_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc14_3 <- plot_lc14_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc14_3 <- plot_lc14_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc14_4 <- plot_lc14_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc14_4 <- plot_lc14_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc14_5 <- plot_lc14_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc14_5 <- plot_lc14_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc14 <- rbind(plot_lc14_1, plot_lc14_2, plot_lc14_3, plot_lc14_4, plot_lc14_5)
rm(plot_lc14_1, plot_lc14_2, plot_lc14_3, plot_lc14_4, plot_lc14_5)
names14 <- data.frame(Plot = as.character(all_centroids14$Plot), ID = 1:length(all_centroids14$Plot))
plot_lc14 <- merge(plot_lc14, names14)

plot_lc15_1 <- readRDS("Robjects1020km/plot_lc15_1.RDS")
plot_lc15_2 <- readRDS("Robjects1020km/plot_lc15_2.RDS")
plot_lc15_3 <- readRDS("Robjects1020km/plot_lc15_3.RDS")
plot_lc15_4 <- readRDS("Robjects1020km/plot_lc15_4.RDS")
plot_lc15_5 <- readRDS("Robjects1020km/plot_lc15_5.RDS")

names(plot_lc15_1) <- buffers1
names(plot_lc15_2) <- buffers2
names(plot_lc15_3) <- buffers3
names(plot_lc15_4) <- buffers4
names(plot_lc15_5) <- buffers5

plot_lc15_1  <- lapply(plot_lc15_1, as.data.frame)
plot_lc15_2  <- lapply(plot_lc15_2, as.data.frame)
plot_lc15_3  <- lapply(plot_lc15_3, as.data.frame)
plot_lc15_4  <- lapply(plot_lc15_4, as.data.frame)
plot_lc15_5  <- lapply(plot_lc15_5, as.data.frame)

plot_lc15_1 <- plot_lc15_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc15_1 <- plot_lc15_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc15_2 <- plot_lc15_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc15_2 <- plot_lc15_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc15_3 <- plot_lc15_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc15_3 <- plot_lc15_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc15_4 <- plot_lc15_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc15_4 <- plot_lc15_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc15_5 <- plot_lc15_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc15_5 <- plot_lc15_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc15 <- rbind(plot_lc15_1, plot_lc15_2, plot_lc15_3, plot_lc15_4, plot_lc15_5)
rm(plot_lc15_1, plot_lc15_2, plot_lc15_3, plot_lc15_4, plot_lc15_5)
names15 <- data.frame(Plot = as.character(all_centroids15$Plot), ID = 1:length(all_centroids15$Plot))
plot_lc15 <- merge(plot_lc15, names15)

#memory limit - group togther, process, delete

prop_lc13_15 <- rbind(plot_lc13, plot_lc14, plot_lc15)
saveRDS(prop_lc13_15, "Robjects1020km/prop_lc13_15.RDS")
rm(plot_lc13, plot_lc14, plot_lc15)
rm(prop_lc13_15)



plot_lc16_1 <- readRDS("Robjects1020km/plot_lc16_1.RDS")
plot_lc16_2 <- readRDS("Robjects1020km/plot_lc16_2.RDS")
plot_lc16_3 <- readRDS("Robjects1020km/plot_lc16_3.RDS")
plot_lc16_4 <- readRDS("Robjects1020km/plot_lc16_4.RDS")
plot_lc16_5 <- readRDS("Robjects1020km/plot_lc16_5.RDS")

names(plot_lc16_1) <- buffers1
names(plot_lc16_2) <- buffers2
names(plot_lc16_3) <- buffers3
names(plot_lc16_4) <- buffers4
names(plot_lc16_5) <- buffers5

plot_lc16_1  <- lapply(plot_lc16_1, as.data.frame)
plot_lc16_2  <- lapply(plot_lc16_2, as.data.frame)
plot_lc16_3  <- lapply(plot_lc16_3, as.data.frame)
plot_lc16_4  <- lapply(plot_lc16_4, as.data.frame)
plot_lc16_5  <- lapply(plot_lc16_5, as.data.frame)

plot_lc16_1 <- plot_lc16_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc16_1 <- plot_lc16_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc16_2 <- plot_lc16_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc16_2 <- plot_lc16_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc16_3 <- plot_lc16_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc16_3 <- plot_lc16_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc16_4 <- plot_lc16_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc16_4 <- plot_lc16_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc16_5 <- plot_lc16_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc16_5 <- plot_lc16_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc16 <- rbind(plot_lc16_1, plot_lc16_2, plot_lc16_3, plot_lc16_4, plot_lc16_5)
rm(plot_lc16_1, plot_lc16_2, plot_lc16_3, plot_lc16_4, plot_lc16_5)
names16 <- data.frame(Plot = as.character(all_centroids16$Plot), ID = 1:length(all_centroids16$Plot))
plot_lc16 <- merge(plot_lc16, names16)







plot_lc17_1 <- readRDS("Robjects1020km/plot_lc17_1.RDS")
plot_lc17_2 <- readRDS("Robjects1020km/plot_lc17_2.RDS")
plot_lc17_3 <- readRDS("Robjects1020km/plot_lc17_3.RDS")
plot_lc17_4 <- readRDS("Robjects1020km/plot_lc17_4.RDS")
plot_lc17_5 <- readRDS("Robjects1020km/plot_lc17_5.RDS")

names(plot_lc17_1) <- buffers1
names(plot_lc17_2) <- buffers2
names(plot_lc17_3) <- buffers3
names(plot_lc17_4) <- buffers4
names(plot_lc17_5) <- buffers5

plot_lc17_1  <- lapply(plot_lc17_1, as.data.frame)
plot_lc17_2  <- lapply(plot_lc17_2, as.data.frame)
plot_lc17_3  <- lapply(plot_lc17_3, as.data.frame)
plot_lc17_4  <- lapply(plot_lc17_4, as.data.frame)
plot_lc17_5  <- lapply(plot_lc17_5, as.data.frame)

plot_lc17_1 <- plot_lc17_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc17_1 <- plot_lc17_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc17_2 <- plot_lc17_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc17_2 <- plot_lc17_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc17_3 <- plot_lc17_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc17_3 <- plot_lc17_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc17_4 <- plot_lc17_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc17_4 <- plot_lc17_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc17_5 <- plot_lc17_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc17_5 <- plot_lc17_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc17 <- rbind(plot_lc17_1, plot_lc17_2, plot_lc17_3, plot_lc17_4, plot_lc17_5)
rm(plot_lc17_1, plot_lc17_2, plot_lc17_3, plot_lc17_4, plot_lc17_5)
names17 <- data.frame(Plot = as.character(all_centroids17$Plot), ID = 1:length(all_centroids17$Plot))
plot_lc17 <- merge(plot_lc17, names17)

plot_lc18_1 <- readRDS("Robjects1020km/plot_lc18_1.RDS")
plot_lc18_2 <- readRDS("Robjects1020km/plot_lc18_2.RDS")
plot_lc18_3 <- readRDS("Robjects1020km/plot_lc18_3.RDS")
plot_lc18_4 <- readRDS("Robjects1020km/plot_lc18_4.RDS")
plot_lc18_5 <- readRDS("Robjects1020km/plot_lc18_5.RDS")

names(plot_lc18_1) <- buffers1
names(plot_lc18_2) <- buffers2
names(plot_lc18_3) <- buffers3
names(plot_lc18_4) <- buffers4
names(plot_lc18_5) <- buffers5

plot_lc18_1  <- lapply(plot_lc18_1, as.data.frame)
plot_lc18_2  <- lapply(plot_lc18_2, as.data.frame)
plot_lc18_3  <- lapply(plot_lc18_3, as.data.frame)
plot_lc18_4  <- lapply(plot_lc18_4, as.data.frame)
plot_lc18_5  <- lapply(plot_lc18_5, as.data.frame)

plot_lc18_1 <- plot_lc18_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc18_1 <- plot_lc18_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc18_2 <- plot_lc18_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc18_2 <- plot_lc18_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc18_3 <- plot_lc18_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc18_3 <- plot_lc18_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc18_4 <- plot_lc18_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc18_4 <- plot_lc18_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc18_5 <- plot_lc18_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc18_5 <- plot_lc18_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc18 <- rbind(plot_lc18_1, plot_lc18_2, plot_lc18_3, plot_lc18_4, plot_lc18_5)
rm(plot_lc18_1, plot_lc18_2, plot_lc18_3, plot_lc18_4, plot_lc18_5)
names18 <- data.frame(Plot = as.character(all_centroids18$Plot), ID = 1:length(all_centroids18$Plot))
plot_lc18 <- merge(plot_lc18, names18)



#memory limit - group togther, process, delete

prop_lc16_18 <- rbind(plot_lc16, plot_lc17, plot_lc18)
saveRDS(prop_lc16_18, "Robjects1020km/prop_lc16_18.RDS")
rm(plot_lc16, plot_lc17, plot_lc18)
rm(prop_lc16_18)







plot_lc19_1 <- readRDS("Robjects1020km/plot_lc19_1.RDS")
plot_lc19_2 <- readRDS("Robjects1020km/plot_lc19_2.RDS")
plot_lc19_3 <- readRDS("Robjects1020km/plot_lc19_3.RDS")
plot_lc19_4 <- readRDS("Robjects1020km/plot_lc19_4.RDS")
plot_lc19_5 <- readRDS("Robjects1020km/plot_lc19_5.RDS")

names(plot_lc19_1) <- buffers1
names(plot_lc19_2) <- buffers2
names(plot_lc19_3) <- buffers3
names(plot_lc19_4) <- buffers4
names(plot_lc19_5) <- buffers5

plot_lc19_1  <- lapply(plot_lc19_1, as.data.frame)
plot_lc19_2  <- lapply(plot_lc19_2, as.data.frame)
plot_lc19_3  <- lapply(plot_lc19_3, as.data.frame)
plot_lc19_4  <- lapply(plot_lc19_4, as.data.frame)
plot_lc19_5  <- lapply(plot_lc19_5, as.data.frame)

plot_lc19_1 <- plot_lc19_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc19_1 <- plot_lc19_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc19_2 <- plot_lc19_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc19_2 <- plot_lc19_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc19_3 <- plot_lc19_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc19_3 <- plot_lc19_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc19_4 <- plot_lc19_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc19_4 <- plot_lc19_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc19_5 <- plot_lc19_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc19_5 <- plot_lc19_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc19 <- rbind(plot_lc19_1, plot_lc19_2, plot_lc19_3, plot_lc19_4, plot_lc19_5)
rm(plot_lc19_1, plot_lc19_2, plot_lc19_3, plot_lc19_4, plot_lc19_5)
names19 <- data.frame(Plot = as.character(all_centroids19$Plot), ID = 1:length(all_centroids19$Plot))
plot_lc19 <- merge(plot_lc19, names19)

plot_lc20_1 <- readRDS("Robjects1020km/plot_lc20_1.RDS")
plot_lc20_2 <- readRDS("Robjects1020km/plot_lc20_2.RDS")
plot_lc20_3 <- readRDS("Robjects1020km/plot_lc20_3.RDS")
plot_lc20_4 <- readRDS("Robjects1020km/plot_lc20_4.RDS")
plot_lc20_5 <- readRDS("Robjects1020km/plot_lc20_5.RDS")

names(plot_lc20_1) <- buffers1
names(plot_lc20_2) <- buffers2
names(plot_lc20_3) <- buffers3
names(plot_lc20_4) <- buffers4
names(plot_lc20_5) <- buffers5

plot_lc20_1  <- lapply(plot_lc20_1, as.data.frame)
plot_lc20_2  <- lapply(plot_lc20_2, as.data.frame)
plot_lc20_3  <- lapply(plot_lc20_3, as.data.frame)
plot_lc20_4  <- lapply(plot_lc20_4, as.data.frame)
plot_lc20_5  <- lapply(plot_lc20_5, as.data.frame)

plot_lc20_1 <- plot_lc20_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc20_1 <- plot_lc20_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc20_2 <- plot_lc20_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc20_2 <- plot_lc20_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc20_3 <- plot_lc20_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc20_3 <- plot_lc20_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc20_4 <- plot_lc20_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc20_4 <- plot_lc20_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc20_5 <- plot_lc20_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc20_5 <- plot_lc20_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc20 <- rbind(plot_lc20_1, plot_lc20_2, plot_lc20_3, plot_lc20_4, plot_lc20_5)
rm(plot_lc20_1, plot_lc20_2, plot_lc20_3, plot_lc20_4, plot_lc20_5)
names20 <- data.frame(Plot = as.character(all_centroids20$Plot), ID = 1:length(all_centroids20$Plot))
plot_lc20 <- merge(plot_lc20, names20)

plot_lc21_1 <- readRDS("Robjects1020km/plot_lc21_1.RDS")
plot_lc21_2 <- readRDS("Robjects1020km/plot_lc21_2.RDS")
plot_lc21_3 <- readRDS("Robjects1020km/plot_lc21_3.RDS")
plot_lc21_4 <- readRDS("Robjects1020km/plot_lc21_4.RDS")
plot_lc21_5 <- readRDS("Robjects1020km/plot_lc21_5.RDS")

names(plot_lc21_1) <- buffers1
names(plot_lc21_2) <- buffers2
names(plot_lc21_3) <- buffers3
names(plot_lc21_4) <- buffers4
names(plot_lc21_5) <- buffers5

plot_lc21_1  <- lapply(plot_lc21_1, as.data.frame)
plot_lc21_2  <- lapply(plot_lc21_2, as.data.frame)
plot_lc21_3  <- lapply(plot_lc21_3, as.data.frame)
plot_lc21_4  <- lapply(plot_lc21_4, as.data.frame)
plot_lc21_5  <- lapply(plot_lc21_5, as.data.frame)

plot_lc21_1 <- plot_lc21_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc21_1 <- plot_lc21_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc21_2 <- plot_lc21_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc21_2 <- plot_lc21_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc21_3 <- plot_lc21_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc21_3 <- plot_lc21_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc21_4 <- plot_lc21_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc21_4 <- plot_lc21_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc21_5 <- plot_lc21_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc21_5 <- plot_lc21_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc21 <- rbind(plot_lc21_1, plot_lc21_2, plot_lc21_3, plot_lc21_4, plot_lc21_5)
rm(plot_lc21_1, plot_lc21_2, plot_lc21_3, plot_lc21_4, plot_lc21_5)
names21 <- data.frame(Plot = as.character(all_centroids21$Plot), ID = 1:length(all_centroids21$Plot))
plot_lc21 <- merge(plot_lc21, names21)


#memory limit - group togther, process, delete

prop_lc19_21 <- rbind(plot_lc19, plot_lc20, plot_lc21)
saveRDS(prop_lc19_21, "Robjects1020km/prop_lc19_21.RDS")
rm(plot_lc19, plot_lc20, plot_lc21)
rm(prop_lc19_21)







plot_lc22_1 <- readRDS("Robjects1020km/plot_lc22_1.RDS")
plot_lc22_2 <- readRDS("Robjects1020km/plot_lc22_2.RDS")
plot_lc22_3 <- readRDS("Robjects1020km/plot_lc22_3.RDS")
plot_lc22_4 <- readRDS("Robjects1020km/plot_lc22_4.RDS")
plot_lc22_5 <- readRDS("Robjects1020km/plot_lc22_5.RDS")

names(plot_lc22_1) <- buffers1
names(plot_lc22_2) <- buffers2
names(plot_lc22_3) <- buffers3
names(plot_lc22_4) <- buffers4
names(plot_lc22_5) <- buffers5

plot_lc22_1  <- lapply(plot_lc22_1, as.data.frame)
plot_lc22_2  <- lapply(plot_lc22_2, as.data.frame)
plot_lc22_3  <- lapply(plot_lc22_3, as.data.frame)
plot_lc22_4  <- lapply(plot_lc22_4, as.data.frame)
plot_lc22_5  <- lapply(plot_lc22_5, as.data.frame)

plot_lc22_1 <- plot_lc22_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc22_1 <- plot_lc22_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc22_2 <- plot_lc22_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc22_2 <- plot_lc22_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc22_3 <- plot_lc22_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc22_3 <- plot_lc22_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc22_4 <- plot_lc22_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc22_4 <- plot_lc22_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc22_5 <- plot_lc22_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc22_5 <- plot_lc22_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc22 <- rbind(plot_lc22_1, plot_lc22_2, plot_lc22_3, plot_lc22_4, plot_lc22_5)
rm(plot_lc22_1, plot_lc22_2, plot_lc22_3, plot_lc22_4, plot_lc22_5)
names22 <- data.frame(Plot = as.character(all_centroids22$Plot), ID = 1:length(all_centroids22$Plot))
plot_lc22 <- merge(plot_lc22, names22)

plot_lc23_1 <- readRDS("Robjects1020km/plot_lc23_1.RDS")
plot_lc23_2 <- readRDS("Robjects1020km/plot_lc23_2.RDS")
plot_lc23_3 <- readRDS("Robjects1020km/plot_lc23_3.RDS")
plot_lc23_4 <- readRDS("Robjects1020km/plot_lc23_4.RDS")
plot_lc23_5 <- readRDS("Robjects1020km/plot_lc23_5.RDS")

names(plot_lc23_1) <- buffers1
names(plot_lc23_2) <- buffers2
names(plot_lc23_3) <- buffers3
names(plot_lc23_4) <- buffers4
names(plot_lc23_5) <- buffers5

plot_lc23_1  <- lapply(plot_lc23_1, as.data.frame)
plot_lc23_2  <- lapply(plot_lc23_2, as.data.frame)
plot_lc23_3  <- lapply(plot_lc23_3, as.data.frame)
plot_lc23_4  <- lapply(plot_lc23_4, as.data.frame)
plot_lc23_5  <- lapply(plot_lc23_5, as.data.frame)

plot_lc23_1 <- plot_lc23_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc23_1 <- plot_lc23_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc23_2 <- plot_lc23_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc23_2 <- plot_lc23_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc23_3 <- plot_lc23_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc23_3 <- plot_lc23_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc23_4 <- plot_lc23_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc23_4 <- plot_lc23_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc23_5 <- plot_lc23_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc23_5 <- plot_lc23_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc23 <- rbind(plot_lc23_1, plot_lc23_2, plot_lc23_3, plot_lc23_4, plot_lc23_5)
rm(plot_lc23_1, plot_lc23_2, plot_lc23_3, plot_lc23_4, plot_lc23_5)
names23 <- data.frame(Plot = as.character(all_centroids23$Plot), ID = 1:length(all_centroids23$Plot))
plot_lc23 <- merge(plot_lc23, names23)

plot_lc24_1 <- readRDS("Robjects1020km/plot_lc24_1.RDS")
plot_lc24_2 <- readRDS("Robjects1020km/plot_lc24_2.RDS")
plot_lc24_3 <- readRDS("Robjects1020km/plot_lc24_3.RDS")
plot_lc24_4 <- readRDS("Robjects1020km/plot_lc24_4.RDS")
plot_lc24_5 <- readRDS("Robjects1020km/plot_lc24_5.RDS")

names(plot_lc24_1) <- buffers1
names(plot_lc24_2) <- buffers2
names(plot_lc24_3) <- buffers3
names(plot_lc24_4) <- buffers4
names(plot_lc24_5) <- buffers5

plot_lc24_1  <- lapply(plot_lc24_1, as.data.frame)
plot_lc24_2  <- lapply(plot_lc24_2, as.data.frame)
plot_lc24_3  <- lapply(plot_lc24_3, as.data.frame)
plot_lc24_4  <- lapply(plot_lc24_4, as.data.frame)
plot_lc24_5  <- lapply(plot_lc24_5, as.data.frame)

plot_lc24_1 <- plot_lc24_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc24_1 <- plot_lc24_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc24_2 <- plot_lc24_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc24_2 <- plot_lc24_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc24_3 <- plot_lc24_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc24_3 <- plot_lc24_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc24_4 <- plot_lc24_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc24_4 <- plot_lc24_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc24_5 <- plot_lc24_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc24_5 <- plot_lc24_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc24 <- rbind(plot_lc24_1, plot_lc24_2, plot_lc24_3, plot_lc24_4, plot_lc24_5)
rm(plot_lc24_1, plot_lc24_2, plot_lc24_3, plot_lc24_4, plot_lc24_5)
names24 <- data.frame(Plot = as.character(all_centroids24$Plot), ID = 1:length(all_centroids24$Plot))
plot_lc24 <- merge(plot_lc24, names24)

#memory limit - group togther, process, delete

prop_lc22_24 <- rbind(plot_lc22, plot_lc23, plot_lc24)
saveRDS(prop_lc22_24, "Robjects1020km/prop_lc22_24.RDS")
rm(plot_lc22, plot_lc23, plot_lc24)
rm(prop_lc22_24)



plot_lc25_1 <- readRDS("Robjects1020km/plot_lc25_1.RDS")
plot_lc25_2 <- readRDS("Robjects1020km/plot_lc25_2.RDS")
plot_lc25_3 <- readRDS("Robjects1020km/plot_lc25_3.RDS")
plot_lc25_4 <- readRDS("Robjects1020km/plot_lc25_4.RDS")
plot_lc25_5 <- readRDS("Robjects1020km/plot_lc25_5.RDS")

names(plot_lc25_1) <- buffers1
names(plot_lc25_2) <- buffers2
names(plot_lc25_3) <- buffers3
names(plot_lc25_4) <- buffers4
names(plot_lc25_5) <- buffers5

plot_lc25_1  <- lapply(plot_lc25_1, as.data.frame)
plot_lc25_2  <- lapply(plot_lc25_2, as.data.frame)
plot_lc25_3  <- lapply(plot_lc25_3, as.data.frame)
plot_lc25_4  <- lapply(plot_lc25_4, as.data.frame)
plot_lc25_5  <- lapply(plot_lc25_5, as.data.frame)

plot_lc25_1 <- plot_lc25_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc25_1 <- plot_lc25_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc25_2 <- plot_lc25_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc25_2 <- plot_lc25_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc25_3 <- plot_lc25_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc25_3 <- plot_lc25_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc25_4 <- plot_lc25_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc25_4 <- plot_lc25_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc25_5 <- plot_lc25_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc25_5 <- plot_lc25_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc25 <- rbind(plot_lc25_1, plot_lc25_2, plot_lc25_3, plot_lc25_4, plot_lc25_5)
rm(plot_lc25_1, plot_lc25_2, plot_lc25_3, plot_lc25_4, plot_lc25_5)
names25 <- data.frame(Plot = as.character(all_centroids25$Plot), ID = 1:length(all_centroids25$Plot))
plot_lc25 <- merge(plot_lc25, names25)

plot_lc26_1 <- readRDS("Robjects1020km/plot_lc26_1.RDS")
plot_lc26_2 <- readRDS("Robjects1020km/plot_lc26_2.RDS")
plot_lc26_3 <- readRDS("Robjects1020km/plot_lc26_3.RDS")
plot_lc26_4 <- readRDS("Robjects1020km/plot_lc26_4.RDS")
plot_lc26_5 <- readRDS("Robjects1020km/plot_lc26_5.RDS")

names(plot_lc26_1) <- buffers1
names(plot_lc26_2) <- buffers2
names(plot_lc26_3) <- buffers3
names(plot_lc26_4) <- buffers4
names(plot_lc26_5) <- buffers5

plot_lc26_1  <- lapply(plot_lc26_1, as.data.frame)
plot_lc26_2  <- lapply(plot_lc26_2, as.data.frame)
plot_lc26_3  <- lapply(plot_lc26_3, as.data.frame)
plot_lc26_4  <- lapply(plot_lc26_4, as.data.frame)
plot_lc26_5  <- lapply(plot_lc26_5, as.data.frame)

plot_lc26_1 <- plot_lc26_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc26_1 <- plot_lc26_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc26_2 <- plot_lc26_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc26_2 <- plot_lc26_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc26_3 <- plot_lc26_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc26_3 <- plot_lc26_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc26_4 <- plot_lc26_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc26_4 <- plot_lc26_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc26_5 <- plot_lc26_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc26_5 <- plot_lc26_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc26 <- rbind(plot_lc26_1, plot_lc26_2, plot_lc26_3, plot_lc26_4, plot_lc26_5)
rm(plot_lc26_1, plot_lc26_2, plot_lc26_3, plot_lc26_4, plot_lc26_5)
names26 <- data.frame(Plot = as.character(all_centroids26$Plot), ID = 1:length(all_centroids26$Plot))
plot_lc26 <- merge(plot_lc26, names26)



plot_lc27_1 <- readRDS("Robjects1020km/plot_lc27_1.RDS")
plot_lc27_2 <- readRDS("Robjects1020km/plot_lc27_2.RDS")
plot_lc27_3 <- readRDS("Robjects1020km/plot_lc27_3.RDS")
plot_lc27_4 <- readRDS("Robjects1020km/plot_lc27_4.RDS")
plot_lc27_5 <- readRDS("Robjects1020km/plot_lc27_5.RDS")

names(plot_lc27_1) <- buffers1
names(plot_lc27_2) <- buffers2
names(plot_lc27_3) <- buffers3
names(plot_lc27_4) <- buffers4
names(plot_lc27_5) <- buffers5

plot_lc27_1  <- lapply(plot_lc27_1, as.data.frame)
plot_lc27_2  <- lapply(plot_lc27_2, as.data.frame)
plot_lc27_3  <- lapply(plot_lc27_3, as.data.frame)
plot_lc27_4  <- lapply(plot_lc27_4, as.data.frame)
plot_lc27_5  <- lapply(plot_lc27_5, as.data.frame)

plot_lc27_1 <- plot_lc27_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc27_1 <- plot_lc27_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc27_2 <- plot_lc27_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc27_2 <- plot_lc27_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc27_3 <- plot_lc27_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc27_3 <- plot_lc27_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc27_4 <- plot_lc27_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc27_4 <- plot_lc27_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc27_5 <- plot_lc27_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc27_5 <- plot_lc27_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc27 <- rbind(plot_lc27_1, plot_lc27_2, plot_lc27_3, plot_lc27_4, plot_lc27_5)
rm(plot_lc27_1, plot_lc27_2, plot_lc27_3, plot_lc27_4, plot_lc27_5)
names27 <- data.frame(Plot = as.character(all_centroids27$Plot), ID = 1:length(all_centroids27$Plot))
plot_lc27 <- merge(plot_lc27, names27)



#memory limit - group togther, process, delete

prop_lc25_27 <- rbind(plot_lc25, plot_lc26, plot_lc27)
saveRDS(prop_lc25_27, "Robjects1020km/prop_lc25_27.RDS")
rm(plot_lc25, plot_lc26,  plot_lc27)
rm(prop_lc25_27)




plot_lc28_1 <- readRDS("Robjects1020km/plot_lc28_1.RDS")
plot_lc28_2 <- readRDS("Robjects1020km/plot_lc28_2.RDS")
plot_lc28_3 <- readRDS("Robjects1020km/plot_lc28_3.RDS")
plot_lc28_4 <- readRDS("Robjects1020km/plot_lc28_4.RDS")
plot_lc28_5 <- readRDS("Robjects1020km/plot_lc28_5.RDS")

names(plot_lc28_1) <- buffers1
names(plot_lc28_2) <- buffers2
names(plot_lc28_3) <- buffers3
names(plot_lc28_4) <- buffers4
names(plot_lc28_5) <- buffers5

plot_lc28_1  <- lapply(plot_lc28_1, as.data.frame)
plot_lc28_2  <- lapply(plot_lc28_2, as.data.frame)
plot_lc28_3  <- lapply(plot_lc28_3, as.data.frame)
plot_lc28_4  <- lapply(plot_lc28_4, as.data.frame)
plot_lc28_5  <- lapply(plot_lc28_5, as.data.frame)

plot_lc28_1 <- plot_lc28_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc28_1 <- plot_lc28_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc28_2 <- plot_lc28_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc28_2 <- plot_lc28_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc28_3 <- plot_lc28_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc28_3 <- plot_lc28_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc28_4 <- plot_lc28_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc28_4 <- plot_lc28_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  

plot_lc28_5 <- plot_lc28_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc28_5 <- plot_lc28_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())
  


plot_lc28 <- rbind(plot_lc28_1, plot_lc28_2, plot_lc28_3, plot_lc28_4, plot_lc28_5)
rm(plot_lc28_1, plot_lc28_2, plot_lc28_3, plot_lc28_4, plot_lc28_5)
names28 <- data.frame(Plot = as.character(all_centroids28$Plot), ID = 1:length(all_centroids28$Plot))
plot_lc28 <- merge(plot_lc28, names28)



plot_lc29_1 <- readRDS("Robjects1020km/plot_lc29_1.RDS")
plot_lc29_2 <- readRDS("Robjects1020km/plot_lc29_2.RDS")
plot_lc29_3 <- readRDS("Robjects1020km/plot_lc29_3.RDS")
plot_lc29_4 <- readRDS("Robjects1020km/plot_lc29_4.RDS")
plot_lc29_5 <- readRDS("Robjects1020km/plot_lc29_5.RDS")

names(plot_lc29_1) <- buffers1
names(plot_lc29_2) <- buffers2
names(plot_lc29_3) <- buffers3
names(plot_lc29_4) <- buffers4
names(plot_lc29_5) <- buffers5

plot_lc29_1  <- lapply(plot_lc29_1, as.data.frame)
plot_lc29_2  <- lapply(plot_lc29_2, as.data.frame)
plot_lc29_3  <- lapply(plot_lc29_3, as.data.frame)
plot_lc29_4  <- lapply(plot_lc29_4, as.data.frame)
plot_lc29_5  <- lapply(plot_lc29_5, as.data.frame)

plot_lc29_1 <- plot_lc29_1 %>% 
  bind_rows(.id = "buffer_size")
plot_lc29_1 <- plot_lc29_1 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())


plot_lc29_2 <- plot_lc29_2 %>% 
  bind_rows(.id = "buffer_size")
plot_lc29_2 <- plot_lc29_2 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())


plot_lc29_3 <- plot_lc29_3 %>% 
  bind_rows(.id = "buffer_size")
plot_lc29_3 <- plot_lc29_3 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())


plot_lc29_4 <- plot_lc29_4 %>% 
  bind_rows(.id = "buffer_size")
plot_lc29_4 <- plot_lc29_4 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())


plot_lc29_5 <- plot_lc29_5 %>% 
  bind_rows(.id = "buffer_size")
plot_lc29_5 <- plot_lc29_5 %>%
  as.data.frame() %>%
  group_by(buffer_size, ID, landcover_mosaic_lcc) %>%
  summarize(n = n())



plot_lc29 <- rbind(plot_lc29_1, plot_lc29_2, plot_lc29_3, plot_lc29_4, plot_lc29_5)
rm(plot_lc29_1, plot_lc29_2, plot_lc29_3, plot_lc29_4, plot_lc29_5)
names29 <- data.frame(Plot = as.character(all_centroids29$Plot), ID = 1:length(all_centroids29$Plot))
plot_lc29 <- merge(plot_lc29, names29)



#memory limit - group togther, process, delete

prop_lc28_29 <- rbind(plot_lc28, plot_lc29)
saveRDS(prop_lc28_29, "Robjects1020km/prop_lc28_29.RDS")
rm(plot_lc28, plot_lc29)
rm(prop_lc28_29)

Sys.time()




#import the groups I just made

prop_lc1_3 <- readRDS("Robjects1020km/prop_lc1_3.RDS")
prop_lc4_6 <- readRDS("Robjects1020km/prop_lc4_6.RDS")
prop_lc7_9 <- readRDS("Robjects1020km/prop_lc7_9.RDS")
prop_lc10_12 <- readRDS("Robjects1020km/prop_lc10_12.RDS")
prop_lc13_15 <- readRDS("Robjects1020km/prop_lc13_15.RDS")
prop_lc16_18 <- readRDS("Robjects1020km/prop_lc16_18.RDS")
prop_lc19_21 <- readRDS("Robjects1020km/prop_lc19_21.RDS")
prop_lc22_24 <- readRDS("Robjects1020km/prop_lc22_24.RDS")
prop_lc25_27 <- readRDS("Robjects1020km/prop_lc25_27.RDS")
prop_lc28_29 <- readRDS("Robjects1020km/prop_lc28_29.RDS")

#merge together

prop_lc <- rbind(prop_lc1_3,
                 prop_lc4_6,
                 prop_lc7_9,
                 prop_lc10_12, 
                 prop_lc13_15, 
                 prop_lc16_18, 
                 prop_lc19_21, 
                 prop_lc22_24, 
                 prop_lc25_27, 
                 prop_lc28_29)
                 

rm(prop_lc1_3,
   prop_lc4_6,
   prop_lc7_9,
   prop_lc10_12, 
   prop_lc13_15, 
   prop_lc16_18, 
   prop_lc19_21, 
   prop_lc22_24, 
   prop_lc25_27, 
   prop_lc28_29)




saveRDS(prop_lc, "Robjects1020km/prop_lcALL_20km_10012020.RDS")



