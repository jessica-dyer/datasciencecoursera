# In a study of emergency room waiting times, investigators consider a new and the standard triage systems. 
# To test the systems, administrators selected 20 nights and randomly assigned the new triage system to be 
# used on 10 nights and the standard system on the remaining 10 nights. They calculated the nightly 
# median waiting time (MWT) to see a physician. The average MWT for the new system was 3 hours with a 
# variance of 0.60 while the average MWT for the old system was 5 hours with a variance of 0.68. Consider 
# the 95% confidence interval estimate for the differences of the mean MWT associated with the new system. 
# Assume a constant variance. What is the interval? Subtract in this order (New System - Old System). 

n_y <- 10 # nights new system
n_x <- 10 # nights old system
var_y <- 0.60 # variance new (sqrt of σ)
var_x <- 0.68 # variance old (sqrt of σ)
μ_y <- 3# average hours new system
μ_x <- 5# average hours old system

sp <- round(sqrt((9*.6 + 9 * .68) / (9+9-2)), 1)
σ_p <- sqrt(((n_x - 1) * var_x + (n_y - 1) * var_y)/(n_x + n_y - 2))

confidenceInterval <- μ_y - μ_x + c(-1, 1) * qt(.975, df=n_y+n_x-2) * σ_p * (1 / n_x + 1 / n_y)^.5
round(confidenceInterval,2)

quantile = 0.95 # is 95% with 2.5% on both sides of the range

n1 <- n2 <- 9
x1 <- -3 ##treated
x2 <- 1 ##placebo
s1 <- 1.5 ##treated
s2 <- 1.8 ##placebo
s <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))
(x1 - x2) + c(-1, 1) * qt(0.95, n1 + n2 - 2) * s * sqrt(1/n1 + 1/n2)




