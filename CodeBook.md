### Introduction

This file describes the data in the file tidy.txt


### Columns in tidy.txt
This file contains a table with the following columns:

* `subject` - an integer number of the subject performing the experiment;
** s
* `activity` - a descriptive value of the activity being performed one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING;
* `variable` - The variable whose values have been aggregated by `subject` and `activity`;
* `mean` - the mean value of a feature whose name is described in the column `variable`

### Data Transformations
* The feature names in the column `variable` have been modified to make them more readable: '()' were removed and '-' were replaced with '.'
* The activity values were converted to factors and instead of the numerical values, the descriptions were used instead in the column `activity`
