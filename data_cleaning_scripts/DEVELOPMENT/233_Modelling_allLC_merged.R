buffer_cols <- readRDS("Robjects/buffercols.RDS")
buffers <- readRDS("Robjects/buffers.RDS")
sb_env <- readRDS("Robjects/sb_env_buffer_merged.RDS")


#sb_env2 <- read.csv("exported/sb_env.csv") #I used this when it wasn't working on certain computers



#difference when merging classes: AMGP has 14 seperations, REPH has 0. AMGP is now 10km, REPH still 10km





#what are the presence values? are they for one survey, or a max?
### need to decide what to do with multiple years

AMGP_lc <- sb_env %>%
  filter(Species == "AMGP")


AMGP_lc_list <- group_split(AMGP_lc, buffer_size)
names(AMGP_lc_list) <- buffer_cols



#apparently I'm getting an NA when all are included becasue they aren't all linearly independent. 
#That makes sense because they all add up to 1
#decided to drop the ice_snow variable becasue it has the least variation, 
#doesn't seem that important for shorebirds either
#https://stackoverflow.com/questions/7337761/linear-regression-na-estimate-just-for-last-coefficient
#also decided to remove dry_graminoid because it doesn't have enough variation at large values
#should I combine it with another similar group?

#do i have to do anything welse differently since I'm looking at proportions?



AMGP_models <- lapply(AMGP_lc_list, function(x) glm(presence ~ tussock_graminoid +
                                                      wet_sedge +
                                                      nontussock_graminoid +
                                                      shrub +
                                                      sparsely_vegetated +
                                                      wetlands +
                                                      barren +
                                                      water,
                                                    data = x,
                                                    family = "binomial"))


## check this out https://www.rdocumentation.org/packages/vcdExtra/versions/0.7-1/topics/glmlist

AMGP_models_list <- glmlist(AMGP_models[[1]], 
                            AMGP_models[[2]],
                            AMGP_models[[3]],
                            AMGP_models[[4]],
                            AMGP_models[[5]],
                            AMGP_models[[6]],
                            AMGP_models[[7]],
                            AMGP_models[[8]],
                            AMGP_models[[9]],
                            AMGP_models[[10]],
                            AMGP_models[[11]],
                            AMGP_models[[12]],
                            AMGP_models[[13]],
                            AMGP_models[[14]],
                            AMGP_models[[15]],
                            AMGP_models[[16]],
                            AMGP_models[[17]],
                            AMGP_models[[18]],
                            AMGP_models[[19]],
                            AMGP_models[[20]],
                            AMGP_models[[21]],
                            AMGP_models[[22]],
                            AMGP_models[[23]],
                            AMGP_models[[24]],
                            AMGP_models[[25]],
                            AMGP_models[[26]]
                            )

names(AMGP_models_list) <- buffer_cols



LRstats(AMGP_models_list)
coef(AMGP_models_list, result='data.frame')

summary(AMGP_models[[14]])

#0.8 has the lowest AIC


#REPH

REPH_lc <- sb_env %>%
  filter(Species == "REPH")


REPH_lc_list <- group_split(REPH_lc, buffer_size)
names(REPH_lc_list) <- buffer_cols


#5 warnings
REPH_models <- lapply(REPH_lc_list, function(x) glm(presence ~ tussock_graminoid +
                                                      wet_sedge +
                                                      nontussock_graminoid +
                                                      shrub +
                                                      sparsely_vegetated +
                                                      wetlands +
                                                      barren +
                                                      water,
                                                    data = x,
                                                    family = "binomial"))



REPH_models_list <- glmlist(REPH_models[[1]], 
                            REPH_models[[2]],
                            REPH_models[[3]],
                            REPH_models[[4]],
                            REPH_models[[5]],
                            REPH_models[[6]],
                            REPH_models[[7]],
                            REPH_models[[8]],
                            REPH_models[[9]],
                            REPH_models[[10]],
                            REPH_models[[11]],
                            REPH_models[[12]],
                            REPH_models[[13]],
                            REPH_models[[14]],
                            REPH_models[[15]],
                            REPH_models[[16]],
                            REPH_models[[17]],
                            REPH_models[[18]],
                            REPH_models[[19]],
                            REPH_models[[20]],
                            REPH_models[[21]],
                            REPH_models[[22]],
                            REPH_models[[23]],
                            REPH_models[[24]],
                            REPH_models[[25]],
                            REPH_models[[26]]
)

names(REPH_models_list) <- buffer_cols


LRstats(REPH_models_list)
coef(REPH_models_list, result='data.frame')

summary(REPH_models[[10]])

#4km has the lowest AIC

####### Testing
#possible solution? https://discuss.analyticsvidhya.com/t/glm-fit-fitted-probabilities-numerically-0-or-1-occurred-warning-message-when-i-run-logistic-regression/10390/5


#REPH: 


#perfect seperation: 8-23 tall shrub, 20 sparse bedrock

test_data <- REPH_lc[REPH_lc$buffer_size == buffers[26],]

test <- glm(presence ~ 
              tussock_graminoid +
              wet_sedge +
              nontussock_graminoid_dwarf_shrub +
              dry_graminoid_prostrate_dwarf_shrub_tundra +
              low_shrub +
              #tall_shrub +
              prostrate_dwarf_shrub +
              #sparsely_vegetated_bedrock +
              sparsely_vegetated_till +
              bare_soil_cryptogam_frost_boils +
              wetlands +
              barren +
              water,
            data = test_data,
            family = "binomial")


 ggplot(REPH_lc, aes(x = presence, y = tall_shrub)) +
   geom_boxplot()



 test <- glm(presence ~ 
               sparsely_vegetated_bedrock,
             data = test_data,
             family = "binomial")
 
 

#tussock graminoid works when one other category and tall shrub are excluded

#https://stats.stackexchange.com/questions/11109/how-to-deal-with-perfect-separation-in-logistic-regression
 
 
 
 
 
 
 
#do any of the landcover seem to be related to temp?
 
temp_lc <- glm(temp_30_min_june ~ 
               tussock_graminoid +
               wet_sedge +
               nontussock_graminoid_dwarf_shrub +
               dry_graminoid_prostrate_dwarf_shrub_tundra +
               low_shrub +
               tall_shrub +
               prostrate_dwarf_shrub +
               sparsely_vegetated_bedrock +
               sparsely_vegetated_till +
               bare_soil_cryptogam_frost_boils +
               wetlands +
               barren +
               water,
             data = test_data)

temp_1 <- glm(wet_sedge ~
                 temp_30_min_june,
               data = test_data)
 
summary(temp_1) 
 
 
 
 
#### Path models
 
 
AMGP_best <-  AMGP_lc[AMGP_lc$buffer_size == "800",]
 

AMGP_path <- 'dry_graminoid_prostrate_dwarf_shrub_tundra  ~ a*temp_30_min_june
               presence ~ b*dry_graminoid_prostrate_dwarf_shrub_tundra  + c*temp_30_min_june

indirect temperature  := a*b
direct temperature    := c
total temperature     := c + (a*b)
direct landcover      := b'


fit <- sem(AMGP_path, data = AMGP_best)
summary(fit, standardized = T, fit.measures = T, rsq = T)




AMGP_path_all <- 'tussock_graminoid ~ a*temp_30_min_june
wet_sedge ~ a*temp_30_min_june
nontussock_graminoid_dwarf_shrub ~ a*temp_30_min_june
dry_graminoid_prostrate_dwarf_shrub_tundra ~ a*temp_30_min_june
low_shrub ~ a*temp_30_min_june
tall_shrub ~ a*temp_30_min_june
prostrate_dwarf_shrub ~ a*temp_30_min_june
sparsely_vegetated_bedrock ~ a*temp_30_min_june
sparsely_vegetated_till ~ a*temp_30_min_june
bare_soil_cryptogam_frost_boils ~ a*temp_30_min_june
wetlands ~ a*temp_30_min_june
barren ~ a*temp_30_min_june
water ~ a*temp_30_min_june
presence ~ b*temp_30_min_june + c*tussock_graminoid + d*wet_sedge + e*nontussock_graminoid_dwarf_shrub + f*dry_graminoid_prostrate_dwarf_shrub_tundra + g*low_shrub + h*tall_shrub + i*prostrate_dwarf_shrub + j*sparsely_vegetated_bedrock + k*sparsely_vegetated_till +  l*bare_soil_cryptogam_frost_boils + m*wetlands + n*barren + o*water


indirect temperature  := (a*c) + (a*d) + (a*e) * (a*f) + (a*g) + (a*h) + (a*i) + (a*j) + (a*k) + (a*l) + (a*m) + (a*n) + (a*o)
direct temperature    := b
total temperature     := b + (a*c) + (a*d) + (a*e) * (a*f) + (a*g) + (a*h) + (a*i) + (a*j) + (a*k) + (a*l) + (a*m) + (a*n) + (a*o)
tussock_graminoid     := c
wet_sedge             := d
nontussock_graminoid_dwarf_shrub := e
dry_graminoid_prostrate_dwarf_shrub_tundra := f
low_shrub := g
tall_shrub := h
prostrate_dwarf_shrub := i
sparsely_vegetated_bedrock := j
sparsely_vegetated_till := k
bare_soil_cryptogam_frost_boils := l
wetlands := m
barren := n
water := o
'


fit <- sem(AMGP_path_all, data = AMGP_best)
summary(fit, standardized = T, fit.measures = T, rsq = T)







####

REPH_best <-  REPH_lc[REPH_lc$buffer_size == 10000,]


REPH_path <- 'wet_sedge ~ a*temp_30_min_june
               presence ~ b*sparsely_vegetated_bedrock + c*temp_30_min_june

indirect temperature  := a*b
direct temperature    := c
total temperature     := c + (a*b)
direct landcover      := b'


fit <- sem(REPH_path, data = REPH_best)
summary(fit, standardized = T, fit.measures = T, rsq = T)


##how can I include more than one landcover type?




REPH_path_all <- 'tussock_graminoid ~ a*temp_30_min_june
                  wet_sedge ~ a*temp_30_min_june
                  nontussock_graminoid_dwarf_shrub ~ a*temp_30_min_june
                  dry_graminoid_prostrate_dwarf_shrub_tundra ~ a*temp_30_min_june
                  low_shrub ~ a*temp_30_min_june
                  tall_shrub ~ a*temp_30_min_june
                  prostrate_dwarf_shrub ~ a*temp_30_min_june
                  sparsely_vegetated_bedrock ~ a*temp_30_min_june
                  sparsely_vegetated_till ~ a*temp_30_min_june
                  bare_soil_cryptogam_frost_boils ~ a*temp_30_min_june
                  wetlands ~ a*temp_30_min_june
                  barren ~ a*temp_30_min_june
                  water ~ a*temp_30_min_june
               presence ~ b*temp_30_min_june + c*tussock_graminoid + d*wet_sedge + e*nontussock_graminoid_dwarf_shrub + f*dry_graminoid_prostrate_dwarf_shrub_tundra + g*low_shrub + h*tall_shrub + i*prostrate_dwarf_shrub + j*sparsely_vegetated_bedrock + k*sparsely_vegetated_till +  l*bare_soil_cryptogam_frost_boils + m*wetlands + n*barren + o*water


indirect temperature  := (a*c) + (a*d) + (a*e) * (a*f) + (a*g) + (a*h) + (a*i) + (a*j) + (a*k) + (a*l) + (a*m) + (a*n) + (a*o)
direct temperature    := b
total temperature     := b + (a*c) + (a*d) + (a*e) * (a*f) + (a*g) + (a*h) + (a*i) + (a*j) + (a*k) + (a*l) + (a*m) + (a*n) + (a*o)
tussock_graminoid     := c
wet_sedge             := d
nontussock_graminoid_dwarf_shrub := e
dry_graminoid_prostrate_dwarf_shrub_tundra := f
low_shrub := g
tall_shrub := h
prostrate_dwarf_shrub := i
sparsely_vegetated_bedrock := j
sparsely_vegetated_till := k
bare_soil_cryptogam_frost_boils := l
wetlands := m
barren := n
water := o
'


fit <- sem(REPH_path_all, data = REPH_best)
summary(fit, standardized = T, fit.measures = T, rsq = T)












