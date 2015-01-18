# getting_cleaning_data

### Project

Coursera / Getting and Cleaning Data

### How the script works
 
 Script expects that working directory is set to "UCI HAR Dataset" directory (e.g. setwd('/home/me/project/UCI HAR Dataset')).
 Script loads data file by file, test and training data. Builds a test data table and training data table column by column, then merges them.
 Columns names contain measurement and axis (e.g. 'acceleration_x').
 It then calculate mean and standard deviation for each column and produces a new table with these data.
 Next, matrix is transposed and a data frame is created with two more columns containing measurement and axis values. These values are then converted to factors.
 Resulting data table is returned.
 
### Code book describing the variables
 
#### Initial data table contains the following columns:
 
 acceleration_x<br/>
 acceleration_y<br/>
 acceleration_z<br/>
 angularvelocity_x<br/>
 angularvelocity_y<br/>
 angularvelocity_z<br/>
 
 where first three columns contain accelleration by axis and the last three -- angular velocity by axis.
 
#### Processed data table contains the following columns:
 measurement       (acceleration or angularvelocity)<br/>
 axis              (x, y, z)<br/>
 mean              (mean of the measurement for the axis)<br/>
 standarddeviation (standard deviation of the measurement for the axis)<br/>
 
### How to run the script
 Script uses "data.table" library.
 Entry point is process_data() (which calls load_data(), processes and returns the resulting data table).
 Returned data table can be saved using, for example,
 
 dt <- process_data() <br/>
 write.table(dt, file = "data_set.txt", row.name=FALSE)
