library(data.table)

# read data from file specified by 'fileName' and return it as a list

load_file <- function(fileName) {
  d <- strsplit(readLines(fileName), "[[:space:]]+")
  d <- unlist(lapply(d, as.numeric))
  d
}

# load data and return it as a table
load_data <- function () {
  # we are using relative paths; working direcory should be set to "UCI HAR Dataset"

  # load test data by measurement
  
  acceleration_x <- load_file("test/Inertial Signals/body_acc_x_test.txt")

  acceleration_y <- load_file("test/Inertial Signals/body_acc_y_test.txt")

  acceleration_z <- load_file("test/Inertial Signals/body_acc_z_test.txt")

  angularvelocity_x <- load_file("test/Inertial Signals/body_gyro_x_test.txt")

  angularvelocity_y <- load_file("test/Inertial Signals/body_gyro_y_test.txt")
  
  angularvelocity_z <- load_file("test/Inertial Signals/body_gyro_z_test.txt")

  # make test data table
  
  test_data <- cbind(acceleration_x, acceleration_y, acceleration_z, angularvelocity_x, angularvelocity_y, angularvelocity_z)

  # load test data by measurement
  
  acceleration_x <- load_file("train/Inertial Signals/body_acc_x_train.txt")
  
  acceleration_y <- load_file("train/Inertial Signals/body_acc_y_train.txt")
  
  acceleration_z <- load_file("train/Inertial Signals/body_acc_z_train.txt")
  
  angularvelocity_x <- load_file("train/Inertial Signals/body_gyro_x_train.txt")
  
  angularvelocity_y <- load_file("train/Inertial Signals/body_gyro_y_train.txt")
  
  angularvelocity_z <- load_file("train/Inertial Signals/body_gyro_z_train.txt")
  
  # make train data table
  
  train_data <- cbind(acceleration_x, acceleration_y, acceleration_z, angularvelocity_x, angularvelocity_y, angularvelocity_z)
  
  # merge train and test data
  data <- rbind(test_data, train_data)

  data
}

process_data <- function() {
  # load data
  data <- load_data()
  
  # calculate mean and standard deviation by column and produce a new table with resulting values
  
  extr <- rbind(mean=apply(data, 2, mean, na.rm=TRUE), standarddeviation=apply(data, 2, sd, na.rm=TRUE))
  
  # transpose matrix
  
  t_extr <- t(extr)
  
  # add columns for measurements and axis
  t_extr <- cbind(axis=lapply(rownames(t_extr), function(r) {unlist(strsplit(r,"_"))[2]}), t_extr)
  t_extr <- cbind(measurement=lapply(rownames(t_extr), function(r) {unlist(strsplit(r,"_"))[1]}), t_extr)
  
  # convert data frame to data table (because some operation just seem to produce nicer results)
  dt <- data.table(t_extr)
  
  # conver measurements and axis values to factors
  
  dt$axis <- as.factor(unlist(dt$axis))
  dt$measurement <- as.factor(unlist(dt$measurement))
  
  # unlist numeric columns
  dt$mean <- unlist(dt$mean)
  dt$standarddeviation <- unlist(dt$standarddeviation)
  
  # return resultinf data table
  dt
}

# this how we can process and output data to a file
#write.table(process_data(), file = "data_set.txt", row.name=FALSE)

