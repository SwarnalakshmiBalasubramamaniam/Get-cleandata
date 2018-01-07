##Codebook.md explains the variables used

#xtrainfile - dataframe containing the training file data  read from X_train.txt
#featuresfile - dataframe containing the feature name read from features.txt
#xtestfile - dataframe containing the test file read from  X_test.txt
#testsubjectfile -dataframe containing the test subjects read from subject_test.txt
#trainsubjectfile - dataframe containing the train subjects read from subject_train.txt
#ytrainfile - data frame containing the activity of the subjects in train file read from y_train.txt
#ytestfile - data frame containing the activity of the subjects in test file read from y_test.txt
#activityfile - data frame containing the activity labels read from activity_labels.txt

#Varialbles
#combineddataframe - combines the test and train data 
#fcolnames - contains the filtered column names of mean and std columns along with activity and subject column names
#combineddf - contains the combined data frame of test & train data but filtered for only the mean and #std columns
#meandf- contains the mean grouped by activity by subject