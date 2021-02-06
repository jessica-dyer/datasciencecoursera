## 1. Consider the following data with x as the predictor and y as as the outcome.
  x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
  y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
  
  fit <- lm(y ~ x)

## 2. Consider the previous problem, give the estimate of the residual standard deviation.

  summary(fit)$sigma
  sqrt(sum(resid(fit)^2) / (9-2))

## 3. In the \verb|mtcars|mtcars data set, fit a linear regression model of 
## weight (predictor) on mpg (outcome). Get a 95% confidence interval for the 
## expected mpg at the average weight. What is the lower endpoint?

  data("mtcars")
  
  fit <- lm(mpg ~ wt, mtcars)
 
  newwt= data.frame(wt=c(mean(mtcars$wt)))
  
  # print out confidence interval for beta1 in 1/10 units
  predict(fit, newdata = newwt, interval = ("confidence"))
  
## 4. Refer to the previous question. Read the help file for \verb|mtcars|mtcars. 
## What is the weight coefficient interpreted as?
  
  # Weight (1000 lbs)
  
## 5. Consider again the \verb|mtcars|mtcars data set and a linear regression 
## model with mpg as predicted by weight (1,000 lbs). A new car is coming 
## weighing 3000 pounds. Construct a 95% prediction interval for its mpg. 
## What is the upper endpoint?
  predict(fit, data.frame(wt = 3), interval = ("prediction"))
  
## 6. Consider again the \verb|mtcars|mtcars data set and a linear regression model 
## with mpg as predicted by weight (in 1,000 lbs). A “short” ton is defined as 
## 2,000 lbs.  Construct a  95% confidence interval for the expected change in 
## mpg per 1 short ton increase in weight. Give the lower endpoint.
  (sumCoef[2,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[2, 2])*2
  
## 9. Refer back to the mtcars data set with mpg as an outcome and weight (wt) 
## as the predictor. About what is the ratio of the the sum of the squared errors,  
## \sum_{i=1}^n (Y_i - \hat Y_i)^2 ∑ 
## when comparing a model with just an intercept (denominator) to the model 
## with the intercept and slope (numerator)?

  fit4 <- lm(mpg~wt,data=mtcars)
  fit5 <- lm(mpg~1,data=mtcars)
  
  num <- sum((predict(fit4)-mtcars$mpg)^2)
  den <- sum((predict(fit5)-mtcars$mpg)^2)
  num/den


