# 1. Consider the \verb| mtcars| mtcars data set. Fit a model with mpg as the 
# outcome that includes number of cylinders as a factor variable and weight as 
# confounder. Give the adjusted estimate for the expected change in mpg comparing 
# 8 cylinders to 4.

# Load data
data(mtcars)

# Create model

fit <- lm(mpg ~ as.factor(cyl) + wt, mtcars)
summary(fit)

# 2. Consider the \verb| mtcars| mtcars data set. Fit a model with mpg as the 
# outcome that includes number of cylinders as a factor variable and weight as 
# a possible confounding variable. Compare the effect of 8 versus 4 cylinders 
# on mpg for the adjusted and unadjusted by weight models.  Here, adjusted means 
# including the weight variable as a term in the regression model and unadjusted 
# means the model without weight included. What can be said about the effect 
# comparing 8 and 4 cylinders after looking at models with and without weight included?

fitnoa <- lm(mpg ~ as.factor(cyl), mtcars)

summary(fit)$coef
summary(fitnoa)$coef

# 3. Consider the \verb|mtcars|mtcars data set. Fit a model with mpg as the 
# outcome that considers number of cylinders as a factor variable and weight as 
# confounder. Now fit a second model with mpg as the outcome model that considers 
# the interaction between number of cylinders (as a factor variable) and weight. 
# Give the P-value for the likelihood ratio test comparing the two models and 
# suggest a model using 0.05 as a type I error rate significance benchmark.

fit_inter <- lm(mpg ~ as.factor(cyl) + wt + as.factor(cyl)*wt , mtcars)
anova(fit, fit_inter, test = "Chisq")

# The P-value is larger than 0.05. So, according to our criterion, we would fail 
# to reject, which suggests that the interaction terms may not be necessary.

# 4. Consider the \verb|mtcars|mtcars data set. Fit a model with mpg as the 
# outcome that includes number of cylinders as a factor variable and weight 
# included in the model as: 

fit_2 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)

# 5. Consider the following data set

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit <- lm(y ~ x)
hatvalues(fit)

# 6. Consider the following data set

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit <- lm(y ~ x)
dfbetas(fit)








































