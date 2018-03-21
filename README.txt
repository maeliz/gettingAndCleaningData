==================================================================
Getting and Cleaning Data Final Project
==================================================================
Maria Elizabeth Aldana Diaz
==================================================================

The dataset includes the following files:
=========================================

- 'README.txt'

- UCIHARDataset: Source data for this project.

- ‘tidyDataset.txt’: It is the file uploaded to courser equivalent to summarizedDataset.csv

- ‘completeDataset.txt’: It describes the metrics included in completeDataset.csv

- ’summarizedDataset.txt’: It describes the metrics included in summarizedDataset.csv

- ‘completeDataset.csv’: Shows information about the test and train datasets including the variable, activity descriptors and subjects in the experiment.

- ’summarizedDataset.csv’: Shows mean and standard deviation metrics summarized by activity and subject

- ’runAnalysis.R’: This R script performs the following tasks:

1. Loads the datasets
1.1 Test datasets: subject_test.txt, X_test.txt, y_test.txt
1.2 Train datasets: subject_train.txt, X_train.txt, y_train.txt
1.3 Feature catalog: features.txt
1.4 Activity catalog: activity_labels.txt
2. Sets variables names for subject test dataset
3. Sets variables names for x Test dataset
4. Adds activity description to y Test dataset
5. Sets variables names for y Test dataset
6. Combines 3 Test datasets into a single one
7. Sets variables names for subject train dataset
8. Sets variables names for x Train dataset
9. Adds activity description to y Train dataset
10. Sets variables names for y Train dataset
11. Combines 3 Train datasets
12. Adds a type column to test dataset
13. Adds a type column to train dataset
14. Merge test and train dataset
15. Build a new dataset with measurements on the mean and standard deviation for each 
data set with the average of each variable for each activity and each subject

