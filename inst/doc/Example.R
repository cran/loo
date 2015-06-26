## ---- eval=FALSE---------------------------------------------------------
#  library("rstan")
#  
#  # Prepare data
#  url <- "http://stat.columbia.edu/~gelman/arm/examples/arsenic/wells.dat"
#  wells <- read.table(url)
#  X <- model.matrix(~I(dist/100) + arsenic, wells)
#  data <- list(N = nrow(wells), K = ncol(X), X = X, y = wells$switch)
#  
#  # Fit model
#  fit <- stan("logistic.stan", data = data) # defaults to iter = 2000, chains = 4

## ---- eval=FALSE---------------------------------------------------------
#  library("loo")
#  
#  # Extract log-likelihood and compute LOO, WAIC
#  log_lik <- extract_log_lik(fit)
#  loo <- loo_and_waic(log_lik)
#  print(loo)
#  # loo and waic are the same out to several decimal places for this model
#  print(loo, digits = 4)

## ---- eval=FALSE---------------------------------------------------------
#  # First run a second model using log(arsenic) instead of arsenic
#  data$X[,"arsenic"] <- log(data$X[,"arsenic"])
#  fit2 <- stan(fit = fit, data = data)
#  log_lik2 <- extract_log_lik(fit2)
#  loo2 <- loo_and_waic(log_lik2)
#  
#  # Compare using loo_and_waic_diff
#  diff <- loo_and_waic_diff(loo, loo2)

