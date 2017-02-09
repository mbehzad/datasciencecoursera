##
pollutantmean <- function(directory, pollutant, id = 100:332) {
  ## empty table
  data <- c();
  for (i in id) {
    ## eventually the leading '00' will be added
    filename <- i;
    if (i < 10) {
      filename <- paste("00" , filename, sep = "");
    }
    else if (i < 100) {
      filename <- paste("0" , filename, sep = "");
    }
    
    path <- paste(directory, "/", filename , ".csv", sep = "");
    ## add data to table
    data <- rbind(data, read.csv(path));
  }
  
  mean(data[[pollutant]], na.rm = TRUE);
}
