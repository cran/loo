% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loo_subsample.R
\name{.thin_draws}
\alias{.thin_draws}
\alias{.thin_draws.matrix}
\alias{.thin_draws.numeric}
\alias{.thin_draws.default}
\title{Thin a draws object}
\usage{
.thin_draws(draws, loo_approximation_draws)

\method{.thin_draws}{matrix}(draws, loo_approximation_draws)

\method{.thin_draws}{numeric}(draws, loo_approximation_draws)

\method{.thin_draws}{default}(draws, loo_approximation_draws)
}
\arguments{
\item{draws}{A draws object with posterior draws.}

\item{loo_approximation_draws}{The number of posterior draws to return (ie after thinning).}
}
\value{
A thinned draws object.
}
\description{
Thin a draws object
}
\details{
This is a generic function to thin draws from arbitrary draws
objects. The function is internal and should only be used by developers to
enable \code{\link[=loo_subsample]{loo_subsample()}} for arbitrary draws objects.
}
\keyword{internal}
