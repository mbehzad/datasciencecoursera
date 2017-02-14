rankhospital <- function(state, outcome, num = "best") {
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
  
  ## extract states
  states <- unique(data_$State);
  ## stop if state is not in the list
  if (!(state %in% states)) {
    stop("invalid state")
  }
  
  ## filter for the given state
  sub_ <- data_[which(data_$State==state), ]
  ## col for the given outcome
  colName_ <- COL_NAMES[[outcome]]

  ## filter NAs
  sub_ <- sub_[which(sub_[[colName_]]!="Not Available"), ]
  ## read as number
  sub_[, colName_] <- as.numeric(sub_[, colName_])
  
  lngth <- length(sub_[, colName_]);
  if (num == "best") {
    num <- 1;
  }
  else if (num == "worst") {
    num <- lngth
  }
  else if (num > lngth) {
    return(NA)
  }
  
  ## order by value, then by alphabet
  orderedHospitals <- sub_$Hospital.Name[order(sub_[[colName_]], sub_$Hospital.Name)]
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  orderedHospitals[[num]]
}