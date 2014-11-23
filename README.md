Getting_Cleaning_Data_Course_Project
====================================

This repo contains script related to the course project and also instructions to use it.

Working details of run_analysis.R
----------------------------------

At a high level, there are 3 main user defined functions in this script:

- **getSourceData**
    
    Since the structure of training and test data files are same, the logic to read and process the data files are packaged into this function
    
- **getTidyData**
    
    This function makes use of reshape2 package to prepare the required tidy dataset

- **getProperColumnNames**

    This function does string manipulation to generate proper column names
    
**Key things to look for**

- Usage of Regular expression on the column names using **grep** to generate a logical vector of the columns we are interested in.
- Usage of **rbind, cbind** functions to combine rows and columns of data frames
- Usage of **merge** function to join data and the associated labels by using common column name LabelId
- Data common to both test and training are read only once in the beginning of the script and used as **free variables** in the getSourceData function

I have given enough inline comments in the script file to follow the code logic.


Prerequisites
-------------
Download the data required for the analysis from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip the contents of the zip file into a local folder

Set the working directory of R environment to the local folder containing the unzipped data 

