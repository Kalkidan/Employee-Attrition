"This script will Selection phase - usually, referred to as Feature Selection in the Data Scrubbing process"

#@author Kal Tadesse

#Date Created: 07/29/2022

#Load scripts needed
source("findAndAddressMissingValues.R")
source("utility.R")

#This block of function takes care of the feature selection phase when called from anywhere on any given EXCEL data
#@param file path of the data to be cleaned. 
selection <- function(filePath) {
    
    #Step - 1 Find and Address Missing Values
    dataWithoutMissingValues <- findAndAddressMissingValues(filePath)

    #Step - 2 Make the data ready for logistic regression - take out all the columns that we deemed not important in the prediction process. 
    dataReadyForLogisticRegression <- subset(dataWithoutMissingValues, select = - c(BusinessTravel, Department, EducationField, EmployeeCount, EmployeeNumber, JobRole, Over18, StandardHours))

    #Step - 3 Classify categorical values as factors and change them to numerical values when they are originally characters. This ensures that we have only numberical values in the logistic regression phase.

    #ATTRITION
    dataReadyForLogisticRegression$Attrition <- ifelse(dataReadyForLogisticRegression$Attrition == "Yes", 1, 0)
    dataReadyForLogisticRegression$Attrition <- factor(dataReadyForLogisticRegression$Attrition)
    as.numeric(dataReadyForLogisticRegression$Attrition)
    
    #EDUCATION
    dataReadyForLogisticRegression$Education <- factor(dataReadyForLogisticRegression$Education)
    as.numeric(dataReadyForLogisticRegression$Education)

    #ENVIRONMENT SATISFACTION
    dataReadyForLogisticRegression$EnvironmentSatisfaction <- factor(dataReadyForLogisticRegression$EnvironmentSatisfaction)
    as.numeric(dataReadyForLogisticRegression$EnvironmentSatisfaction)

    #GENDER
    dataReadyForLogisticRegression$Gender <- ifelse(dataReadyForLogisticRegression$Gender == "Female", 1, 0)
    dataReadyForLogisticRegression$Gender <- factor(dataReadyForLogisticRegression$Gender)
    as.numeric(dataReadyForLogisticRegression$Gender)

    #JOB INVOLVEMENT
    dataReadyForLogisticRegression$JobInvolvement <- factor(dataReadyForLogisticRegression$JobInvolvement)
    as.numeric(dataReadyForLogisticRegression$JobInvolvement)

    #JOB LEVEL
    dataReadyForLogisticRegression$JobLevel <- factor(dataReadyForLogisticRegression$JobLevel)
    as.numeric(dataReadyForLogisticRegression$JobLevel)

    #JOB SATISFACTION
    dataReadyForLogisticRegression$JobSatisfaction <- factor(dataReadyForLogisticRegression$JobSatisfaction)
    as.numeric(dataReadyForLogisticRegression$JobSatisfaction)

    #MARITAL STATUS
    dataReadyForLogisticRegression$MaritalStatus <- ifelse(dataReadyForLogisticRegression$MaritalStatus == "Single", 0, ifelse(dataReadyForLogisticRegression$MaritalStatus == "Married", 1, ifelse(dataReadyForLogisticRegression$MaritalStatus == "Divorced", 2, 3
    )))
    dataReadyForLogisticRegression$MaritalStatus <- factor(dataReadyForLogisticRegression$MaritalStatus)
    as.numeric(dataReadyForLogisticRegression$MaritalStatus)

    #OVERTIME
    dataReadyForLogisticRegression$OverTime <- ifelse(dataReadyForLogisticRegression$OverTime == "Yes", 1, 0)
    dataReadyForLogisticRegression$OverTime <- factor(dataReadyForLogisticRegression$OverTime)
    as.numeric(dataReadyForLogisticRegression$OverTime)
    
    #PERFORMANCE
    dataReadyForLogisticRegression$PerformanceRating <- factor(dataReadyForLogisticRegression$PerformanceRating)
    as.numeric(dataReadyForLogisticRegression$PerformanceRating)
    
    #RELATIONSHIP SATISFACTION
    dataReadyForLogisticRegression$RelationshipSatisfaction <- factor(dataReadyForLogisticRegression$RelationshipSatisfaction)
    as.numeric(dataReadyForLogisticRegression$RelationshipSatisfaction)
    
    #STOCK OPTIONS
    dataReadyForLogisticRegression$StockOptionLevel <- factor(dataReadyForLogisticRegression$StockOptionLevel)
    as.numeric(dataReadyForLogisticRegression$StockOptionLevel)
    
    #WORKLIFE BALANCE
    dataReadyForLogisticRegression$WorkLifeBalance <- factor(dataReadyForLogisticRegression$WorkLifeBalance)
    as.numeric(dataReadyForLogisticRegression$WorkLifeBalance)

    #Print all the names of the columns of the newly ready for logistic regression data frame.
    printAllTheNamesOfColumns(dataReadyForLogisticRegression)
        
    #Return the cleaned and scrubbed data. 
    return(dataReadyForLogisticRegression)
}


