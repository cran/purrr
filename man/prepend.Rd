% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deprec-prepend.R
\name{prepend}
\alias{prepend}
\title{Prepend a vector}
\usage{
prepend(x, values, before = NULL)
}
\arguments{
\item{x}{the vector to be modified.}

\item{values}{to be included in the modified vector.}

\item{before}{a subscript, before which the values are to be appended. If
\code{NULL}, values will be appended at the beginning even for \code{x} of length 0.}
}
\value{
A merged vector.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

This function was deprecated in purrr 1.0.0 because it's not related to the
core purpose of purrr.

This is a companion to \code{\link[=append]{append()}} to help merging two
lists or atomic vectors. \code{prepend()} is a clearer semantic
signal than \code{c()} that a vector is to be merged at the beginning of
another, especially in a pipe chain.
}
\examples{
x <- as.list(1:3)

x |> append("a")
x |> prepend("a")
x |> prepend(list("a", "b"), before = 3)
prepend(list(), x)
}
\keyword{internal}
