# getting-and-cleaning-data
Couresra Course: Getting and Cleaning Data

Assignment Submission Files
- [data](https://github.com/prashanthrao19/getting-and-cleaning-data/tree/master/data)
- [run_analysis.R](https://github.com/prashanthrao19/getting-and-cleaning-data/blob/master/run_analysis.R)
- [README.md](https://github.com/prashanthrao19/getting-and-cleaning-data/blob/master/README.md)
- [CookBook.md](https://github.com/prashanthrao19/getting-and-cleaning-data/blob/master/Code%20Book.MD)
- [merged-tidy-data](https://github.com/prashanthrao19/getting-and-cleaning-data/blob/master/merged_tidy_data.txt)
- [calculated-tidy-data](https://github.com/prashanthrao19/getting-and-cleaning-data/blob/master/calculated_tidy_data.txt)

Instructions

Download the data set, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzip the data set into YOURDIRECTORY and you should see a folder named UCI HAR Dataset in YOURDIRECTORY

rename Floder UCI HAR Dataset to Data

Load RStudio and set your working directory using setwd("YOURDIRECTORY")

Load the R script using source("run_analysis.R")

Run the R script using run_analysis() and after execution of the function has finished, you will see that merged_tidy_data.txt and calculated_tidy_data.txt would have been replaced with the newest outputs.

Dependencies

The R script assumes you have 'data.table' installed using install.packages("data.table")
More Information

For more information on the data set, please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
