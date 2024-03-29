% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loo_approximate_posterior.R
\name{loo_approximate_posterior}
\alias{loo_approximate_posterior}
\alias{loo_approximate_posterior.array}
\alias{loo_approximate_posterior.matrix}
\alias{loo_approximate_posterior.function}
\title{Efficient approximate leave-one-out cross-validation (LOO) for posterior
approximations}
\usage{
loo_approximate_posterior(x, log_p, log_g, ...)

\method{loo_approximate_posterior}{array}(
  x,
  log_p,
  log_g,
  ...,
  save_psis = FALSE,
  cores = getOption("mc.cores", 1)
)

\method{loo_approximate_posterior}{matrix}(
  x,
  log_p,
  log_g,
  ...,
  save_psis = FALSE,
  cores = getOption("mc.cores", 1)
)

\method{loo_approximate_posterior}{`function`}(
  x,
  ...,
  data = NULL,
  draws = NULL,
  log_p = NULL,
  log_g = NULL,
  save_psis = FALSE,
  cores = getOption("mc.cores", 1)
)
}
\arguments{
\item{x}{A log-likelihood array, matrix, or function.
The \strong{Methods (by class)} section, below, has detailed descriptions of how
to specify the inputs for each method.}

\item{log_p}{The log-posterior (target) evaluated at S samples from the
proposal distribution (g). A vector of length S.}

\item{log_g}{The log-density (proposal) evaluated at S samples from the
proposal distribution (g). A vector of length S.}

\item{save_psis}{Should the \code{"psis"} object created internally by
\code{loo_approximate_posterior()} be saved in the returned object? See
\code{\link[=loo]{loo()}} for details.}

\item{cores}{The number of cores to use for parallelization. This defaults to
the option \code{mc.cores} which can be set for an entire R session by
\code{options(mc.cores = NUMBER)}. The old option \code{loo.cores} is now
deprecated but will be given precedence over \code{mc.cores} until
\code{loo.cores} is removed in a future release. \strong{As of version
2.0.0 the default is now 1 core if \code{mc.cores} is not set}, but we
recommend using as many (or close to as many) cores as possible.
\itemize{
\item Note for Windows 10 users: it is \strong{strongly}
\href{https://github.com/stan-dev/loo/issues/94}{recommended} to avoid using
the \code{.Rprofile} file to set \code{mc.cores} (using the \code{cores} argument or
setting \code{mc.cores} interactively or in a script is fine).
}}

\item{data, draws, ...}{For the \code{loo_approximate_posterior.function()} method,
these are the data, posterior draws, and other arguments to pass to the
log-likelihood function. See the \strong{Methods (by class)} section below for
details on how to specify these arguments.}
}
\value{
The \code{loo_approximate_posterior()} methods return a named list with
class \code{c("psis_loo_ap", "psis_loo", "loo")}. It has the same structure
as the objects returned by \code{\link[=loo]{loo()}} but with the additional slot:
\describe{
\item{\code{posterior_approximation}}{
A list with two vectors, \code{log_p} and \code{log_g} of the same length
containing the posterior density and the approximation density
for the individual draws.
}
}
}
\description{
Efficient approximate leave-one-out cross-validation (LOO) for posterior
approximations
}
\details{
The \code{loo_approximate_posterior()} function is an S3 generic and
methods are provided for 3-D pointwise log-likelihood arrays, pointwise
log-likelihood matrices, and log-likelihood functions. The implementation
works for posterior approximations where it is possible to compute the log
density for the posterior approximation.
}
\section{Methods (by class)}{
\itemize{
\item \code{loo_approximate_posterior(array)}: An \eqn{I} by \eqn{C} by \eqn{N} array, where \eqn{I}
is the number of MCMC iterations per chain, \eqn{C} is the number of
chains, and \eqn{N} is the number of data points.

\item \code{loo_approximate_posterior(matrix)}: An \eqn{S} by \eqn{N} matrix, where \eqn{S} is the size
of the posterior sample (with all chains merged) and \eqn{N} is the number
of data points.

\item \code{loo_approximate_posterior(`function`)}: A function \code{f()} that takes arguments \code{data_i} and \code{draws} and returns a
vector containing the log-likelihood for a single observation \code{i} evaluated
at each posterior draw. The function should be written such that, for each
observation \code{i} in \code{1:N}, evaluating

\if{html}{\out{<div class="sourceCode">}}\preformatted{f(data_i = data[i,, drop=FALSE], draws = draws)
}\if{html}{\out{</div>}}

results in a vector of length \code{S} (size of posterior sample). The
log-likelihood function can also have additional arguments but \code{data_i} and
\code{draws} are required.

If using the function method then the arguments \code{data} and \code{draws} must also
be specified in the call to \code{loo()}:
\itemize{
\item \code{data}: A data frame or matrix containing the data (e.g.
observed outcome and predictors) needed to compute the pointwise
log-likelihood. For each observation \code{i}, the \code{i}th row of
\code{data} will be passed to the \code{data_i} argument of the
log-likelihood function.
\item \code{draws}: An object containing the posterior draws for any
parameters needed to compute the pointwise log-likelihood. Unlike
\code{data}, which is indexed by observation, for each observation the
entire object \code{draws} will be passed to the \code{draws} argument of
the log-likelihood function.
\item The \code{...} can be used if your log-likelihood function takes additional
arguments. These arguments are used like the \code{draws} argument in that they
are recycled for each observation.
}

}}
\references{
Magnusson, M., Riis Andersen, M., Jonasson, J. and Vehtari, A. (2019).
Leave-One-Out Cross-Validation for Large Data.
In \emph{Thirty-sixth International Conference on Machine Learning},
PMLR 97:4244-4253.

Magnusson, M., Riis Andersen, M., Jonasson, J. and Vehtari, A. (2020).
Leave-One-Out Cross-Validation for Model Comparison in Large Data.
In \emph{Proceedings of the 23rd International Conference on Artificial
Intelligence and Statistics (AISTATS)}, PMLR 108:341-351.
}
\seealso{
\code{\link[=loo]{loo()}}, \code{\link[=psis]{psis()}}, \code{\link[=loo_compare]{loo_compare()}}
}
