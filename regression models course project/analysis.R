library(Hmisc)
library(kableExtra)
library(patchwork)
library(sjPlot)

data("mtcars")
Hmisc::label(mtcars$wt) <- "Weight"
units(mtcars$wt) <- "Tousands of pounds"
Hmisc::label(mtcars$cyl) <- "Number of cylinders"
Hmisc::label(mtcars$am) <- "Transmission type"
## Appendix
library("PerformanceAnalytics")
data <- mtcars[ , c(1, 2, 3, 4, 5, 6, 9)]
corr <- chart.Correlation(data, histogram=TRUE, pch=19)

### Model selection


# load the mtcars data starting regression model
data(mtcars); fit0 <- lm(mpg ~ wt + disp + drat + as.factor(cyl) + as.factor(am), data = mtcars)
# step-wise search using BIC
step(fit0, k = log(nrow(mtcars)))

dim <- dim(mtcars)

fit <- lm(formula = mpg ~ wt + as.factor(cyl) + as.factor(am), data = mtcars)
fit2 <- lm(formula = mpg ~ wt + as.factor(cyl), data = mtcars)
fit3 <- lm(formula = mpg ~ wt + as.factor(am), data = mtcars)

r <- (round((summary(fit2)$adj.r.squared), 2)*100)


dif <- abs(round((summary(fit2)$adj.r.squared-summary(fit)$adj.r.squared)*100, 2))
dif2 <- abs(round((summary(fit)$adj.r.squared-summary(fit3)$adj.r.squared)*100, 2))

### Residual plots



resid <- par(mfrow = c(2, 2)); plot(fit)




bp <- ggplot(mtcars) + 
  geom_boxplot(aes(am, wt, group = am)) + 
  theme_bw() + 
  xlab("Transmission type") + 
  ylab("MPG")

test_results <- (t.test(wt ~ am, data = mtcars))
mean_a <- round(test_results$estimate[1]*1000, 2)
mean_b <- round(test_results$estimate[2]*1000, 2)
pval <- round(test_results$p.value, 2)


# Define shapes
shapes <- (mtcars$cyl)

p <- ggplot(mtcars) + geom_point(aes(mpg, wt, color = as.factor(am))) + 
  theme_bw() + 
  xlab("Weight") + 
  ylab("MPG")

p <- p + labs(color = "Transmission type")



## Influential points

# calculate the dfbetas for the slope
round(dfbetas(fit2)[, 2], 3)

inflm.SR <- influence.measures(fit2)
which(apply(inflm.SR$is.inf, 1, any))
# which observations 'are' influential
summary(inflm.SR) # only these


## - The potential for influence is large for Lincoln Continental and the Toyota Corolla relative to other points. 

## Variance Inflation Factors

library(rms)
# calculate the variance inflation factors
vif(fit2)

# calculate the standard error inflation factors
sqrt(vif(fit2))

library(jtools)
library(ggstance)
library(huxtable)

export_summs(fit, fit2,
             error_format = "[{conf.low}, {conf.high}]")

names_a <- c("Intercept", "Weight", "Six cylinders", "Eight cylinders")
names(fit2$coefficients) <- names_a


names_b <- c("Intercept", "Weight", "Six cylinders", "Eight cylinders", "Manual transmission")
names(fit$coefficients) <- names_b

coef_names <- names_b[2:5]
plot_summs(fit, fit2, robust = "HC3", coefs = coef_names )

