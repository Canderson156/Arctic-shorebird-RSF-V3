



sb_env <- readRDS("Robjects/sb_env.RDS")

RUTU <- sb_env %>%
  filter(Species == "RUTU") %>%
  rename(sparsely_vegetated_bedrock = `08_sparsely_vegetated_bedrock`) %>%
  mutate(temp_june_dif = temp_yr_min_june - temp_30_min_june)

test <- glm(presence ~ temp_yr_min_june + `sparsely_vegetated_bedrock`, RUTU, family = binomial)



ggplot(RUTU, aes(x = temp_))


test2 <- glm(presence ~ temp_yr_min_june , RUTU, family = binomial)
test3 <- glm(presence ~ temp_june_dif, RUTU, family = binomial)
test4 <- glm(presence ~ temp_yr_min_june + temp_june_dif , RUTU, family = binomial)
test5 <- glm(presence ~ temp_yr_min_june * temp_june_dif , RUTU, family = binomial) 
# 5 is the best model accoriding to AIC. makes sense - difference from mean would be more important in some areas than in other areas

AIC(test2, test3, test4, test5)



test2$deviance
test3$deviance
test4$deviance
test5$deviance


lrtest(test2, test3, test4, test5)

  
  
temp1 <- glm(presence ~ temp_yr_min_june + temp_june_dif , data = RUTU, family = binomial)
temp2 <- glm(presence ~ temp_yr_min_june * temp_june_dif , data = RUTU, family = binomial)



x <- seq(-3, 3, .01)
y <- invlogit(coefficients(temp1)[1] + coefficients(temp1)[2]*x)

ggplot(data.frame(x = x, y = y), aes(x, y)) +
  geom_line() +
  ylab("probability of RUTU") +
  xlab("temp_yr_min_june")

exp(2.11)


x1 <- seq(-3, 3, .01)
y1 <- invlogit(-4.13 + 1.33*x)

ggplot(data.frame(x = x1, y = y1), aes(x1, y1)) +
  geom_line() +
  ylab("probability of RUTU") +
  xlab("temp_yr_min_june")

exp(1.33)


#no comission errors, no false negatives
a <- as.factor(ifelse(fitted(temp1) >= .011, "TRUE", "FALSE"))
b <- as.factor(RUTU$presence)

confusionMatrix(a,b)$table


a <- as.factor(ifelse(fitted(temp2) >= .008, "TRUE", "FALSE"))
b <- as.factor(RUTU$presence)

confusionMatrix(a,b)$table




2649/(2649+58)
#always saying abset would be 97.8% accurate



#### equal to first order habitat selection. Would choose differently for the other orders
### I think it makes sense to have high sensitivity at the expense of specificity.
### No false negatives. 2 areas: definately not here, might be here



plot(roc(RUTU$presence, fitted(temp1)), print.thres = c(.01, .02, .03, .04, .05), col = "red", print.auc = T)
plot(roc(RUTU$presence, fitted(temp2)), print.thres = c(.01, .02, .03, .04, .05), col = "red", print.auc = T)
#the difference in plot shape is interesting. 
#why does the one with the interaction look normal, and the one with no interaction have a weird shape?


#checking residuals

binnedplot(fitted(temp2), 
           residuals(temp2, type = "response"), 
           nclass = NULL, 
           xlab = "Expected Values", 
           ylab = "Average residual", 
           main = "Binned residual plot", 
           cex.pts = 0.8, 
           col.pts = 1, 
           col.int = "gray")

#this looks weird, I'm not sure if I'm the plot is bad or if the mdoel is bad


binnedplot(temp2$fitted.values, temp2$residuals,
           xlab = "Predicted Probabilities", 
           main = "Binned Residual vs. Predicted Values")





r2Log <- function(model) {
  
  summaryLog <- summary(model)
  1 - summaryLog$deviance / summaryLog$null.deviance
  
}

r2Log(temp1)
r2Log(temp2)

#Hosmer-Lemeshow Test (goodness of fit test for logistic regression). Small p value is a poor fit
hl <- hoslem.test(temp2$y, fitted(temp2), g = 10)




### add more values here
newdata1 <- expand.grid(temp_yr_min_june = quantile(RUTU$temp_yr_min_june), temp_june_dif = quantile(RUTU$temp_june_dif))


newdata1$p <- predict(temp2, newdata = newdata1, type = "response")


ggplot(newdata1, aes(x = temp_yr_min_june, y = p, col = as.factor(temp_june_dif))) +
  geom_line()


RUTU <- RUTU %>%
  mutate(temp0 = temp_yr_min_june >0,
         dif0 = temp_june_dif >0)

ggplot(RUTU, aes(x = presence, y = temp_yr_min_june)) +
  geom_boxplot() +
  facet_grid(~dif0) +
  labs(y = "temperature jun")

#my model prediction pot above seems to show the opposite thing to these boxplots...


#  standardize() %>%
#  display()
#removed right now pecause I don't know how to standardize predictor inputs for doing the predictions


invlogit <- function(x) exp(x)/(1 + exp(x))


invlogit(test$coef[1] + test$coef[2]*0 + test$coef[3]*0)


RUTU <- RUTU %>%
  mutate(prRUTU = invlogit(test$coef[1] + test$coef[2]*(temp_yr_min_june- 0.9) + test$coef[3]*(sparsely_vegetated_bedrock-0.057)),
         predict_yn = as.factor(ifelse(prRUTU > 0.047, 1, 0)),
         predict_pr = as.factor(rbinom(n(),1,prRUTU)),
         presence = factor(as.numeric(presence), ordered = T))


ggplot(RUTU, aes(x = predict_pr, y = prRUTU)) +
  geom_boxplot()


confusionMatrix(RUTU$predict_yn, RUTU$presence, positive = "1")





#Path analysis

model.rutu <- 'sparsely_vegetated_bedrock ~ a*temp_yr_min_june
               presence ~ b*sparsely_vegetated_bedrock + c*temp_yr_min_june

              indirect := a*b
              direct   := c
              total    := c + (a*b)'


fit <- sem(model.rutu, data = RUTU)
summary(fit, standardized = T, fit.measures = T, rsq = T)


