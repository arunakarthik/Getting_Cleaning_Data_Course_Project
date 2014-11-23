#read the list of all features
allFeatures <- read.table("features.txt", header=FALSE, as.is=TRUE, col.names=c("FeatureId", "FeatureName"))

#We are only interested in measurement columns containing Mean and Standard deviation. 
#Use grep to create a logical vector identifying those columns
requiredFeatures <- grep(".*mean\\(\\)|.*std\\(\\)", allFeatures$FeatureName)

#read the activity label and name required for linking with the main data set
activityLabels <- read.table("activity_labels.txt", header=FALSE, as.is=TRUE, col.names=c("LabelId", "ActivityName"))

#Since the structure of training and test data files are same, same code can be used to read 
#the training and test data files. getSourceData function is written to achieve that. allFeatures and requiredFeatures are free variables
#which are read only once in the calling environment (uses lexical scoping feature of R)
getSourceData <- function(dataFilePath, labelsFilePath, subjectsFilePath)
{
    #read the labels (this dataset has only one column - name it as LabelId)
    labels <- read.table(labelsFilePath, header=FALSE, col.names=c("LabelId"))
    
    #read the subjects (this dataset has only one column - name it as SubjectId)
    subjects <- read.table(subjectsFilePath, header=FALSE, col.names=c("SubjectId"))
    
    #read the main data and supply the column names using the allFeatures
    mainData <- read.table(dataFilePath, header=FALSE, col.names=allFeatures$FeatureName)
    
    #grab only the required features data
    requiredData <- mainData[, requiredFeatures]
    
    #use the cbind function to attach the labels and subjects to the main data set
    requiredData <- cbind(requiredData, labels, subjects)
    
    requiredData
}

#read the training data by passing relevant data files path to the getSourceData function
trainingData <- getSourceData("train\\X_train.txt", "train\\y_train.txt", "train\\subject_train.txt")

#read the test datas by passing relevant data files path to the getSourceData function
testData <- getSourceData("test\\X_test.txt", "test\\y_test.txt", "test\\subject_test.txt")

#use the rbind function to merge both training and test data
mergedData <- rbind(trainingData, testData)

#use the merge function to associate activity labels to the dataset. Since we have used the common name LabelId, 
#merge function automatically detects and uses it for the join operationa
labeledData <- merge(mergedData, activityLabels)

#This function returns new columns names by replacing the letters of mean & std with proper casing as Mean & Std 
#and also removing the periods.
getProperColumnNames <- function(data)
{
	cnames <- colnames(data)
	cnames <- gsub("\\.+mean\\.+", cnames, replacement="Mean")
	cnames <- gsub("\\.+std\\.+",  cnames, replacement="Std")
	
	cnames
}

colnames(labeledData) <- getProperColumnNames(labeledData)

#This function takes the labeledData as input and uses the functionality in reshape2 package
# to create the tidy data set with the mean of each variable for each activity and each subject
getTidyData <- function(data)
{
    library(reshape2)
    
    idColumnNames <- c("LabelId", "SubjectId", "ActivityName")
    measureColumnNames <- setdiff(colnames(data), idColumnNames)
    
    meltedData <- melt(data, id=idColumnNames, measure.vars=measureColumnNames)
    tidyData <- dcast(meltedData, ActivityName + SubjectId ~ variable, mean)
    
    tidyData
}

tidyData <- getTidyData(labeledData)
write.table(tidyData, "TidyData.txt", row.name=FALSE)
