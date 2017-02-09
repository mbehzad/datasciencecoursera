## calculate mean of the pollutant
corr <- function(directory, threshold = 0) {
  ## empty vector
  correlation <- c();
  ## get list of all files
  files <- dir(directory);
  
  lapply(files, function(file_) {
    ## read data to table
    mx <- read.csv(paste(directory, file_, sep = "/"));
    ## remove na's
    mx <- mx[complete.cases(mx), ];
    
    if (nrow(mx) > threshold) {
      correlation <<- c(correlation, cor(mx$sulfate, mx$nitrate));
    }
  });
  
  ## return correlation vector
  if (length(correlation) == 0) {
    return(numeric());
  }
  else {
    return(correlation);
  }
  correlation;
}
