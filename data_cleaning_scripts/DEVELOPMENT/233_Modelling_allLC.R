buffer_cols <- readRDS("Robjects/buffercols.RDS")
buffers <- readRDS("Robjects/buffers.RDS")
sb_env <- readRDS("Robjects/sb_env_buffer.RDS")

#sb_env2 <- read.csv("exported/sb_env.csv") #I used this when it wasn't working on certain computers




#correlation matrix

preds <- sb_env %>%
  select(-Plot, -Species, -Region_name, -Region_code, 
         -Sub_region_code, -Sub_region_name, -presence, -max_birds_allyrs) %>%
  distinct()


preds_buffer <- group_split(preds, buffer_size)
  names(preds_buffer) <- buffer_cols

corr_plots <- lapply(preds_buffer, ggpairs)

corr_plots2 <- lapply(preds_buffer, ggcorr)



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
                                                      nontussock_graminoid_dwarf_shrub +
                                                      low_shrub +
                                                      tall_shrub +
                                                      prostrate_dwarf_shrub +
                                                      sparsely_vegetated_bedrock +
                                                      sparsely_vegetated_till +
                                                      bare_soil_cryptogam_frost_boils +
                                                      wetlands +
                                                      barren ,
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



AMGP_LR <- LRstats(AMGP_models_list)
coef(AMGP_models_list, result='data.frame')

summary(AMGP_models[[2]])

#0.8 has the lowest AIC


#REPH

REPH_lc <- sb_env %>%
  filter(Species == "REPH")


REPH_lc_list <- group_split(REPH_lc, buffer_size)
names(REPH_lc_list) <- buffer_cols


#16 warnings
REPH_models <- lapply(REPH_lc_list, function(x) glm(presence ~ tussock_graminoid +
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


REPH_LR <- LRstats(REPH_models_list)
coef(REPH_models_list, result='data.frame')

summary(REPH_models[[26]])

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


 ggplot(test_data, aes(x = presence, y = tall_shrub)) +
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
 

temp_2 <- glm(sparsely_vegetated_till ~
                temp_30_min_june,
              data = test_data)

summary(temp_2) 
r2Log(temp_2)


 
 
#### Path models
 

#https://lavaan.ugent.be/tutorial/sem.html
#http://www.understandingdata.net/2017/03/22/cfa-in-lavaan/

 
AMGP_best <-  AMGP_lc[AMGP_lc$buffer_size == "400",]
 

AMGP_path <- 'dry_graminoid_prostrate_dwarf_shrub_tundra  ~ a*temp_30_min_june
               presence ~ b*dry_graminoid_prostrate_dwarf_shrub_tundra  + c*temp_30_min_june

indirect temperature  := a*b
direct temperature    := c
total temperature     := c + (a*b)
direct landcover      := b'


fit <- sem(AMGP_path, data = AMGP_best)
summary(fit, standardized = T, fit.measures = T, rsq = T)




path_all <- 'tussock_graminoid ~ a*temp_30_min_june
wet_sedge ~ a*temp_30_min_june
nontussock_graminoid_dwarf_shrub ~ a*temp_30_min_june
low_shrub ~ a*temp_30_min_june
tall_shrub ~ a*temp_30_min_june
prostrate_dwarf_shrub ~ a*temp_30_min_june
sparsely_vegetated_bedrock ~ a*temp_30_min_june
sparsely_vegetated_till ~ a*temp_30_min_june
bare_soil_cryptogam_frost_boils ~ a*temp_30_min_june
wetlands ~ a*temp_30_min_june
barren ~ a*temp_30_min_june
presence ~ b*temp_30_min_june + c*tussock_graminoid + d*wet_sedge + e*nontussock_graminoid_dwarf_shrub + f*dry_graminoid_prostrate_dwarf_shrub_tundra + g*low_shrub + h*tall_shrub + i*prostrate_dwarf_shrub + j*sparsely_vegetated_bedrock + k*sparsely_vegetated_till +  l*bare_soil_cryptogam_frost_boils + m*wetlands + n*barren


indirect temperature  := (a*c) + (a*d) + (a*e) + (a*g) + (a*h) + (a*i) + (a*j) + (a*k) + (a*l) + (a*m) + (a*n)
direct temperature    := b
total temperature     := b + (a*c) + (a*d) + (a*e) + (a*g) + (a*h) + (a*i) + (a*j) + (a*k) + (a*l) + (a*m) + (a*n)
tussock_graminoid     := c
wet_sedge             := d
nontussock_graminoid_dwarf_shrub := e
low_shrub := g
tall_shrub := h
prostrate_dwarf_shrub := i
sparsely_vegetated_bedrock := j
sparsely_vegetated_till := k
bare_soil_cryptogam_frost_boils := l
wetlands := m
barren := n
'


fit <- sem(path_all, data = AMGP_best)
summary(fit, standardized = T, fit.measures = T, rsq = T)


parameterEstimates(fit, standardized=TRUE)




####

REPH_best <-  REPH_lc[REPH_lc$buffer_size == 10000,]


REPH_path <- 'tall_shrub ~ a*temp_30_min_june
               presence ~ b*tall_shrub + c*temp_30_min_june

indirect temperature  := a*b
direct temperature    := c
total temperature     := c + (a*b)
direct landcover      := b'


fit <- sem(REPH_path, data = REPH_best)
summary(fit, standardized = T, fit.measures = T, rsq = T)


##how can I include more than one landcover type?




fit <- sem(path_all, data = REPH_best)
summary(fit, standardized = T, fit.measures = T, rsq = T)



#goodness of fit tests


#https://bookdown.org/egarpor/SSS2-UC3M/logreg.html
#https://www.r-bloggers.com/2015/08/evaluating-logistic-regression-models/
  





#likelihood ratio test

REPHboth <- glm(presence ~ wet_sedge +
                              tussock_graminoid +
                              nontussock_graminoid_dwarf_shrub +
                              low_shrub +
                              tall_shrub +
                              prostrate_dwarf_shrub +
                              sparsely_vegetated_bedrock +
                              sparsely_vegetated_till +
                              bare_soil_cryptogam_frost_boils +
                              wetlands +
                              barren +
                              temp_30_min_june ,
                              data = REPH_best,
                              family = "binomial")

REPHlc <- glm(presence ~ tussock_graminoid +
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
             data = REPH_best,
             family = "binomial")

REPHtemp <- glm(presence ~ 
               temp_30_min_june,
             data = REPH_best,
             family = "binomial")

REPHnull <- glm(presence ~ 1,
             data = REPH_best,
             family = "binomial")

REPHws <- glm(presence ~ wet_sedge +,
               data = REPH_best,
               family = "binomial") 


REPHmm <- glmer(presence ~ wet_sedge +
                    #tussock_graminoid +
                    #nontussock_graminoid_dwarf_shrub +
                    low_shrub +
                    #tall_shrub +
                    #prostrate_dwarf_shrub +
                    sparsely_vegetated_bedrock +
                    sparsely_vegetated_till +
                    #bare_soil_cryptogam_frost_boils +
                    #wetlands +
                    #barren +
                    temp_30_min_june + 
                    (1|Region_name),
                  data = REPH_best,
                  family = "binomial")



lrtest(REPHboth, REPHlc, REPHtemp, REPHnull)



#Pseudo R2 


r2Log(REPHnull)
r2Log(REPHtemp)
r2Log(REPHlc)
r2Log(REPHboth)


AIC()


#Hosmer-Lemeshow Test

HosmerLemeshow(REPHboth, g = 12)


#rejected, poor fit


#check multicolinearity - found that water was collinear - check collineatiry in its own plot?
vif(REPHboth)


#ROC curve

#AUC = 0.865
plot(roc(REPH_best$presence, fitted(REPHboth)), col = "red", print.auc = T)
#print.thres = c(.01, .02, .03, .04, .05) use this arguement to print threshold on the line



#classification rate

pred = predict(REPHboth, newdata=REPH_best)
accuracy <- table(pred, REPH_best[,"presence"])
sum(diag(accuracy))/sum(accuracy)

#classifies presence correctly 0.04% of the time


#all landcovers and temps
b <- as.factor(REPH_best$presence)
a <- as.factor(ifelse(fitted(REPHboth) >= .0001, "TRUE", "FALSE"))
confusionMatrix(a,b)$table


#temp only
d <- as.factor(REPH_best$presence)
c <- as.factor(ifelse(fitted(REPHtemp) >= .04, "TRUE", "FALSE"))
confusionMatrix(c,d)$table


#wet sedge only
f <- as.factor(REPH_best$presence)
e <- as.factor(ifelse(fitted(REPHws) >= .05, "TRUE", "FALSE"))
confusionMatrix(e,f)$table


#K-fold cross validation?





#glmer version has a higher AUC, similarly bad classification rate, can't use some of the other fuctions



#goodness of fit tests for best LC only models


#AMGP

vif(AMGP_models_list[[2]])


HosmerLemeshow(AMGP_models_list[[2]], g = 10)
residuals.glm(AMGP_models_list[[2]])

pred = predict(AMGP_models_list[[3]], newdata=AMGP_best)
accuracy <- table(pred, AMGP_best[,"presence"])
sum(diag(accuracy))/sum(accuracy)

#classifies presence correctly 0.04% of the time

b <- as.factor(AMGP_best$presence)
a <- as.factor(ifelse(fitted(AMGP_models_list[[3]]) >= .012, "TRUE", "FALSE"))
confusionMatrix(a,b)$table

b <- as.factor(AMGP_best$presence)
a <- as.factor(ifelse(fitted(AMGP_models_list[[3]]) >= .11, "TRUE", "FALSE"))
confusionMatrix(a,b)$table



plot(roc(AMGP_best$presence, fitted(AMGP_models_list[[3]])), col = "red", print.auc = T, print.thres = c(.11))
#print.thres = c(.01, .02, .03, .04, .05) use this arguement to print threshold on the line


AMGPboth <- glm(presence ~ wet_sedge +
                  tussock_graminoid +
                  nontussock_graminoid_dwarf_shrub +
                  low_shrub +
                  tall_shrub +
                  prostrate_dwarf_shrub +
                  sparsely_vegetated_bedrock +
                  sparsely_vegetated_till +
                  bare_soil_cryptogam_frost_boils +
                  wetlands +
                  barren +
                  temp_30_min_june ,
                data = AMGP_best,
                family = "binomial")

AMGPlc <- glm(presence ~ tussock_graminoid +
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
              data = AMGP_best,
              family = "binomial")

AMGPtemp <- glm(presence ~ 
                  temp_30_min_june,
                data = AMGP_best,
                family = "binomial")

AMGPnull <- glm(presence ~ 1,
                data = AMGP_best,
                family = "binomial")


lrtest(AMGPboth, AMGPlc, AMGPtemp, AMGPnull)

r2Log(AMGPnull)
r2Log(AMGPtemp)
r2Log(AMGPlc)
r2Log(AMGPboth)


#REPH

HosmerLemeshow(REPH_models_list[[26]], g = 10)


pred = predict(REPH_models_list[[26]], newdata=REPH_best)
accuracy <- table(pred, REPH_best[,"presence"])
sum(diag(accuracy))/sum(accuracy)

#classifies presence correctly 0.04% of the time

b <- as.factor(REPH_best$presence)
a <- as.factor(ifelse(fitted(REPH_models_list[[26]]) >= .00009, "TRUE", "FALSE"))
confusionMatrix(a,b)$table

b <- as.factor(REPH_best$presence)
a <- as.factor(ifelse(fitted(REPH_models_list[[26]]) >= .14, "TRUE", "FALSE"))
confusionMatrix(a,b)$table


#AUC = 0.865
plot(roc(REPH_best$presence, fitted(REPH_models_list[[26]])), col = "red", print.auc = T, print.thres = c(.14))
#print.thres = c(.01, .02, .03, .04, .05) use this arguement to print threshold on the line








#######################################################


#making a plot for end of the year report


AMGP_LR <- AMGP_LR %>%
  mutate(Species = "AMGP",
         buffer = buffers/1000,
         min = (AIC == min(AIC)))

REPH_LR <- REPH_LR %>%
  mutate(Species = "REPH",
         buffer = buffers/1000,
         min = (AIC == min(AIC)))

LR <- rbind(AMGP_LR, REPH_LR)


ggplot(LR, aes(x = buffer, y = AIC)) +
  geom_point() +
  facet_wrap(~Species, scales = "free_y") +
  geom_point(data = LR[LR$min == TRUE,], color='red',size=3)


