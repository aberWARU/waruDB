% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/saveSampleTracker.R
\name{saveSampleTracker}
\alias{saveSampleTracker}
\title{Save Sample Tracker}
\usage{
saveSampleTracker(formData, db_connection)
}
\arguments{
\item{formData}{the reactive output from `formData`}

\item{db_connection}{a `dbPool` or `RMariaDB` database connection}
}
\description{
Save data captured from a form entry reactive into the *SampleTracker* table
}
