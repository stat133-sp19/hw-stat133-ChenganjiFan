#calculate mean
aux_mean <- function(n,p) {
  n*p
}

#calculate variance
aux_variance <- function(n,p) {
  n*p*(1-p)
}

#calculate mode
aux_mode <- function(n,p) {
  trunc(n*p + p)
}

#calculate skewness
aux_skewness <- function(n,p) {
  (1-2*p)/(sqrt(n*p*(1-p)))
}

#calculate kurtosis
aux_kurtosis <- function(n,p) {
  (1-6*p*(1-p))/(n*p*(1-p))
}


