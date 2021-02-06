# 1. Consider the space shuttle data \verb|?shuttle|?shuttle in the \verb|MASS|MASS 
# library. Consider modeling the use of the autolander as the outcome (variable 
# name \verb|use|use). Fit a logistic regression model with autolander (variable auto) 
# use (labeled as "auto" 1) versus not (0) as predicted by wind sign (variable wind). 
# Give the estimated odds ratio for autolander use comparing head winds, labeled as 
# "head" in the variable headwind (numerator) to tail winds (denominator).

data("shuttle")
head(shuttle)

mod <- glm(use ~ wind, family = binomial, data = shuttle)
summary(mod)
exp(mod$coefficients)

# Quick test to see if the RR calculated with link = log is the same as exponetiating the logit results. 
mod2 <- glm(use ~ wind, family = binomial(link = log), data = shuttle)
exp(mod2$coefficients)

# 2. Consider the previous problem. Give the estimated odds ratio for autolander 
# use comparing head winds (numerator) to tail winds (denominator) adjusting for 
# wind strength from the variable magn.

mod <- glm(use ~ wind + magn, family = binomial, data = shuttle)
exp(mod$coefficients)

# 3. If you fit a logistic regression model to a binary variable, for example 
# use of the autolander, then fit a logistic regression model for one minus the 
# outcome (not using the autolander) what happens to the coefficients?
mod <- glm(use ~ wind, family = binomial, data = shuttle)
mod2 <- glm(1-use ~ wind, family = binomial(link = logit), data = shuttle)

# 4. Consider the insect spray data \verb|InsectSprays|InsectSprays. Fit a Poisson 
# model using spray as a factor level. Report the estimated relative rate comapring 
# spray A (numerator) to spray B (denominator).
data("InsectSprays")
fit <- glm(count ~ relevel(spray, "B"), data = InsectSprays, family = poisson)
exp(coef(fit))[2]


# 6. 

x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)

plot(x, y, frame=FALSE, pch=21, bg="lightblue", cex=2)

l1<-lm(y[1:6]~ x[1:6])$coef
l2<-lm(y[6:11]~ x[6:11])$coef

abline(l1, col="red", lwd=2)
abline(l2, col="red", lwd=2)

knots<-c(0)
splineTerms<-sapply(knots,function(knot) (x>knot)*(x-knot))
xMat<-cbind(1,x,x^2,splineTerms)
xMat2<-cbind(1,x,splineTerms)

yhat<-predict(lm(y~xMat-1))
yhat2<-predict(lm(y~xMat2-1))

lines(x,yhat, col="blue", lwd=2)
lines(x,yhat2, col="green", lwd=2)

legend(x=-1,y=5, c("With lm","With X","With X+X^2"),lty=c(1,1), lwd=c(2.5,2.5),col=c("red", "green","blue"))



