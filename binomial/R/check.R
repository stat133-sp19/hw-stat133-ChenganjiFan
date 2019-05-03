#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

# private function to check if an input prob is a valid probability value
check_prob <- function(x) {
  if(0<=x & x<=1) {
    return(TRUE)
  }
  else {
    stop('invalid prob value')
  }
}

# private function to check if an input trials is a valid value for number of trials
check_trials <- function(x) {
  if(x>=0) {
    return(TRUE)
  }
  else {
    stop('invalid trials value')
  }
}

# private function to check if an input success is a valid value for number of successes
check_success <- function(k,n) {
  if(!k>=0) {
    stop('invalid success value')
  }
  if(k>n) {
    stop('success cannot be greater than trials')
  }
  return(TRUE)
}

