Getting and Cleaning Data - Project
===================================

This repository contains the work done for Coursera's <b>Getting and Cleaning Data</b> project.

The <b><code>run_analysis.R</code></b> script contains the <b>R</b> code for creating a tidy data set from the raw data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The data contains measurements values from subjects performing various activities namely <i>walking</i>, <i>walking upstairs</i>, <i>walking downstairs</i>, <i>sitting</i>, <i>standing</i> and <i>laying</i>, while wearning the  computing devices. 

## Pre-requisite

The raw data must be available for the script to create the tidy data set.

## Script Details

* The train sets are read and the data contained in the <i>subject_train.txt</i>, <i>X_train.txt</i> & <i>y_train.txt</i> are read and merged into a single data frame. The colums are labeled appropriately.
* The test sets are read and the data contained in the <i>subject_test.txt</i>, <i>X_test.txt</i> & <i>y_test.txt</i> are read and merged into a single data frame. The colums are labeled appropriately.
* The train and the test data sets are merged together to create a single data set named <code>tidy</code>.
* Next the activity lables are applied to the dataset named <code>labled_tidy</code>
* A seperate data set containing the standard deviation and mean values is created and named as <code>std_mean_tidy</code>
* Another dataset is created with the average values of the variables on a per-subject basis and named <code>mean_df</code>
* For all the above data sets, the top three rows are displayed after the data set is created.
* Finally, the data sets are dumped into csv files named <i>tidy_data.csv</i>, <i>std_mean.csv</i> and <i>mean_subject.csv</i>

## Steps to execute

1. Download the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Extract the downloaded data set in the directory containing the <b>run_analysis.R</b> script.
3. After extraction, you should have a directory named <b>UCI HAR Dataset</b> in the same directory as the script.
4. Execute the script either from the <b>R</b> console or <b>R-studio</b>.
