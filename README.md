#Contains explaination of run_analysis.R file complete commands

#This is the main script that is called to perform the cleaning and tidying of the dataset as described in the excercise and is listed below.

#Initially it reads all the files from the working directory to create a data frame

#Second step it names the train and test dataframe based on the column names read from features.txt file

#third step binds the subject file to both train and test data frames using the cbind command

#fourth step binds the activity file to both train and test data frames using the cbind command

#fifth step binds the train and test data frames together into a combined data frame using row bind command

#6  filters out the mean and std column names into fcolnames 

#7 adds the subject and activity column names into fcolnames

#8 creates combineddf frame with only mean and std columns along with activity and subject using subset command

#9 replaces activity code ids with elaborate names using the apply function

#10 final required tidy data set is created by using aggregate command that calculates the average for #each variable by activity and by subject

#11 writes the required tidy data set to a file

