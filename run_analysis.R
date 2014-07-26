# Script Goals:
# 
# 1- Merges the training and the test sets to create one data set.
# 2- Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3- Uses descriptive activity names to name the activities in the data set
# 4- Appropriately labels the data set with descriptive variable names. 
# 5- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# 
# Process features
# 

# Load feature descriptions
features <- read.table("features.txt")

# Subset of feature names which contain '-mean()' or '-std()'since we are only interested in 
# the mean and standard deviation values
selected.features <-features[grep('-mean\\(\\)|-std\\(\\)', features[,2]),]

# generate new column names replacing '-' with '.' and removing '()'
# and add the new names as a column to the selected.features data frame
renameSelectedCol <- function(colName) {
  cname <- gsub('-','.',colName)
  cname <- sub('mean\\(\\)','mean',cname)
  cname <- sub('std\\(\\)','std',cname)
  cname
}
renamedselectedCol <- sapply(selected.features[,2], renameSelectedCol)
selected.features <- cbind(selected.features,renamedselectedCol)
names(selected.features) <- c('index', 'original', 'renamed')


transformFeatureData <- function(feature.data, selected.feature.variables) {  
  # reduce columns to selected columns
  feature.data.reduced <- feature.data[,selected.feature.variables$index]
  # rename the columns
  names(feature.data.reduced) <- selected.feature.variables$renamed
  feature.data.reduced
}

# 
# Loading and processing feature data
# 


# This function loads the subject, activities and features data from 3 different files and returns
# a data frame that contains those 3 data sets but removes all columns that have no '-mean()' or '-std()' 
# in the name. It also renames all the columns from the format '-xxx()-' to '.xxx.'
# Parameters:
#   subjects.fname - the file name with single column subjects data
#   activities.fname - the file name with single column activities data
#   feature.data.fname - the filename with the feature data
#   selected.feature.names - a dataframe with column names corresponding to selected values and the index of those columns
#       in the feature.data.fname data
#  
loadAndProcessData <- function(subjects.fname, activities.fname, feature.data.fname, selected.feature.names) {
  loadSubjects <- function(fname) {
    subjects <- read.table(fname)
    names(subjects) <- "subject"
    subjects$subject <- as.factor(subjects$subject)
    subjects
  }
  
  loadActivities <- function(fname) {
    activities.names <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
    activities <- read.table(fname)
    names(activities) <- "activity"
    activities$activity <- as.factor(activities$activity)
    levels(activities$activity) <- activities.names
    activities
  }
  
  subjects <- loadSubjects(subjects.fname)
  activities <- loadActivities(activities.fname)
  feature.data <- read.table(feature.data.fname, stringsAsFactors=FALSE)
  feature.data.transformed <- transformFeatureData(feature.data, selected.feature.names)
  # merge all test data into a single data frame
  feature.data.full <- cbind(feature.data.transformed, subjects, activities)
  feature.data.full
}

# Load Test data
test.df <- loadAndProcessData("subject_test.txt", "Y_test.txt", "X_test.txt", selected.features)
train.df <- loadAndProcessData("subject_train.txt", "y_train.txt", "X_train.txt", selected.features)

# Create a single data set from training and test data
full.df <- rbind(train.df, test.df)


# 
# prepare tidy data set to submit 
#  
library(reshape2)

numerical.cols = names(full.df)[1:66]
melted.data <- melt(full.df, id=c('subject','activity'), measure.vars=numerical.cols)
agg <- aggregate(value ~ variable + activity + subject, melted.data, mean)
# re-order columns
tidy <- agg[, c(3,2,1,4)]
names(tidy) <- c(names(tidy)[1:3],"mean")

# write tidy data to file
write.table(tidy, file = "tidy.txt", sep = ",")

