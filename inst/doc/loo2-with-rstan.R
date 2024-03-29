params <-
list(EVAL = TRUE)

## ----SETTINGS-knitr, include=FALSE--------------------------------------------
stopifnot(require(knitr))
opts_chunk$set(
  comment=NA,
  eval = if (isTRUE(exists("params"))) params$EVAL else FALSE,
  dev = "png",
  dpi = 150,
  fig.asp = 0.618,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center"
)

## ----eval=FALSE---------------------------------------------------------------
#  library("rstan")
#  
#  # Prepare data
#  url <- "http://stat.columbia.edu/~gelman/arm/examples/arsenic/wells.dat"
#  wells <- read.table(url)
#  wells$dist100 <- with(wells, dist / 100)
#  X <- model.matrix(~ dist100 + arsenic, wells)
#  standata <- list(y = wells$switch, X = X, N = nrow(X), P = ncol(X))
#  
#  # Fit model
#  fit_1 <- stan("logistic.stan", data = standata)
#  print(fit_1, pars = "beta")

## ----eval=FALSE---------------------------------------------------------------
#  library("loo")
#  
#  # Extract pointwise log-likelihood
#  # using merge_chains=FALSE returns an array, which is easier to
#  # use with relative_eff()
#  log_lik_1 <- extract_log_lik(fit_1, merge_chains = FALSE)
#  
#  # as of loo v2.0.0 we can optionally provide relative effective sample sizes
#  # when calling loo, which allows for better estimates of the PSIS effective
#  # sample sizes and Monte Carlo error
#  r_eff <- relative_eff(exp(log_lik_1), cores = 2)
#  
#  # preferably use more than 2 cores (as many cores as possible)
#  # will use value of 'mc.cores' option if cores is not specified
#  loo_1 <- loo(log_lik_1, r_eff = r_eff, cores = 2)
#  print(loo_1)

## ----eval=FALSE---------------------------------------------------------------
#  standata$X[, "arsenic"] <- log(standata$X[, "arsenic"])
#  fit_2 <- stan(fit = fit_1, data = standata)
#  
#  log_lik_2 <- extract_log_lik(fit_2, merge_chains = FALSE)
#  r_eff_2 <- relative_eff(exp(log_lik_2))
#  loo_2 <- loo(log_lik_2, r_eff = r_eff_2, cores = 2)
#  print(loo_2)

## ----eval=FALSE---------------------------------------------------------------
#  # Compare
#  comp <- loo_compare(loo_1, loo_2)

## ----eval=FALSE---------------------------------------------------------------
#  print(comp) # can set simplify=FALSE for more detailed print output

