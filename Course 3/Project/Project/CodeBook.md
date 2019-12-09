---
title: "Getting and Cleaning Data Project Codebook"
author: "MARIANO MOLINA GARCIA"
date: "05/12/2019"
output:
  pdf_document: default
  html_document: default
---

## Introduction

In this code book file CodeBook.md, the Getting and Cleaning Data Project variables, data, and any transformations or work performed to clean up the data are described.

## Process implemented in the run_analysis.R script to generate the tidy data set

The following steps have been implemented in the run_analysis.R to tidy the data set supplied in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

1) The training and the test sets have been merged to create one data set. A description of the original data can de found in the Readme.md file.
2) As requested, only the measurements on the mean and standard deviation for each measurement have been extracted. 
3) Some names have been modified in order to ensure that descriptive activity names to name the activities in the data set are used.
4) Some names have been modified in order to ensure that the data set is appropiately labeled with descriptive variable names. 
5) A second independent tidy data set have been created and stored in the txt file TidyDataset.txt with the average of each variable for each activity and each subject.
6) Two files TidyDatasetStr.txt and TidyDatasetSummary.txt have been generated, including the structure info and the summary info of the different columns in the tidy data set.

## Info of the columns of the Tidy Data Set

The tidy data consists of 180 observations of  88 variables. Each one of the observations is a combination person_id and activity_id, which are the two first columns of the tidy data set. Ther columns from column 3 onwards contains the calculated mean and standard deviation for different features for all the observations in the original data that corresponds to that person_id and activity_id combination.

 $ person_id                                         : int  1 1 1 1 1 1 2 2 2 2 ...
 
 $ activity_id                                       : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4...
 
 $ timeBodyaccelerometer.mean...X                    : num  0.222 0.261 0.279 0.277 0.289 ...
 
 $ timeBodyaccelerometer.mean...Y                    : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 
 $ timeBodyaccelerometer.mean...Z                    : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
 
 $ timeBodyaccelerometer.std...X                     : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
 
 $ timeBodyaccelerometer.std...Y                     : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 
 $ timeBodyaccelerometer.std...Z                     : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 
 $ timegravityaccelerometer.mean...X                 : num  -0.249 0.832 0.943 0.935 0.932 ...
 
 $ timegravityaccelerometer.mean...Y                 : num  0.706 0.204 -0.273 -0.282 -0.267 ...
 
 $ timegravityaccelerometer.mean...Z                 : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 
 $ timegravityaccelerometer.std...X                  : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
 
 $ timegravityaccelerometer.std...Y                  : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
 
 $ timegravityaccelerometer.std...Z                  : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
 
 $ timeBodyaccelerometerJerk.mean...X                : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
 
 $ timeBodyaccelerometerJerk.mean...Y                : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 
 $ timeBodyaccelerometerJerk.mean...Z                : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 
  $ timeBodyaccelerometerJerk.std...X                 : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
  
 $ timeBodyaccelerometerJerk.std...Y                 : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
 
 $ timeBodyaccelerometerJerk.std...Z                 : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
 
 $ timeBodygyroscope.mean...X                        : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 
 $ timeBodygyroscope.mean...Y                        : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 
 $ timeBodygyroscope.mean...Z                        : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
 
 $ timeBodygyroscope.std...X                         : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
 
 $ timeBodygyroscope.std...Y                         : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 
 $ timeBodygyroscope.std...Z                         : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
 
 $ timeBodygyroscopeJerk.mean...X                    : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 
 $ timeBodygyroscopeJerk.mean...Y                    : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 
 $ timeBodygyroscopeJerk.mean...Z                    : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 
 $ timeBodygyroscopeJerk.std...X                     : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
 
 $ timeBodygyroscopeJerk.std...Y                     : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
 
 $ timeBodygyroscopeJerk.std...Z                     : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
 
 $ timeBodyaccelerometermagnitude.mean..             : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 
 $ timeBodyaccelerometermagnitude.std..              : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 
 $ timegravityaccelerometermagnitude.mean..          : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 
 $ timegravityaccelerometermagnitude.std..           : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 
 $ timeBodyaccelerometerJerkmagnitude.mean..         : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 
 $ timeBodyaccelerometerJerkmagnitude.std..          : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 
 $ timeBodygyroscopemagnitude.mean..                 : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 
 $ timeBodygyroscopemagnitude.std..                  : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
 
 $ timeBodygyroscopeJerkmagnitude.mean..             : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
 
 $ timeBodygyroscopeJerkmagnitude.std..              : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
 
 $ frequencyBodyaccelerometer.mean...X               : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 
 $ frequencyBodyaccelerometer.mean...Y               : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 
 $ frequencyBodyaccelerometer.mean...Z               : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
 
 $ frequencyBodyaccelerometer.std...X                : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 
 $ frequencyBodyaccelerometer.std...Y                : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
 
 $ frequencyBodyaccelerometer.std...Z                : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
 
 $ frequencyBodyaccelerometer.meanFreq...X           : num  -0.1588 -0.0495 0.0865 -0.2075 -0.3074 ...
 
 $ frequencyBodyaccelerometer.meanFreq...Y           : num  0.0975 0.0759 0.1175 0.1131 0.0632 ...
 
 $ frequencyBodyaccelerometer.meanFreq...Z           : num  0.0894 0.2388 0.2449 0.0497 0.2943 ...
 
 $ frequencyBodyaccelerometerJerk.mean...X           : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 
 $ frequencyBodyaccelerometerJerk.mean...Y           : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 
 $ frequencyBodyaccelerometerJerk.mean...Z           : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
 
 $ frequencyBodyaccelerometerJerk.std...X            : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 
 $ frequencyBodyaccelerometerJerk.std...Y            : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
 
 $ frequencyBodyaccelerometerJerk.std...Z            : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
 
 $ frequencyBodyaccelerometerJerk.meanFreq...X       : num  0.132 0.257 0.314 -0.209 -0.253 ...
 
 $ frequencyBodyaccelerometerJerk.meanFreq...Y       : num  0.0245 0.0475 0.0392 -0.3862 -0.3376 ...
 
 $ frequencyBodyaccelerometerJerk.meanFreq...Z       : num  0.02439 0.09239 0.13858 -0.18553 0.00937 ...
 
 $ frequencyBodygyroscope.mean...X                   : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
 
 $ frequencyBodygyroscope.mean...Y                   : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 
 $ frequencyBodygyroscope.mean...Z                   : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 
 $ frequencyBodygyroscope.std...X                    : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
 
 $ frequencyBodygyroscope.std...Y                    : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 
 $ frequencyBodygyroscope.std...Z                    : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
 
 $ frequencyBodygyroscope.meanFreq...X               : num  -0.00355 0.18915 -0.12029 0.01478 -0.10045 ...
 
 $ frequencyBodygyroscope.meanFreq...Y               : num  -0.0915 0.0631 -0.0447 -0.0658 0.0826 ...
 
 $ frequencyBodygyroscope.meanFreq...Z               : num  0.010458 -0.029784 0.100608 0.000773 -0.075676 ...
 
 $ frequencyBodyaccelerometermagnitude.mean..        : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 
 $ frequencyBodyaccelerometermagnitude.std..         : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
 
 $ frequencyBodyaccelerometermagnitude.meanFreq..    : num  0.0864 0.2367 0.2846 0.1906 0.1192 ...
 
 $ frequencybodyaccelerometerJerkmagnitude.mean..    : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 
 $ frequencybodyaccelerometerJerkmagnitude.std..     : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
 
 $ frequencybodyaccelerometerJerkmagnitude.meanFreq..: num  0.2664 0.3519 0.4222 0.0938 0.0765 ...
 
 $ frequencybodygyroscopemagnitude.mean..            : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 
 $ frequencybodygyroscopemagnitude.std..             : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
 
 $ frequencybodygyroscopemagnitude.meanFreq..        : num  -0.139775 -0.000262 -0.028606 0.268844 0.349614 ...
 
 $ frequencybodygyroscopeJerkmagnitude.mean..        : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
 
 $ frequencybodygyroscopeJerkmagnitude.std..         : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...
 
 $ frequencybodygyroscopeJerkmagnitude.meanFreq..    : num  0.176 0.185 0.334 0.191 0.19 ...
 
 $ angle.timeBodyaccelerometerMean.gravity.          : num  0.021366 0.027442 -0.000222 0.060454 -0.002695 ...
 
 $ angle.timeBodyaccelerometerJerkMean..gravityMean. : num  0.00306 0.02971 0.02196 -0.00793 0.08993 ...
 
 $ angle.timeBodygyroscopeMean.gravityMean.          : num  -0.00167 0.0677 -0.03379 0.01306 0.06334 ...
 
 $ angle.timeBodygyroscopeJerkMean.gravityMean.      : num  0.0844 -0.0649 -0.0279 -0.0187 -0.04 ...
 
 $ angle.X.gravityMean.                              : num  0.427 -0.591 -0.743 -0.729 -0.744 ...
 
 $ angle.Y.gravityMean.                              : num  -0.5203 -0.0605 0.2702 0.277 0.2672 ...
 
 $ angle.Z.gravityMean.                              : num  -0.3524 -0.218 0.0123 0.0689 0.065 ...


## Summary of Info in the Columns of the Tidy Data

The summary of the data of all the columns included in the tidy data for the "Getting and Cleaning Data Project" are:

 $   person_id                                       : chr  "Min.   : 1.0  " "1st Qu.: 8.0  " "Median :15.5  " "Mean   :15.5  " "3rd Qu.:23.0  " "Max.   :30.0  "
 
 $             activity_id                           : chr  "LAYING            :30  " "SITTING           :30  " "STANDING          :30  " "WALKING           :30  " "WALKING_DOWNSTAIRS:30  " "WALKING_UPSTAIRS  :30  "
 
 $ timeBodyaccelerometer.mean...X                    : chr  "Min.   :0.2216  " "1st Qu.:0.2712  " "Median :0.2770  " "Mean   :0.2743  " "3rd Qu.:0.2800  " "Max.   :0.3015  "
 
 $ timeBodyaccelerometer.mean...Y                    : chr  "Min.   :-0.040514  " "1st Qu.:-0.020022  " "Median :-0.017262  " "Mean   :-0.017876  " "3rd Qu.:-0.014936  " "Max.   :-0.001308  "
 
 $ timeBodyaccelerometer.mean...Z                    : chr  "Min.   :-0.15251  " "1st Qu.:-0.11207  " "Median :-0.10819  " "Mean   :-0.10916  " "3rd Qu.:-0.10443  " "Max.   :-0.07538  "
 
 $ timeBodyaccelerometer.std...X                     : chr  "Min.   :-0.9961  " "1st Qu.:-0.9799  " "Median :-0.7526  " "Mean   :-0.5577  " "3rd Qu.:-0.1984  " "Max.   : 0.6269  "
 
 $ timeBodyaccelerometer.std...Y                     : chr  "Min.   :-0.99024  " "1st Qu.:-0.94205  " "Median :-0.50897  " "Mean   :-0.46046  " "3rd Qu.:-0.03077  " "Max.   : 0.61694  "
 
 $ timeBodyaccelerometer.std...Z                     : chr  "Min.   :-0.9877  " "1st Qu.:-0.9498  " "Median :-0.6518  " "Mean   :-0.5756  " "3rd Qu.:-0.2306  " "Max.   : 0.6090  "
 
 $ timegravityaccelerometer.mean...X                 : chr  "Min.   :-0.6800  " "1st Qu.: 0.8376  " "Median : 0.9208  " "Mean   : 0.6975  " "3rd Qu.: 0.9425  " "Max.   : 0.9745  "
 
 $ timegravityaccelerometer.mean...Y                 : chr  "Min.   :-0.47989  " "1st Qu.:-0.23319  " "Median :-0.12782  " "Mean   :-0.01621  " "3rd Qu.: 0.08773  " "Max.   : 0.95659  "
 
 $ timegravityaccelerometer.mean...Z                 : chr  "Min.   :-0.49509  " "1st Qu.:-0.11726  " "Median : 0.02384  " "Mean   : 0.07413  " "3rd Qu.: 0.14946  " "Max.   : 0.95787  "
 
 $ timegravityaccelerometer.std...X                  : chr  "Min.   :-0.9968  " "1st Qu.:-0.9825  " "Median :-0.9695  " "Mean   :-0.9638  " "3rd Qu.:-0.9509  " "Max.   :-0.8296  "
 
 $ timegravityaccelerometer.std...Y                  : chr  "Min.   :-0.9942  " "1st Qu.:-0.9711  " "Median :-0.9590  " "Mean   :-0.9524  " "3rd Qu.:-0.9370  " "Max.   :-0.6436  "
 
 $ timegravityaccelerometer.std...Z                  : chr  "Min.   :-0.9910  " "1st Qu.:-0.9605  " "Median :-0.9450  " "Mean   :-0.9364  " "3rd Qu.:-0.9180  " "Max.   :-0.6102  "
 
 $ timeBodyaccelerometerJerk.mean...X                : chr  "Min.   :0.04269  " "1st Qu.:0.07396  " "Median :0.07640  " "Mean   :0.07947  " "3rd Qu.:0.08330  " "Max.   :0.13019  "
 
 $ timeBodyaccelerometerJerk.mean...Y                : chr  "Min.   :-0.0386872  " "1st Qu.: 0.0004664  " "Median : 0.0094698  " "Mean   : 0.0075652  " "3rd Qu.: 0.0134008  " "Max.   : 0.0568186  "
 
 $ timeBodyaccelerometerJerk.mean...Z                : chr  "Min.   :-0.067458  " "1st Qu.:-0.010601  " "Median :-0.003861  " "Mean   :-0.004953  " "3rd Qu.: 0.001958  " "Max.   : 0.038053  "
 
 $ timeBodyaccelerometerJerk.std...X                 : chr  "Min.   :-0.9946  " "1st Qu.:-0.9832  " "Median :-0.8104  " "Mean   :-0.5949  " "3rd Qu.:-0.2233  " "Max.   : 0.5443  "
 
 $ timeBodyaccelerometerJerk.std...Y                 : chr  "Min.   :-0.9895  " "1st Qu.:-0.9724  " "Median :-0.7756  " "Mean   :-0.5654  " "3rd Qu.:-0.1483  " "Max.   : 0.3553  "
 
 $ timeBodyaccelerometerJerk.std...Z                 : chr  "Min.   :-0.99329  " "1st Qu.:-0.98266  " "Median :-0.88366  " "Mean   :-0.73596  " "3rd Qu.:-0.51212  " "Max.   : 0.03102  "
 
 $ timeBodygyroscope.mean...X                        : chr  "Min.   :-0.20578  " "1st Qu.:-0.04712  " "Median :-0.02871  " "Mean   :-0.03244  " "3rd Qu.:-0.01676  " "Max.   : 0.19270  "
 
 $ timeBodygyroscope.mean...Y                        : chr  "Min.   :-0.20421  " "1st Qu.:-0.08955  " "Median :-0.07318  " "Mean   :-0.07426  " "3rd Qu.:-0.06113  " "Max.   : 0.02747  "
 
 $ timeBodygyroscope.mean...Z                        : chr  "Min.   :-0.07245  " "1st Qu.: 0.07475  " "Median : 0.08512  " "Mean   : 0.08744  " "3rd Qu.: 0.10177  " "Max.   : 0.17910  "
 
 $ timeBodygyroscope.std...X                         : chr  "Min.   :-0.9943  " "1st Qu.:-0.9735  " "Median :-0.7890  " "Mean   :-0.6916  " "3rd Qu.:-0.4414  " "Max.   : 0.2677  "
 
 $ timeBodygyroscope.std...Y                         : chr  "Min.   :-0.9942  " "1st Qu.:-0.9629  " "Median :-0.8017  " "Mean   :-0.6533  " "3rd Qu.:-0.4196  " "Max.   : 0.4765  "
 
 $ timeBodygyroscope.std...Z                         : chr  "Min.   :-0.9855  " "1st Qu.:-0.9609  " "Median :-0.8010  " "Mean   :-0.6164  " "3rd Qu.:-0.3106  " "Max.   : 0.5649  "
 
 $ timeBodygyroscopeJerk.mean...X                    : chr  "Min.   :-0.15721  " "1st Qu.:-0.10322  " "Median :-0.09868  " "Mean   :-0.09606  " "3rd Qu.:-0.09110  " "Max.   :-0.02209  "
 
 $ timeBodygyroscopeJerk.mean...Y                    : chr  "Min.   :-0.07681  " "1st Qu.:-0.04552  " "Median :-0.04112  " "Mean   :-0.04269  " "3rd Qu.:-0.03842  " "Max.   :-0.01320  "
 
 $ timeBodygyroscopeJerk.mean...Z                    : chr  "Min.   :-0.092500  " "1st Qu.:-0.061725  " "Median :-0.053430  " "Mean   :-0.054802  " "3rd Qu.:-0.048985  " "Max.   :-0.006941  "
 
 $ timeBodygyroscopeJerk.std...X                     : chr  "Min.   :-0.9965  " "1st Qu.:-0.9800  " "Median :-0.8396  " "Mean   :-0.7036  " "3rd Qu.:-0.4629  " "Max.   : 0.1791  "
 
 $ timeBodygyroscopeJerk.std...Y                     : chr  "Min.   :-0.9971  " "1st Qu.:-0.9832  " "Median :-0.8942  " "Mean   :-0.7636  " "3rd Qu.:-0.5861  " "Max.   : 0.2959  "
 
 $ timeBodygyroscopeJerk.std...Z                     : chr  "Min.   :-0.9954  " "1st Qu.:-0.9848  " "Median :-0.8610  " "Mean   :-0.7096  " "3rd Qu.:-0.4741  " "Max.   : 0.1932  "
 
 $ timeBodyaccelerometermagnitude.mean..             : chr  "Min.   :-0.9865  " "1st Qu.:-0.9573  " "Median :-0.4829  " "Mean   :-0.4973  " "3rd Qu.:-0.0919  " "Max.   : 0.6446  "
 
 $ timeBodyaccelerometermagnitude.std..              : chr  "Min.   :-0.9865  " "1st Qu.:-0.9430  " "Median :-0.6074  " "Mean   :-0.5439  " "3rd Qu.:-0.2090  " "Max.   : 0.4284  "
 
 $ timegravityaccelerometermagnitude.mean..          : chr  "Min.   :-0.9865  " "1st Qu.:-0.9573  " "Median :-0.4829  " "Mean   :-0.4973  " "3rd Qu.:-0.0919  " "Max.   : 0.6446  "
 
 $ timegravityaccelerometermagnitude.std..           : chr  "Min.   :-0.9865  " "1st Qu.:-0.9430  " "Median :-0.6074  " "Mean   :-0.5439  " "3rd Qu.:-0.2090  " "Max.   : 0.4284  "
 
 $ timeBodyaccelerometerJerkmagnitude.mean..         : chr  "Min.   :-0.9928  " "1st Qu.:-0.9807  " "Median :-0.8168  " "Mean   :-0.6079  " "3rd Qu.:-0.2456  " "Max.   : 0.4345  "
 
 $ timeBodyaccelerometerJerkmagnitude.std..          : chr  "Min.   :-0.9946  " "1st Qu.:-0.9765  " "Median :-0.8014  " "Mean   :-0.5842  " "3rd Qu.:-0.2173  " "Max.   : 0.4506  "
 
 $ timeBodygyroscopemagnitude.mean..                 : chr  "Min.   :-0.9807  " "1st Qu.:-0.9461  " "Median :-0.6551  " "Mean   :-0.5652  " "3rd Qu.:-0.2159  " "Max.   : 0.4180  "
 
 $ timeBodygyroscopemagnitude.std..                  : chr  "Min.   :-0.9814  " "1st Qu.:-0.9476  " "Median :-0.7420  " "Mean   :-0.6304  " "3rd Qu.:-0.3602  " "Max.   : 0.3000  "
 
 $ timeBodygyroscopeJerkmagnitude.mean..             : chr  "Min.   :-0.99732  " "1st Qu.:-0.98515  " "Median :-0.86479  " "Mean   :-0.73637  " "3rd Qu.:-0.51186  " "Max.   : 0.08758  "
 
 $ timeBodygyroscopeJerkmagnitude.std..              : chr  "Min.   :-0.9977  " "1st Qu.:-0.9805  " "Median :-0.8809  " "Mean   :-0.7550  " "3rd Qu.:-0.5767  " "Max.   : 0.2502  "
 
 $ frequencyBodyaccelerometer.mean...X               : chr  "Min.   :-0.9952  " "1st Qu.:-0.9787  " "Median :-0.7691  " "Mean   :-0.5758  " "3rd Qu.:-0.2174  " "Max.   : 0.5370  "
 
 $ frequencyBodyaccelerometer.mean...Y               : chr  "Min.   :-0.98903  " "1st Qu.:-0.95361  " "Median :-0.59498  " "Mean   :-0.48873  " "3rd Qu.:-0.06341  " "Max.   : 0.52419  "
 
 $ frequencyBodyaccelerometer.mean...Z               : chr  "Min.   :-0.9895  " "1st Qu.:-0.9619  " "Median :-0.7236  " "Mean   :-0.6297  " "3rd Qu.:-0.3183  " "Max.   : 0.2807  "
 
 $ frequencyBodyaccelerometer.std...X                : chr  "Min.   :-0.9966  " "1st Qu.:-0.9820  " "Median :-0.7470  " "Mean   :-0.5522  " "3rd Qu.:-0.1966  " "Max.   : 0.6585  "
 
 $ frequencyBodyaccelerometer.std...Y                : chr  "Min.   :-0.99068  " "1st Qu.:-0.94042  " "Median :-0.51338  " "Mean   :-0.48148  " "3rd Qu.:-0.07913  " "Max.   : 0.56019  "
 
 $ frequencyBodyaccelerometer.std...Z                : chr  "Min.   :-0.9872  " "1st Qu.:-0.9459  " "Median :-0.6441  " "Mean   :-0.5824  " "3rd Qu.:-0.2655  " "Max.   : 0.6871  "
 
 $ frequencyBodyaccelerometer.meanFreq...X           : chr  "Min.   :-0.63591  " "1st Qu.:-0.39165  " "Median :-0.25731  " "Mean   :-0.23227  " "3rd Qu.:-0.06105  " "Max.   : 0.15912  "
 
 $ frequencyBodyaccelerometer.meanFreq...Y           : chr  "Min.   :-0.379518  " "1st Qu.:-0.081314  " "Median : 0.007855  " "Mean   : 0.011529  " "3rd Qu.: 0.086281  " "Max.   : 0.466528  "
 
 $ frequencyBodyaccelerometer.meanFreq...Z           : chr  "Min.   :-0.52011  " "1st Qu.:-0.03629  " "Median : 0.06582  " "Mean   : 0.04372  " "3rd Qu.: 0.17542  " "Max.   : 0.40253  "
 
 $ frequencyBodyaccelerometerJerk.mean...X           : chr  "Min.   :-0.9946  " "1st Qu.:-0.9828  " "Median :-0.8126  " "Mean   :-0.6139  " "3rd Qu.:-0.2820  " "Max.   : 0.4743  "
 
 $ frequencyBodyaccelerometerJerk.mean...Y           : chr  "Min.   :-0.9894  " "1st Qu.:-0.9725  " "Median :-0.7817  " "Mean   :-0.5882  " "3rd Qu.:-0.1963  " "Max.   : 0.2767  "
 
 $ frequencyBodyaccelerometerJerk.mean...Z           : chr  "Min.   :-0.9920  " "1st Qu.:-0.9796  " "Median :-0.8707  " "Mean   :-0.7144  " "3rd Qu.:-0.4697  " "Max.   : 0.1578  "
 
 $ frequencyBodyaccelerometerJerk.std...X            : chr  "Min.   :-0.9951  " "1st Qu.:-0.9847  " "Median :-0.8254  " "Mean   :-0.6121  " "3rd Qu.:-0.2475  " "Max.   : 0.4768  "
 
 $ frequencyBodyaccelerometerJerk.std...Y            : chr  "Min.   :-0.9905  " "1st Qu.:-0.9737  " "Median :-0.7852  " "Mean   :-0.5707  " "3rd Qu.:-0.1685  " "Max.   : 0.3498  "
 
 $ frequencyBodyaccelerometerJerk.std...Z            : chr  "Min.   :-0.993108  " "1st Qu.:-0.983747  " "Median :-0.895121  " "Mean   :-0.756489  " "3rd Qu.:-0.543787  " "Max.   :-0.006236  "
 
 $ frequencyBodyaccelerometerJerk.meanFreq...X       : chr  "Min.   :-0.57604  " "1st Qu.:-0.28966  " "Median :-0.06091  " "Mean   :-0.06910  " "3rd Qu.: 0.17660  " "Max.   : 0.33145  "
 
 $ frequencyBodyaccelerometerJerk.meanFreq...Y       : chr  "Min.   :-0.60197  " "1st Qu.:-0.39751  " "Median :-0.23209  " "Mean   :-0.22810  " "3rd Qu.:-0.04721  " "Max.   : 0.19568  "
 
 $ frequencyBodyaccelerometerJerk.meanFreq...Z       : chr  "Min.   :-0.62756  " "1st Qu.:-0.30867  " "Median :-0.09187  " "Mean   :-0.13760  " "3rd Qu.: 0.03858  " "Max.   : 0.23011  "
 
 $ frequencyBodygyroscope.mean...X                   : chr  "Min.   :-0.9931  " "1st Qu.:-0.9697  " "Median :-0.7300  " "Mean   :-0.6367  " "3rd Qu.:-0.3387  " "Max.   : 0.4750  "
 
 $ frequencyBodygyroscope.mean...Y                   : chr  "Min.   :-0.9940  " "1st Qu.:-0.9700  " "Median :-0.8141  " "Mean   :-0.6767  " "3rd Qu.:-0.4458  " "Max.   : 0.3288  "
 
 $ frequencyBodygyroscope.mean...Z                   : chr  "Min.   :-0.9860  " "1st Qu.:-0.9624  " "Median :-0.7909  " "Mean   :-0.6044  " "3rd Qu.:-0.2635  " "Max.   : 0.4924  "
 
 $ frequencyBodygyroscope.std...X                    : chr  "Min.   :-0.9947  " "1st Qu.:-0.9750  " "Median :-0.8086  " "Mean   :-0.7110  " "3rd Qu.:-0.4813  " "Max.   : 0.1966  "
 
 $ frequencyBodygyroscope.std...Y                    : chr  "Min.   :-0.9944  " "1st Qu.:-0.9602  " "Median :-0.7964  " "Mean   :-0.6454  " "3rd Qu.:-0.4154  " "Max.   : 0.6462  "
 
 $ frequencyBodygyroscope.std...Z                    : chr  "Min.   :-0.9867  " "1st Qu.:-0.9643  " "Median :-0.8224  " "Mean   :-0.6577  " "3rd Qu.:-0.3916  " "Max.   : 0.5225  "
 
 $ frequencyBodygyroscope.meanFreq...X               : chr  "Min.   :-0.395770  " "1st Qu.:-0.213363  " "Median :-0.115527  " "Mean   :-0.104551  " "3rd Qu.: 0.002655  " "Max.   : 0.249209  "
 
 $ frequencyBodygyroscope.meanFreq...Y               : chr  "Min.   :-0.66681  " "1st Qu.:-0.29433  " "Median :-0.15794  " "Mean   :-0.16741  " "3rd Qu.:-0.04269  " "Max.   : 0.27314  "
 
 $ frequencyBodygyroscope.meanFreq...Z               : chr  "Min.   :-0.50749  " "1st Qu.:-0.15481  " "Median :-0.05081  " "Mean   :-0.05718  " "3rd Qu.: 0.04152  " "Max.   : 0.37707  "
 
 $ frequencyBodyaccelerometermagnitude.mean..        : chr  "Min.   :-0.9868  " "1st Qu.:-0.9560  " "Median :-0.6703  " "Mean   :-0.5365  " "3rd Qu.:-0.1622  " "Max.   : 0.5866  "
 
 $ frequencyBodyaccelerometermagnitude.std..         : chr  "Min.   :-0.9876  " "1st Qu.:-0.9452  " "Median :-0.6513  " "Mean   :-0.6210  " "3rd Qu.:-0.3654  " "Max.   : 0.1787  "
 
 $ frequencyBodyaccelerometermagnitude.meanFreq..    : chr  "Min.   :-0.31234  " "1st Qu.:-0.01475  " "Median : 0.08132  " "Mean   : 0.07613  " "3rd Qu.: 0.17436  " "Max.   : 0.43585  "
 
 $ frequencybodyaccelerometerJerkmagnitude.mean..    : chr  "Min.   :-0.9940  " "1st Qu.:-0.9770  " "Median :-0.7940  " "Mean   :-0.5756  " "3rd Qu.:-0.1872  " "Max.   : 0.5384  "
 
 $ frequencybodyaccelerometerJerkmagnitude.std..     : chr  "Min.   :-0.9944  " "1st Qu.:-0.9752  " "Median :-0.8126  " "Mean   :-0.5992  " "3rd Qu.:-0.2668  " "Max.   : 0.3163  "
 
 $ frequencybodyaccelerometerJerkmagnitude.meanFreq..: chr  "Min.   :-0.12521  " "1st Qu.: 0.04527  " "Median : 0.17198  " "Mean   : 0.16255  " "3rd Qu.: 0.27593  " "Max.   : 0.48809  "
 
 $ frequencybodygyroscopemagnitude.mean..            : chr  "Min.   :-0.9865  " "1st Qu.:-0.9616  " "Median :-0.7657  " "Mean   :-0.6671  " "3rd Qu.:-0.4087  " "Max.   : 0.2040  "
 
 $ frequencybodygyroscopemagnitude.std..             : chr  "Min.   :-0.9815  " "1st Qu.:-0.9488  " "Median :-0.7727  " "Mean   :-0.6723  " "3rd Qu.:-0.4277  " "Max.   : 0.2367  "
 
 $ frequencybodygyroscopemagnitude.meanFreq..        : chr  "Min.   :-0.45664  " "1st Qu.:-0.16951  " "Median :-0.05352  " "Mean   :-0.03603  " "3rd Qu.: 0.08228  " "Max.   : 0.40952  "
 
 $ frequencybodygyroscopeJerkmagnitude.mean..        : chr  "Min.   :-0.9976  " "1st Qu.:-0.9813  " "Median :-0.8779  " "Mean   :-0.7564  " "3rd Qu.:-0.5831  " "Max.   : 0.1466  "
 
 $ frequencybodygyroscopeJerkmagnitude.std..         : chr  "Min.   :-0.9976  " "1st Qu.:-0.9802  " "Median :-0.8941  " "Mean   :-0.7715  " "3rd Qu.:-0.6081  " "Max.   : 0.2878  "
 
 $ frequencybodygyroscopeJerkmagnitude.meanFreq..    : chr  "Min.   :-0.18292  " "1st Qu.: 0.05423  " "Median : 0.11156  " "Mean   : 0.12592  " "3rd Qu.: 0.20805  " "Max.   : 0.42630  "
 
 $ angle.timeBodyaccelerometerMean.gravity.          : chr  "Min.   :-0.163043  " "1st Qu.:-0.011012  " "Median : 0.007878  " "Mean   : 0.006556  " "3rd Qu.: 0.024393  " "Max.   : 0.129154  "
 
 $ angle.timeBodyaccelerometerJerkMean..gravityMean. : chr  "Min.   :-0.1205540  " "1st Qu.:-0.0211694  " "Median : 0.0031358  " "Mean   : 0.0006439  " "3rd Qu.: 0.0220881  " "Max.   : 0.2032600  "
 
 $ angle.timeBodygyroscopeMean.gravityMean.          : chr  "Min.   :-0.38931  " "1st Qu.:-0.01977  " "Median : 0.02087  " "Mean   : 0.02193  " "3rd Qu.: 0.06460  " "Max.   : 0.44410  "
 
 $ angle.timeBodygyroscopeJerkMean.gravityMean.      : chr  "Min.   :-0.22367  " "1st Qu.:-0.05613  " "Median :-0.01602  " "Mean   :-0.01137  " "3rd Qu.: 0.03200  " "Max.   : 0.18238  "
 
 $ angle.X.gravityMean.                              : chr  "Min.   :-0.9471  " "1st Qu.:-0.7907  " "Median :-0.7377  " "Mean   :-0.5243  " "3rd Qu.:-0.5823  " "Max.   : 0.7378  "
 
 $ angle.Y.gravityMean.                              : chr  "Min.   :-0.87457  " "1st Qu.: 0.02191  " "Median : 0.17136  " "Mean   : 0.07865  " "3rd Qu.: 0.24343  " "Max.   : 0.42476  "
 
 $ angle.Z.gravityMean.                              : chr  "Min.   :-0.873649  " "1st Qu.:-0.083912  " "Median : 0.005079  " "Mean   :-0.040436  " "3rd Qu.: 0.106190  " "Max.   : 0.390444  "
 