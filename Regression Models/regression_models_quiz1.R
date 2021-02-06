## Question 1: 

x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

## Give the value of \muμ that minimizes the least squares equation
sum(x * w) / sum(w)

## Question 2: 
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

## Fit the regression through the origin and get the slope treating y as the 
## outcome and x as the regressor. (Hint, do not center the data since we want 
## regression through the origin, not through the means of the data.)

my_mod <- lm(y ~ x - 1)
coef(my_mod)

## OR

sum(y * x)/sum(x^2)

## Question 3: 
data(mtcars)

## Do \verb|data(mtcars)|data(mtcars) from the datasets package and fit the regression
## model with mpg as the outcome and weight as the predictor. Give
## the slope coefficient.

my_mod <- lm(mpg ~ wt, data = mtcars)

## OR

cor(mpg, wt) * sd(mpg)/sd(wt)

## Question 4: Consider data with an outcome (Y) and a predictor (X). 
## The standard deviation of the predictor is one half that of the outcome. The correlation between the two variables is .5.
## What value would the slope coefficient for the regression model with YY as the outcome and XX as the predictor?

## Note it is given that sd(Y) / sd(X)=2sd(Y)/sd(X)=2 and \mathrm{Cor(Y, X)} = 0.5Cor(Y,X)=0.5.

## Therefore, we know that the regression coefficient would be:
## \mathrm{Cor}(Y, X) \frac{sd(Y)}{sd(X)} = 0.5 \times 2 = 1

sx <- 0.5
sy <- 1
cor <- .5
cor * sy / sx

## Question 5: Students were given two hard tests and scores were normalized to 
## have empirical mean 0 and variance 1. The correlation between the scores on 
## the two tests was 0.4. What would be the expected score on Quiz 2 for a 
## student who had a normalized score of 1.5 on Quiz 1?
1.5 * 0.4

## Question 6: What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
sd <- sd(x)
xn <- (x - mean(x))/sd(x)

## Question 7: What is the intercept for fitting the model with x as the predictor and y as the outcome?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

my_mod <- lm(y ~ x)

## Question 8: You know that both the predictor and  response have mean 0. What
## can be said about the intercept when you fit a linear regression?

## The intercept estimate is $\bar Y - \beta_1 \bar X$ and so will be zero.

## Question 9: 

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
## What value minimizes the sum of the squared distances between these points and itself?

## This is the least squares estimate, which works out to be the mean in this case.
mean(x)

## Question 10: Let the slope having fit Y as the outcome and X as the predictor be denoted as  \beta_1 β 
## Let the slope from fitting X as the outcome and Y as the predictor be denoted as  \gamma_1 γ 
## Suppose that you divide \beta_1β  by \gamma_1γ 
## in other words consider  \beta_1 / \gamma_1 β 
## /γ1
## What is this ratio always equal to?

# The  \beta_1 = Cor(Y, X) SD(Y) / SD(X) β1=Cor(Y,X)SD(Y)/SD(X) and  \gamma_1= Cor(Y, X) SD(X) / SD(Y) γ1
# =Cor(Y,X)SD(X)/SD(Y).
# 
# Thus the ratio is then  Var(Y) / Var(X) Var(Y)/Var(X).
