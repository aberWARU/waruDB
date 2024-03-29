% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getDashboardName.R
\name{getDashboardName}
\alias{getDashboardName}
\title{Get Dashboard Name}
\usage{
getDashboardName(db_connection, username)
}
\arguments{
\item{db_connection}{a `dbPool` or `RMariaDB` database connection}

\item{username}{a character string of a valid `username`}
}
\value{
a character string of the dashbaord to source
}
\description{
Retrieve the name of the correct login dashbaord to source based the User's access level
}
