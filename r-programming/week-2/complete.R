## 
complete <- function(directory, id = 1:332) {
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
    table <- read.csv(path);
    ## remove nas
    table <- table[complete.cases(table), ];
    data <- rbind(data, c(i, nrow(table)))
  }
  ## add coll names
  colnames(data)[1:2] <- c("id", "nobs");
  
  ## return data
  data;
}
