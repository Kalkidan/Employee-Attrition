"This script will Selection phase - usually, referred to as Feature Selection in the Data Scrubbing process"

#Load the previous script
source("findAndAddressMissingValues.R")
source("utility.R")

#Step - 1 Run the first step - Find and Address Missing Values
dataWithoutMissingValues <- findAndAddressMissingValues()

#Step - 2 Select the columns that we are interested in for our linear regression.
printAllTheNamesOfColumns(dataWithoutMissingValues)

#Step -3 For this project We will select the 10 most 


