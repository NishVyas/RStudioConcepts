# Linear regression
# Lets load the MASS package (very large collection of data sets/functions)
# Also load ISLR package (includes datasets associated with textbook)
library(MASS)
library(ISLR)
library(ggplot2)

# Lets work with Simple Linear Regression first
# MASS contains the "Boston" data set
# Lets try to predict medv (median house value) using 13 predictors

fix(Boston)
names(Boston)

# Lets fit a simple linear regression using lm()
# "medv" is the response and "lstat" (% of households with low socioeconomic incomes) as the predictor

lm.fit = lm(medv~lstat, data=Boston)
lm.fit
summary(lm.fit)

# To obtain confidence interval for the coefficient estimates, use confint()

confint(lm.fit)

# predict() function can be used to produce CI's and prediction intervals for the prediction of medv for
# given value of lstat

predict(lm.fit, data.frame(lstat=c(5, 10, 15)), interval = "confidence")
# So we see from the output, the 95% CI associated w/ the lstat value of 10 is (24.47, 25.63)
predict(lm.fit, data.frame(lstat=c(5, 10, 15)), interval = "prediction")
# The 95% prediction interval from above for a lstat value of 10 is (12.828, 37.28)

# Lets plot "medv" and "lstat" w/ the least squares regression line using plot() and abline()
plot(Boston$medv, Boston$lstat)
abline(lm.fit, col = "red")

# There is evidence for non-linearity in relationship between lstat and medv, we shall discuss this later
# Lets look at diagnostics plots 