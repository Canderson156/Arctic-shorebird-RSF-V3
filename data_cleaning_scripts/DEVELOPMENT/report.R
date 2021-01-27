###Trying to make a path model for final report




test_data <- REPH_lc[REPH_lc$buffer_size == buffers[26],]



#Model selection


REPH_global <- glm(presence ~ tussock_graminoid +
                     wet_sedge +
                     nontussock_graminoid_dwarf_shrub +
                     low_shrub +
                     tall_shrub +
                     prostrate_dwarf_shrub +
                     sparsely_vegetated_bedrock +
                     sparsely_vegetated_till +
                     bare_soil_cryptogam_frost_boils +
                     wetlands +
                     barren,
                   data = test_data,
                   family = "binomial")

options(na.action=na.fail)
REPH_dredge <- dredge(REPH_global)
####change this to use BIC instead of AIC if I want to penalize model complexity more heavily
# will have fewer variables in path analysis


best_REPH <- glm(presence ~ tussock_graminoid +
                   wet_sedge +
                   low_shrub +
                   tall_shrub +
                   sparsely_vegetated_bedrock +
                   sparsely_vegetated_till,
                 data = test_data,
                 family = "binomial")



path_REPH <- 'tussock_graminoid ~ a*temp_30_min_june
wet_sedge ~ a*temp_30_min_june
low_shrub ~ a*temp_30_min_june
tall_shrub ~ a*temp_30_min_june
sparsely_vegetated_bedrock ~ a*temp_30_min_june
sparsely_vegetated_till ~ a*temp_30_min_june
presence ~ b*temp_30_min_june + c*tussock_graminoid + d*wet_sedge + e*low_shrub + f*tall_shrub + h*sparsely_vegetated_bedrock + i*sparsely_vegetated_till


indirect temperature  := (a*c) + (a*d) + (a*e) + (a*h) + (a*i)
direct temperature    := b
total temperature     := b + (a*c) + (a*d) + (a*e) + (a*h) + (a*i)
tussock_graminoid     := c
wet_sedge             := d
low_shrub := e
tall_shrub := f
sparsely_vegetated_bedrock := h
sparsely_vegetated_till := i
'


fit <- sem(path_REPH, data = test_data)
summary(fit, standardized = T, fit.measures = T, rsq = T)

labels <- list(temp_30_min_june = "Mean June Temperature",   
               tussock_graminoid    = "Dry Meadow",
               wet_sedge   = "Wet Meadow",         
               low_shrub = "Low Shrub",
               tall_shrub = "Tall Shrub",
               prostrate_dwarf_shrub = "Dwarf Shrub", 
               sparsely_vegetated_bedrock = "Sparsely Vegetated Bedrock",
               sparsely_vegetated_till = "Sparsely Vegetated Till",
               barren = "Barren"
)


lavaanPlot(model = fit, labels = labels, node_options = list(shape = "box", fontname = "Helvetica"), edge_options = list(color = "grey"), coefs = TRUE)




####ASK GREG etc - why do the direct effect models come out different depending on what else is in the model? 
###aren't they estimated seperately?





#comparing if results make sense

#GLM with only tall shrub


test1 <- glm(presence ~ 
         tall_shrub + temp_30_min_june,
       data = test_data,
       family = "binomial")

summary(test1)


REPH_path <- 'tall_shrub ~ a*temp_30_min_june
presence ~ b*tall_shrub + c*temp_30_min_june

indirect temperature  := a*b
direct temperature    := c
total temperature     := c + (a*b)
tall shrub      := b'


fit <- sem(REPH_path, data = test_data)
summary(fit, standardized = T, fit.measures = T, rsq = T)




#adding wet sedge

#GLM with only tall shrub


test2 <- glm(presence ~ 
               tall_shrub + wet_sedge + temp_30_min_june,
             data = test_data,
             family = "binomial")

summary(test2)


REPH_path2 <- 'tall_shrub ~ a*temp_30_min_june
              wet_sedge ~ a*temp_30_min_june
presence ~ b*temp_30_min_june + c*tall_shrub + d*wet_sedge

indirect temperature  := (a*c) + (a*d)
direct temperature    := b
total temperature     := b + (a*c) + (a*d)
tall shrub            := c
wet_sedge             := d '


fit2 <- sem(REPH_path2, data = test_data)
summary(fit2, standardized = T, fit.measures = T, rsq = T)

lavaanPlot(model = fit, labels = labels, node_options = list(shape = "box", fontname = "Helvetica"), edge_options = list(color = "grey"), coefs = TRUE)
lavaanPlot(model = fit2, labels = labels, node_options = list(shape = "box", fontname = "Helvetica"), edge_options = list(color = "grey"), coefs = TRUE)








############## with the merged dataset

#Model selection


REPH_global <- glm(presence ~ tussock_graminoid +
                     wet_sedge +
                     nontussock_graminoid +
                     shrub +
                     sparsely_vegetated +
                     wetlands +
                     barren,
                   data = test_data,
                   family = "binomial")






options(na.action=na.fail)
REPH_dredge <- dredge(REPH_global)



best_REPH <- glm(presence ~ 
                      wet_sedge +
                      shrub +
                      sparsely_vegetated +
                      wetlands +
                      barren,
                    data = test_data,
                    family = "binomial")



path_REPH <- '
wet_sedge ~ a*temp_30_min_june
shrub ~ a*temp_30_min_june
sparsely_vegetated ~ a*temp_30_min_june
wetlands ~ a*temp_30_min_june
barren ~ a*temp_30_min_june
presence ~ b*temp_30_min_june + c*wet_sedge + d*shrub + e*sparsely_vegetated + f*wetlands + g*barren


indirect temperature  := (a*c) + (a*d) + (a*e) + (a*f) + (a*g)
direct temperature    := b
total temperature     := b + (a*c) + (a*d) + (a*e) + (a*f) + (a*g)
wet_sedge             := c
shrub                 := d
sparsely_vegetated    := e
wetlands              := f
barren                := g
'


fit <- sem(path_REPH, data = test_data)
summary(fit, standardized = T, fit.measures = T, rsq = T)

labels <- list(temp_30_min_june = "Mean June Temperature",   
               wet_sedge   = "% Wet Meadow",         
               shrub = "% Shrub",
               sparsely_vegetated = "% Sparsely Vegetated",
               wetlands = "% Wetlands",
               barren = "% Barren",
               presence = "Presence of Red Phalarope"
)


lavaanPlot(model = fit, labels = labels, node_options = list(shape = "box", fontname = "Helvetica"), edge_options = list(color = "grey"), coefs = TRUE)




