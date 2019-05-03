library(ggplot2)

#'@title bin_choose
#'@description calculates the number of combinations in which k successes can occur in n trials
#'@param n number of trials
#'@param k number of successes
#'@return the number of combinations in which k successes can occur in n trials
bin_choose <- function(n,k) {
  if(k>n) {
    stop('k cannot be greater than n')
  }
  (factorial(n))/(factorial(k)*(factorial(n-k)))
}

#'@title bin_probability
#'@description calculates the probablity
#'@param n number of trials
#'@param k number of successes
#'@param p prob
#'@return binomial probability
bin_probability <- function(k,n,p) {
  if(!check_trials(n)) {
    stop('\ninvalid trials value')
  }
  if(!check_prob(p)) {
    stop('\ninvalid probability value')
  }
  if(!check_success(k,n)) {
    stop('\ninvalid success value')
  }
  bin_choose(n,k)*(p^k)*((1-p)^(n-k))
}

#'@title bin_distribution()
#'@description create a data.frame that contains binomial distribution
#'@param n number of trials
#'@param p prob
#'@return two data.frame with two classes: c("binds", "data.frame")
bin_distribution <- function(n,p) {
  prob <- c()
  for(i in 0:n) {
    prob <- c(prob, bin_probability(i,n,p))
  }
  df <- data.frame(success = 0:n, probability = prob)
  class(df) <- c("bindis", "data.frame")
  return(df)
}

#'@export
plot.bindis <- function(bindis) {
  ggplot(data=bindis, aes(x=success, y=probability)) +
    geom_bar(stat="identity") +
    scale_x_discrete(limits=0:(length(bindis$success))-1)
}

#'@title bin_cumulative()
#'@description create a data.frame that contains binomial distribution and cumulative probabilities
#'@param n number of trials
#'@param p prob
#'@return return a data frame with both the probability distribution and the cumulative probabilities
bin_cumulative <- function(n,p) {
  prob <- c()
  c <- 0
  cu <- c()
  for(i in 0:n) {
    prob <- c(prob, bin_probability(i,n,p))
    c <- c+ prob[i+1]
    cu <- c(cu, c)
  }
  df <- data.frame(success = 0:n, probability = prob, cumulative = cu)
  class(df) <- c("bincum", "data.frame")
  return(df)
}

#'@export
plot.bincum <- function(bincum) {
  ggplot(data=bincum, aes(x=success, y=cumulative)) +
    geom_point() +
    geom_line()
}

#'@title bin_variable()
#'@description create a object named binvar
#'@param n number of trials
#'@param p prob
#'@return return a list with named elements: trials: number of trials, prob: probability of success
bin_variable <- function(n,p) {
  l <- list(trials = n, prob = p)
  class(l) <- "binvar"
  return(l)
}

#'@export
print.binvar <- function(binvar) {
  cat("Binomial Variable\n\nParameters\n- number of trials :", binvar[[1]])
  cat("\n- prob of success :", binvar[[2]])
}

#'@export
summary.binvar <- function(binvar) {
  n <- binvar[[1]]
  p <- binvar[[2]]
  l1 <- list(trials = n, prob = p, mean = aux_mean(n,p), variance = aux_variance(n,p),
            mode = aux_mode(n,p), skewness = aux_skewness(n,p), kurtosis = aux_kurtosis(n,p))
  class(l1) <- "summary.binvar"
  return(l1)
}

#'@export
print.summary.binvar <- function(summary.binvar) {
  cat("Summary Binomial\n\nParameters\n- number of trials :", summary.binvar[[1]])
  cat("\n- prob of success :", summary.binvar[[2]])
  cat("\n- mean    :", summary.binvar[[3]])
  cat("\n- variance:", summary.binvar[[4]])
  cat("\n- mode    :", summary.binvar[[5]])
  cat("\n- skewness:", summary.binvar[[6]])
  cat("\n- kurtosis:", summary.binvar[[7]])
}

#'@export
bin_mean <- function(n,p) {
  if(check_trials(n)) {
    if(check_prob(p)) {
      return(aux_mean(n,p))
    }
  }
}

#'@export
bin_variance <- function(n,p) {
  if(check_trials(n)) {
    if(check_prob(p)) {
      return(aux_variance(n,p))
    }
  }
}

#'@export
bin_mode <- function(n,p) {
  if(check_trials(n)) {
    if(check_prob(p)) {
      return(aux_mode(n,p))
    }
  }
}

#'@export
bin_skewness <- function(n,p) {
  if(check_trials(n)) {
    if(check_prob(p)) {
      return(aux_skewness(n,p))
    }
  }
}

#'@export
bin_kurtosis <- function(n,p) {
  if(check_trials(n)) {
    if(check_prob(p)) {
      return(aux_kurtosis(n,p))
    }
  }
}


