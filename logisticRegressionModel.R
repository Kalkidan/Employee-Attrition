"This script will handle correlation and modeling phase"

#@author Kal Tadesse

#Date Created: 07/29/2022

#Import selection script
source("selection.R")

#This block of function will carry out the modeling aspect of the CRISP-DM step using logistic regression.
logisticRegressionModel <- function() {
    #Get the cleaned and srubbed final training data version.
    cleanedAndScrubbedData <- selection('/Users/kal/Downloads/Attrition-Proj1EmpAttrTrain.xlsx')

    #Uncomment this block if you want to see what the final srubbed data will look like. The line will export it as a csv file.
    #write.csv(cleanedAndScrubbedData, "/Users/kal/Downloads/CleanedAttritionData.csv", row.names = FALSE)

    #Perform logistic regression on the training data set.
    logisticallyRegressedData <- glm(Attrition ~ Age + DailyRate + DistanceFromHome + Education + EnvironmentSatisfaction + Gender + HourlyRate + JobInvolvement + JobLevel + JobSatisfaction + MaritalStatus + MonthlyIncome + MonthlyRate + NumCompaniesWorked + OverTime + PercentSalaryHike + PerformanceRating + RelationshipSatisfaction + StockOptionLevel + TotalWorkingYears + TrainingTimesLastYear + WorkLifeBalance + YearsAtCompany + YearsInCurrentRole + YearsSinceLastPromotion + YearsWithCurrManager, family = "binomial", data = cleanedAndScrubbedData)
    
    #Return the logistic regression model data frame
    return(logisticallyRegressedData)
}
