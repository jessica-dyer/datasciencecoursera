library(ISLR); library(ggplot2); library(caret); library(sjPlot); library("PerformanceAnalytics")
data(Wage)

wage <- subset(Wage, select = -c(logwage))

summary(wage)

set.seed(342)
in_train <- createDataPartition(y = wage$wage, 
                                p = 0.7, 
                                list = FALSE)

train <- wage[in_train, ]
test <- wage[-in_train, ]

## FEATURE PLOT

p <- featurePlot(x = train[, c("age", "education", "jobclass")],
                 y = train$wage,
                 plot = "pairs")

train$race_factor <- as.numeric(train$race)
train$edu_fact <- 

chart.Correlation(train[, c("age", "wage", "race_factor")], 
                  histogram=TRUE, pch=19)

## QUIZ 2

## QUESTION 1
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)
testIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[-testIndex,]
testing = adData[testIndex,]

## QUESTION 2
## Make a plot of the outcome (CompressiveStrength) versus the index of the samples. 
## Color by each of the variables in the data set (you may find the cut2() function 
## in the Hmisc package useful for turning continuous covariates into factors). 
## What do you notice in these plots? 

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

## CREATE FACTORS FROM CONTINUOUS COVARIATES

cov <- names(testing)
# cov <- cov[-9]

training$age_bin <- cut2(training$Age, g = 4)

corr <- chart.Correlation(training[,cov], histogram=TRUE, pch=19)

ggplot(training, aes(x = index(training), y = CompressiveStrength, color = age_bin)) + 
  geom_point()

## QUESTION 3

## Make a histogram and confirm the SuperPlasticizer variable is skewed. 
## Normally you might use the log transform to try to make the data more symmetric. 
## Why would that be a poor choice for this variable?

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

hist(training$Superplasticizer)
training$log_super <- log(training$Superplasticizer + 1)
hist(training$log_super)

## QUESTION 4 

## Find all the predictor variables in the training set that begin with IL. 
## Perform principal components on these variables with the preProcess() function 
## from the caret package. Calculate the number of principal components needed 
## to capture 90% of the variance. How many are there?

library(caret)
library(AppliedPredictiveModeling)
library(dplyr)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

## Of 130 variables, find all the variables that begin with IL
names <- names(training)
il_names <- grep('^IL', names) ## Returns the index where these variables exist
df <- training %>% select(all_of(il_names))
diag <- training$diagnosis
df <- cbind(df, diag)

df_pca <- preProcess(df, method = "pca", thresh = 0.9)
df_pca

## QUESTION 5
library(caret)
library(AppliedPredictiveModeling)

RNGversion("3.0.0")

set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

# Return all columns that start with 'IL' and diagnosis in the traning and testing set
trainingIL <- training[,grep("^IL|diagnosis", names(training))]

testingIL <- testing[,grep("^IL|diagnosis", names(testing))]

# non-PCA
model <- train(diagnosis ~ ., data = trainingIL, method = "glm")

predict_model <- predict(model, newdata = testingIL)

matrix_model <- confusionMatrix(predict_model, testingIL$diagnosis)

matrix_model$overall[1]

## PCA
modelPCA <- train(diagnosis ~., data = trainingIL, 
                  method = "glm", 
                  preProcess = "pca",
                  trControl=trainControl(preProcOptions=list(thresh=0.8)))

matrix_modelPCA <- confusionMatrix(testingIL$diagnosis, 
                                   predict(modelPCA, testingIL))
matrix_modelPCA$overall[1]














