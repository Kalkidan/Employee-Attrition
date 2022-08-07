"This script will deal with only predicting the attrition when new dataset is given to the model upon deployment"

library(caTools)
library(ROCR)
library(dplyr)
library(ggplot2)
library(MASS)

#@author Kal Tadesse

#Date Created: 07/29/2022

#Import the script we need
source("logisticRegressionModel.R")

#Get the model which we will use to predict attrition using testing/verification data - this can also be production data input. In General, new data is fed here to test the model.
model <- logisticRegressionModel()

#Summarize the model - z scores, coefficients, p values and etc are addressed with the summary
summary(model)

#Prepare cleaned and scrubbed test data
cleanedTestData <- selection('/Users/kal/Downloads/Attrition-Proj1EmpAttrVerify.xlsx')

#Get prediction matrix for test data based on the model we estabilished
predictWithNewData <- predict(model, cleanedTestData, type = "response")

#Get probabilities for Overtime more than 0.5 - meaning, we will use it as an input for our confusion matrix
predictionProbability <- ifelse(predictWithNewData > 0.5, 1, 0)

#OverTime - Confusion Matrix - gives us true positives and negatives as well as false positives and negatives
table(cleanedTestData$Attrition, predictionProbability)

#Find accuracy for the attrition predictive based on attrition
missingClassError <- mean(predictionProbability != cleanedTestData$Attrition)
print(paste('Accuracy =', 1 - missingClassError))

#ROC and AUC curve
rocPrediction <- prediction(predictionProbability, cleanedTestData$Attrition)
rocPredictedPerformance <- performance(rocPrediction, measure = "tpr", x.measure = "fpr")

aucPerfomrance <- performance(rocPrediction, measure = "auc")
aucPerfomrance <- aucPerfomrance@y.values[[1]]

#aucPerfomrance

pred <- performance(rocPrediction, "lift", "rpp")

#uncomment this line to draw lift 
#Plotting different curves
#plot(pred, colorize = TRUE, main = "Lift Curve - Attrition")
plot(rocPredictedPerformance, colorize = TRUE, print.cutoffs.at = seq(0.1, by = 0.1), main = "ROC CURVE - Attrition")
abline(a = 0, b = 1)

aucPerfomrance <- round(aucPerfomrance, 4)
legend(0.6, 0.4, aucPerfomrance, title = "AUC - Attrition", cex = 1)
