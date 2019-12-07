# CleanDataProject

My final project for the Getting and Cleaning Data course offered by Johns Hopkins University through Coursera

This repo contains
- README on what I did and how I did it (you are reading it now)
- CodeBook.md explaining the variables included in the final output of the script
- run_analysis.R 

## What I did

I took the original data publicly provided by Reyes-Ortiz et al (2015) and combined it all into a single tidy dataset from which I could calculate averages of the mean and standard deviation for each measurement.

I focused only on "pairs" of means and standard deviations for measurements taken directly from the Samsung Smartphone device. This means that I mindfully excluded all means calculated on angles (features beginning with "angle" in the original data) and mean frequences (features containing "meanFreq" in the original data) because they did not have corresponding standard deviations. 

The result is dataset that offers three identifying variables (group, subject, and activity) and the averages of 66 variables: 33 mean and standard deviation pairs from 17 features, eight of which are triaxial.

## The R script

Running this script in R will create a folder in your working directory called "runanalysis" and will do the following:
1) download raw data files referenced below, 
2) produce one large dataset with appropriately-named columns and descriptive names for activities (see codebook) by creating and binding tables and columns
3) select only identifying columns and mean/standard deviation "pairs" of variables for averaging from the raw data to produce a smaller but tidy dataset, 
4) "melt" and then "cast" this smaller, tidier dataset to calculate unique averages for each variable from each subject performing each activity, and
5) "write" this dataset of averages of each of the selected variables for each activity and each subject to a new file: tidydata.txt 

This new file may be read back into R with the following code:
```
mydata <- read.table("tidydata.txt", header = TRUE)
```

Because many intermediary datasets were created and used in this process, an optional final line of code will remove most of these intermediary and building files, leaving only the complete raw dataset and the final, tidy dataset of averages.

## About the raw data

The raw data for this experiment includes measurements taken from 30 individuals, aged 19-48 years, who wore a Samsung smartphone equipped with an accelerometer and a gyroscope while performing three static and three dynamic activities.

The researchers recorded and /or calculated a total of 561 different "features" from these data, all of which either came directly from the Samsung device or were generated from these direct measures.

The raw data comes from a publicly available dataset available [HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A description of the original experiment and data collection methods is available [HERE](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions)

## CITATIONS

Hood, D. ["Getting and Cleaning the Assignment"](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)

Reyes-Ortiz, J.L., Oneto, L., SamÃ, A., Parra, X., Anguita, D. Transition-Aware Human Activity Recognition Using Smartphones. Neurocomputing. Springer 2015. 

Wickham H. Tidy Data. Journal of Statistical Software. 2014;59(1):1–23. Available [HERE](https://vita.had.co.nz/papers/tidy-data.pdf)
