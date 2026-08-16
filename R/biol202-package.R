#' biol202: Tutorials and Datasets for BIOL 202
#'
#' Course materials for BIOL 202 (Introduction to Biostatistics) at UBC
#' Okanagan. The package bundles the documented teaching datasets used
#' throughout the lab tutorials, and installs every other R package the course
#' requires.
#'
#' The tutorials themselves are a separate website, so that corrections can be
#' published mid-term without students having to reinstall anything:
#' <https://ubco-biology.github.io/BIOL202-lab-tutorials/>.
#'
#' @section Installing:
#' Students install the package once, at the start of term:
#'
#' ```r
#' remotes::install_github("ubco-biology/biol202_ubco")
#' ```
#'
#' Note that the *repository* is `biol202_ubco` but the *package* is `biol202`.
#' The names differ because R does not permit underscores in package names. So
#' the install line and the library line do not match, and that is expected:
#'
#' ```r
#' library(biol202)
#' ```
#'
#' Installing `biol202` also installs every other package used in the course, so
#' there is nothing else to install.
#'
#' @section Loading packages in this course:
#' The tutorials load the individual packages they use, rather than loading
#' `tidyverse` as a whole:
#'
#' ```r
#' library(dplyr)
#' library(ggplot2)
#' library(readr)
#' ```
#'
#' This is deliberate and consistent all term. It means you can always tell
#' which package a function came from, and when something goes wrong the error
#' message points somewhere you can look. Note that `library(biol202)` does not
#' load `dplyr` or `ggplot2` for you -- you still load those yourself, as above.
#'
#' @section A note for maintainers -- the expected R CMD check NOTE:
#' `R CMD check` reports:
#'
#' ```
#' Namespaces in Imports field not imported from: ... All declared Imports
#' should be used.
#' ```
#'
#' This NOTE is expected and should not be "fixed". The packages in `Imports`
#' are not used by this package's own R code; they are declared so that
#' installing `biol202` installs everything the *students* need for the
#' tutorials, in one step. That is the whole point of the package: one install
#' at the start of term instead of 280 students each debugging a package
#' install in week 1.
#'
#' The alternative placements are worse. `Suggests` would not be installed by
#' default by `remotes::install_github()`, defeating the purpose. `Depends`
#' would attach every package on `library(biol202)`, which contradicts the
#' teaching convention above.
#'
#' @section Datasets:
#' Run `data(package = "biol202")` to list the bundled datasets, and use `?` for
#' any of them (for example `?birds`) to read its documentation. Those help
#' pages are the course's data dictionary: each records units, variable
#' meanings, missing values, and provenance.
#'
#' Datasets are rebuilt from their raw CSV sources by `data-raw/make_data.R`.
#'
#' @section Licence:
#' Code is MIT. Content and data are CC BY-NC-SA 4.0. See `LICENSE-CONTENT.md`
#' for details, including the third-party data included here.
#'
#' @keywords internal
"_PACKAGE"
