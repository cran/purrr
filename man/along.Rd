% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deprec-along.R
\name{along}
\alias{along}
\alias{list_along}
\title{Create a list of given length}
\usage{
list_along(x)
}
\arguments{
\item{x}{A vector.}
}
\value{
A list of the same length as \code{x}.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

This function was deprecated in purrr 1.0.0 since it's not related to the
core purpose of purrr.

It can be useful to create an empty list that you plan to fill later. This is
similar to the idea of \code{\link[=seq_along]{seq_along()}}, which creates a vector of the same
length as its input.
}
\examples{
x <- 1:5
seq_along(x)
list_along(x)
}
\keyword{internal}
