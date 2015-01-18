# Coursera / Getting and Cleaning Data

### How the script works
 
 Script expects that working directory is set to "UCI HAR Dataset" directory (e.g. setwd('/home/me/project/UCI HAR Dataset')).
 Script loads data file by file, test and training data. Builds a test data table and training data table column by column, then merges them.
 Columns names contain measurement and axis (e.g. 'acceleration_x').
 It then calculate mean and standard deviation for each column and produces a new table with these data.
 Next, matrix is transposed and a data frame is created with two more columns containing measurement and axis values. These values are then converted to factors.
 Resulting data table is returned.
 
### Code book describing the variables
 
#### Initial data table contains the following columns:
 
 <i>
 acceleration_x (double)<br/>
 acceleration_y (double)<br/>
 acceleration_z (double)<br/>
 angularvelocity_x (double)<br/>
 angularvelocity_y (double)<br/>
 angularvelocity_z (double)<br/>
 </i>
 
 where first three columns contain accelleration by axis and the last three -- angular velocity by axis.
 
#### Processed data table contains the following columns:

 <i>measurement</i>       (factor; levels: acceleration, angularvelocity)<br/>
 <i>axis</i>              (factor; levels: x, y, z)<br/>
 <i>mean</i>              (double; mean of the measurement for the axis)<br/>
 <i>standarddeviation</i> (double; standard deviation of the measurement for the axis)<br/>
 
### How to run the script
 Script uses "data.table" library.
 Entry point is run_analysis(), which loads and processes data and saves the resulting data table to a file specified by a parameter value (required) passed to run_analysis(). If not a string or an empty string is passed, the script prints an error message and exits (this check is not thorough).
 
 <b>
 source("run_analysis.R")<br/>
 run_analysis("data_set.txt")
 </b>
