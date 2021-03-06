% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse_response.R
\name{parse_response}
\alias{parse_response}
\title{Convert \code{response} object to data frame}
\usage{
parse_response(x)
}
\arguments{
\item{x}{A response object.}
}
\value{
A data frame.
}
\description{
The function converts response object obtained via
 \code{\link{query_scotstat}} function and returns a data frame.
}
\examples{
\dontrun{
parse_response(x = query_scotstat(query = "SELECT * { ?s ?p ?o } LIMIT 10"))
}
}
