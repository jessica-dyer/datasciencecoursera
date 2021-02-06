fit <- lm(wt ~ mpg, mtcars)

cor1 <- cor(mtcars$wt, mtcars$mpg)
sdx <- sd(mtcars$mpg)
sdy <- sd(mtcars$wt)

b1 <- cor(mtcars$wt, mtcars$mpg)*(sdy/sdx)

#simulate the data
n = 100; x = rnorm(n); x2 = rnorm(n); x3 = rnorm(n)
# equation = intercept + var1 + var2 + var3 + error
y = 1 + x + x2 + x3 + rnorm(n, sd = .1)
# residual of y regressed on var2 and var3
ey = resid(lm(y ~ x2 + x3))
# residual of y regressed on var2 and var3
ex = resid(lm(x ~ x2 + x3))
# estimate beta1 for var1
sum(ey * ex) / sum(ex ^ 2)

cor(y, x)*(sd(y)/sd(x))

fit <- lm(y ~ x)
summary(fit)

require(datasets); data(swiss); require(GGally)
# produce pairwise plot using ggplot2
ggpairs(swiss, lower = list(continuous = "smooth"),wrap = c(method = "loess"))

swiss = mutate(swiss, CatholicBin = 1 * (Catholic > 50))