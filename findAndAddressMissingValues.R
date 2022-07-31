"This script will handle the initial steps - for example, finding missing values in the datasheet"

#@author Kal Tadesse

#Date Created: 07/29/2022

#For reading EXCEL files -
library(readxl)

#A function that will handle phase one of the CRISP-DM process.
#@param pathToSource - this is path to data source we want to clean.
findAndAddressMissingValues <- function(pathToSource) {
    #Print and check if the working directory is what we need
    print(getwd())

    #if the desired directory is not the current one - uncomment this block and enter the desired one.
    #setwd("")

    #For this project input type is assumed to be an excel format, hence, we need to convert it to csv format first.
    data <- read_excel(pathToSource)

    #This is where we create vector of excel files to be read.
    files.to.read = list.files(pattern="xlsx")

    #Convert the sheets one by one
    lapply(files.to.read, function(f) {
      df = read_excel(f, sheet = 1)
      write.csv(data, gsub("xlsx", "csv", f), row.names=FALSE)
    })

    #Print the data
    data

    #If need be run a summary for the data - this may or may not serve descriptive statics for the data - We should always find a better way in order to do descriptive statistics - sometimes rattle() may be the best choice for data exploration.
    summary(data)

    #Not ideal when dataset is huge but the below line will give us a vecor of TRUE or FALSE values for missing parts of the data
    is.na(data)

    #List of rows with missing data
    data[!complete.cases(data),]

    #This line will create a dataset without the missing values.
    dataWithoutMissingValues <- na.omit(data)

    #Summarize the data
    summary(dataWithoutMissingValues)
    
    #Return the data without missing values
    return(dataWithoutMissingValues)
}
