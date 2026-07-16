# Tests that every bundled dataset is documented, and that the documentation
# actually matches the data.
#
# WHY THIS TEST EXISTS
#
# The roxygen help pages in R/data.R are the course's data dictionary: they are
# what students read to find out what a variable means and what units it is in.
# Documentation that has drifted from the data is worse than none, because it is
# believed. These tests fail loudly if a variable is renamed in
# data-raw/make_data.R without the matching help page being updated.
#
# (This is not hypothetical -- two datasets were documented under each other's
# names while the package was first written, which a check like this catches.)

# All datasets bundled in the package.
dataset_names <- utils::data(package = "biol202")$results[, "Item"]

# tools::Rd_db() reads the package's installed help database and gives back the
# parsed Rd source for each topic. That is the reliable way to inspect help text
# programmatically -- utils::help() returns an object for *display*, and printing
# it does not yield the underlying text.
rd_text_for <- function(db, nm) {
  topic <- paste0(nm, ".Rd")
  if (!topic %in% names(db)) {
    return(NA_character_)
  }
  paste(as.character(db[[topic]]), collapse = " ")
}

test_that("every bundled dataset has a help page", {
  db <- tools::Rd_db("biol202")
  skip_if(length(db) == 0, "package help database not built")

  for (nm in dataset_names) {
    expect_true(
      paste0(nm, ".Rd") %in% names(db),
      info = paste("no help page found for dataset:", nm)
    )
  }
})

test_that("documented variables match the variables in the data", {
  db <- tools::Rd_db("biol202")
  skip_if(length(db) == 0, "package help database not built")

  for (nm in dataset_names) {
    d <- get(nm, envir = asNamespace("biol202"))
    rd_text <- rd_text_for(db, nm)
    skip_if(is.na(rd_text), paste("no Rd for", nm))

    for (v in names(d)) {
      expect_true(
        grepl(v, rd_text, fixed = TRUE),
        info = paste0("variable '", v, "' of dataset '", nm,
                      "' is not mentioned in its help page")
      )
    }
  }
})

test_that("documented row counts match the data", {
  db <- tools::Rd_db("biol202")
  skip_if(length(db) == 0, "package help database not built")

  for (nm in dataset_names) {
    d <- get(nm, envir = asNamespace("biol202"))
    rd_text <- rd_text_for(db, nm)
    skip_if(is.na(rd_text), paste("no Rd for", nm))

    # Help pages say "A data frame with N rows and M variables".
    m <- regmatches(rd_text, regexpr("with [0-9,]+ rows", rd_text))
    if (length(m) == 1) {
      stated <- as.numeric(gsub("[^0-9]", "", m))
      expect_equal(
        stated, nrow(d),
        info = paste0("dataset '", nm, "': help page says ", stated,
                      " rows but the data have ", nrow(d))
      )
    }
  }
})

test_that("no dataset is empty and none has duplicate variable names", {
  for (nm in dataset_names) {
    d <- get(nm, envir = asNamespace("biol202"))
    expect_gt(nrow(d), 0)
    expect_gt(ncol(d), 0)
    expect_false(any(duplicated(names(d))),
                 info = paste("duplicate variable names in:", nm))
  }
})

test_that("known data quirks are preserved deliberately", {
  # These are documented properties that teaching material depends on. If one of
  # these fails, either the data changed or a documented quirk was silently
  # "fixed" -- both need a look.

  # myco_status is used to teach missing-value checks and deliberately has NONE:
  # a check that comes back clean is the normal case. The help page says so, so
  # this guards against someone "helpfully" introducing NAs.
  expect_false(any(is.na(biol202::myco_status$myco_status)))
  expect_equal(nrow(biol202::myco_status), 50)

  # titanic's missing ages are the point of the missing-data discussion.
  expect_true(sum(is.na(biol202::titanic$age)) > 500)

  # bumpus age is structurally missing for every female.
  females <- biol202::bumpus[biol202::bumpus$sex == "f", ]
  expect_true(all(is.na(females$age)))

  # The students head-circumference unit correction was applied: no adult head
  # should be under 45 cm once the five inch-recorded values are converted.
  expect_true(all(biol202::students$head_circum_cm >= 45))

  # example_data must stay untidy -- tidying it is the exercise.
  expect_true(all(c("rep1", "rep5") %in% names(biol202::example_data)))
})
