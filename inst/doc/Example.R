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
#  # Extract log-likelihood and compute LOO
#  log_lik <- extract_log_lik(fit)
#  loo1 <- loo(log_lik) # or waic(log_lik) to compute WAIC
#  loo1
#  print(loo1, digits = 4)

## ---- eval=FALSE---------------------------------------------------------
#  # First run a second model using log(arsenic) instead of arsenic
#  data$X[,"arsenic"] <- log(data$X[,"arsenic"])
#  fit2 <- stan(fit = fit, data = data)
#  log_lik2 <- extract_log_lik(fit2)
#  loo2 <- loo(log_lik2)
#  
#  # Compare
#  diff <- compare(loo1, loo2)
#  diff
#  print(diff, digits = 3)

