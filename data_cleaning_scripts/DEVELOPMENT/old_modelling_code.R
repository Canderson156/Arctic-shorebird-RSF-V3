

####################################
####################################
### MODELS ####

sb_env_buffer_wide <- readRDS("Robjects/sb_env_buffer_wide.RDS")




#REPH Model
### SINGLE SPECIES SINGLE VARIABLE VERSION

REPH_lc <- sb_env_buffer_wide %>%
  filter(Species == "REPH")


#relate to REPH presence/absence



REPH_02 <- multifit(mod = "glm", 
                    multief = colnames(REPH_lc[11:35]), #column names
                    formula = presence ~ multief,
                    args = c("family = binomial"),
                    data = REPH_lc[REPH_lc$landcover == "02_wet_sedge",], #which landcover variable
                    criterion = "AIC",
                    plot_est = T,
                    site_id = "Plot",
                    print_sum = TRUE
)

#why did this turn out differently before......




### SAME THING BUT FOR AMGP
### need to change from wet sedge to something else





#AMGP Model
#SINGLE SPECIES< MULTIPLE VARIABLE VERSION





AMGP_lc <- sb_env_buffer_wide %>%
  filter(Species == "AMGP")


#relate to AMGP presence/absence

# now write a script that makes this model for all 15 landcover classes
# I could go a step above and do lists within is lists. outer lis is speciers, inner list is landcover type






#create a list of 15 dataframes, one for each landcover variable



AMGP_lc_list <- group_split(AMGP_lc, landcover)
names(AMGP_lc_list) <- landcover_classes$lc_class





#lapply the functions below to each element of the list


#add year as a random effect? avg it? 
AMGP_models <- lapply(AMGP_lc_list, function(x) multifit(mod = "glm", 
                                                         multief = buffer_cols,     #column names
                                                         formula = presence ~ multief,
                                                         args = c("family = binomial"),
                                                         data = as.data.frame(x),      #which landcover variable
                                                         criterion = "AIC",
                                                         plot_est = T,
                                                         site_id = "Plot",
                                                         print_sum = TRUE))

#### why is this repeating the first group 16 times? input seems fine, seems like they work individually




#for loop version. not ideal final solution


AMGP_models <- vector(mode = "list", length = nrow(landcover_classes))

for(i in 1:nrow(landcover_classes)) {
  
  y <- AMGP_lc_list[[i]]
  
  AMGP_models[[i]] <- multifit(mod = "glm", 
                               multief = buffer_cols, #column names
                               formula = presence ~ multief,
                               args = c("family = binomial"),
                               data = as.data.frame(y), #which landcover variable
                               criterion = "AIC",
                               plot_est = T,
                               site_id = "Plot",
                               print_sum = TRUE)
  
}



#plot each one? dark = significant
#what was the difference in max/min AIC for each one?
#do the plots have similar patterns?


lapply(AMGP_models, function(x) diff(range(x$summary$AIC)))

lapply(AMGP_models, function(x) min(x$summary$AIC))




#MULTI CLASS FOR REPH


#create a list of 15 dataframes, one for each landcover variable


REPH_lc <- sb_env_buffer_wide %>%
  filter(Species == "REPH")


REPH_lc_list <- group_split(REPH_lc, landcover)
names(REPH_lc_list) <- landcover_classes$lc_class





#lapply the functions below to each element of the list


#add year as a random effect? avg it? 
REPH_models <- lapply(REPH_lc_list, function(x) multifit(mod = "glm", 
                                                         multief = buffer_cols,     #column names
                                                         formula = presence ~ multief,
                                                         args = c("family = binomial"),
                                                         data = as.data.frame(x),      #which landcover variable
                                                         criterion = "AIC",
                                                         plot_est = T,
                                                         site_id = "Plot",
                                                         print_sum = TRUE))

#### why is this repeating the first group 16 times? input seems fine, seems like they work individually




#for loop version. not ideal final solution


REPH_models <- vector(mode = "list", length = nrow(landcover_classes))

for(i in 1:nrow(landcover_classes)) {
  
  y <- REPH_lc_list[[i]]
  
  REPH_models[[i]] <- multifit(mod = "glm", 
                               multief = buffer_cols, #column names
                               formula = presence ~ multief,
                               args = c("family = binomial"),
                               data = as.data.frame(y), #which landcover variable
                               criterion = "AIC",
                               plot_est = T,
                               site_id = "Plot",
                               print_sum = TRUE)}


#why is model 8 saying there are warnings? Seems to have the same results as when I do it individually, and get no errors








#plot each one? dark = significant
#what was the difference in max/min AIC for each one?
#do the plots have similar patterns?

lapply(REPH_models, function(x) diff(range(x$summary$AIC)))

lapply(REPH_models, function(x) min(x$summary$AIC))




#what to do next?


#what does the temperature data look like? could I do this with the temp data?
#Make a model with the best habitat variables in it
#include all the other variables I used for my WHSG models as well
#make a list of next steps
#autocorrelation?
#cross-correlation between different variables?
#re do my sheet I did before but with the best spatial scales
#do another set of buffers that goes even bigger 
#other variables?
#make a list of questions like Lenore suggested


x <- glm(presence ~ R_0.25, AMGP_lc[AMGP_lc$landcover == "02_wet_sedge",], family = binomial)
x2 <- glm(presence ~ R_0.4, AMGP_lc[AMGP_lc$landcover == "02_wet_sedge",], family = binomial)


