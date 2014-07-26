### Introduction

This repository contains a file with an R script to perform the analysis requested for the Project of the course 'Getting and Cleaning Data'

Files in repository:

1. run_analysis.R - the R script with commands to perform the analysis
2. tidy.txt - the output file with the result of the analysis

### run_analysis.R

It then loads the features data from a file and proceeds to remove all the entries that do not refer to a standard deviation or a mean. This is achieved by selecting only the columns that have '-std()' or '-mean()' as a substring. It also replaces all '-' with '.'.

It creates a data frame called `selected.features` whose columns contain the index of the feature in the original feature name data, the original name and the updated name where '-' have been replaced with '.'. This data frame is later used to filter columns from the test and training data sets.

The main function in the script is `loadAndProcessData`. It loads feature data, activity and subject data from files, removes the columns that are of no interest and builds and returns a single data frame with the concatenation of those 3 data sets. 

The function is then used to load and transform both the training and test data sets into the data frames `train.df` and `test.df`, respectively. These data frames are then combined into a single data frame `full.df`.

The final step aggregates the data in `full.df` by first using the `melt` function from the `reshape2` package to facilitate aggregation (in this case calculating the mean) by subject and activity for each of the mean and standard deviation columns. 

The aggregated data is stored in the `tidy` data frame whose columns are sorted in the order: subject, activity, feature, mean. This data frame is then written to a file using the `write.table` function. The file was then uploaded manually to the Coursera project submission page.

