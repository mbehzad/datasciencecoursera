rankall <- function(outcome, num = "best") {
  ## Check that state and outcome are valid
  ## static list of outcome options
  HEART_ATTACK <- "heart attack"
  HEART_FAILUR <- "heart failure"
  PNEUMONIA <- "pneumonia"
  OUTCOMES <- c(HEART_ATTACK, HEART_FAILUR, PNEUMONIA)
  
  COL_NAMES <- list ()
  COL_NAMES[[HEART_ATTACK]] <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  COL_NAMES[[HEART_FAILUR]] <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  COL_NAMES[[PNEUMONIA]] <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  
  ## stop if outcome is not suported
  if (!(outcome %in% OUTCOMES)) {
    stop("invalid outcome")
  }
  
  ## Read outcome data
  data_ <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ##splited <- split(data_, data_$State, drop=TRUE)
  colDim <- c("hospital", "state")
  result <- matrix(ncol=2, nrow=0, dimnames=list(NULL, colDim))

  ## tapply(x, f, mean)
  lapply(split(data_, data_$State), function(sub_) {
    ## do stuff
    ##print()
    ## col for the given outcome
    colName_ <- COL_NAMES[[outcome]]
    
    ## filter NAs
    sub_ <- sub_[which(sub_[[colName_]]!="Not Available"), ]
    ## read as number
    sub_[, colName_] <- as.numeric(sub_[, colName_])
    
    stateName <- sub_$State[1]
    
    lngth <- length(sub_[, colName_]);
    if (num == "best") {
      num <- 1;
    }
    else if (num == "worst") {
      num <- lngth
    }
    else if (num > lngth) {
      newRow <- matrix(c(NA, stateName), nrow=1, ncol=2, dimnames=list(stateName, colDim))
      result <<- rbind(result, newRow)
      return(NA)
    }
    
    ## order by value, then by alphabet
    orderedHospitals <- sub_$Hospital.Name[order(sub_[[colName_]], sub_$Hospital.Name)]
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    hospitalName <- orderedHospitals[[num]]
    
    
    newRow <- matrix(c(hospitalName, stateName), nrow=1, ncol=2, dimnames=list(stateName, colDim))
    result <<- rbind(result, newRow)
  })
  
  as.data.frame(result)
}