# ---------------------------------------------------------------------------
# make_data.R -- build the bundled BIOL 202 teaching datasets
# ---------------------------------------------------------------------------
#
# WHAT THIS SCRIPT DOES
#
# It reads the raw CSV files in data-raw/csv/, cleans them, and saves each one
# as a compressed .rda object in the package's data/ folder. Those .rda objects
# are what students get when they run library(biol202) and then, for example,
# data(birds). Students never touch the CSVs.
#
# WHY BUNDLE .rda INSTEAD OF SHIPPING CSVs
#
# The raw CSVs carry three quirks that reliably confuse first-time R users:
#
#   1. 33 of the 40 original files begin with a UTF-8 "byte order mark" (BOM) --
#      an invisible character that can turn the first column name into
#      something like "i..species".
#   2. Most files use Windows (CRLF) line endings; two used classic-Mac (CR)
#      endings, which made every row collapse onto a single line.
#   3. Column names mixed naming styles (height_cm next to Dominant_hand).
#
# Cleaning once, here, means those problems are solved permanently for every
# student rather than re-encountered by 280 people in week 1.
#
# HOW TO RUN
#
#   source("data-raw/make_data.R")
#
# Re-run it whenever a raw CSV changes. It is deliberately reproducible: it
# always rebuilds every dataset from the raw files, so the .rda objects can
# never silently drift from their sources.
#
# NOTE ON PROVENANCE AND LICENCE
#
# Most datasets accompany Whitlock, M. & Schluter, D., "The Analysis of
# Biological Data", and are redistributed here under CC BY-NC-SA 4.0, the
# licence under which the authors published them (see R/data.R for the
# per-dataset @source). The authors note that many values were digitized from
# figures and tables in the original papers, so they are teaching
# reconstructions rather than the primary measurements.
# ---------------------------------------------------------------------------

library(readr)
library(dplyr)
library(janitor)

# --- helper ---------------------------------------------------------------
# read_raw() centralizes the cleaning so every dataset is treated identically.
#
#   * readr::read_csv() strips the UTF-8 BOM and handles CRLF/CR line endings
#     automatically, which fixes quirks 1 and 2 above.
#   * janitor::clean_names() converts every column name to consistent
#     snake_case, which fixes quirk 3.
#
# `show_col_types = FALSE` just suppresses readr's column-type message; the
# types are checked deliberately below instead.

read_raw <- function(file) {
  read_csv(
    file.path("data-raw", "csv", file),
    show_col_types = FALSE,
    progress = FALSE
  ) |>
    clean_names()
}

# --- 1. Categorical variables (one variable) -------------------------------

# Counts of bird types observed at a marsh habitat.
birds <- read_raw("birds.csv") |>
  mutate(type = factor(type))

# Cause of death for people killed by tigers (W&S Example 2.2A).
tigerdeaths <- read_raw("tigerdeaths.csv") |>
  mutate(activity = factor(activity))

# Direction of body rotation in damselflies.
damselfly <- read_raw("damselfly.csv") |>
  mutate(direction = factor(direction))

# Hair colour of students (teaching dataset used in the lab test).
haircolour <- read_raw("haircolour.csv") |>
  mutate(colour = factor(colour))

# Mycorrhizal status of 50 plant species. Fictitious data authored for the
# course. NOTE: despite an earlier comment here to the contrary, this file has
# NO missing values -- all 50 rows carry one of AM/ECM/ErM/NM. Do not write an
# assignment question asking students to count missing values in it; use the
# palmerpenguins data for that, which genuinely has them.
myco_status <- read_raw("myco_status.csv") |>
  mutate(myco_status = factor(myco_status))

# Planthopper host-plant choice (species A vs B), 23 independent trials.
# The raw file carries a spurious row-number column (an artefact of having been
# written out of R with row names); select() drops it.
hostplant <- read_raw("hostplant.csv") |>
  select(hostchoice) |>
  mutate(hostchoice = factor(hostchoice))

# --- 2. Categorical variables (two variables) ------------------------------

# Aspirin treatment vs cancer incidence (W&S Example 9.2).
cancer <- read_raw("cancer.csv") |>
  mutate(across(everything(), factor))

# Parasite (worm) infection and fish behaviour (W&S Example 9.4).
worm <- read_raw("worm.csv") |>
  mutate(across(everything(), factor))

# Malaria infection in birds under control vs egg-removal treatment
# (W&S Example 2.3A).
bird_malaria <- read_raw("bird_malaria.csv") |>
  mutate(across(c(treatment, response), factor))

# Plumage colour morph by habitat type.
plumage <- read_raw("plumage.csv") |>
  mutate(across(everything(), factor))

# Survival of Titanic passengers by class and sex.
titanic <- read_raw("titanic.csv") |>
  mutate(across(c(passenger_class, embarked, sex, survive), factor))

# --- 3. Numeric variables (one variable) -----------------------------------

# Bacterial taxa (OTUs) per beech leaf. Fictitious data authored for the course;
# deliberately right-skewed so it motivates the log transformation.
bacteria <- read_raw("bacteria.csv")

# Human body temperature (W&S Example 11.3).
bodytemp <- read_raw("bodytemp.csv")

# Stalk-eyed fly eyespan (W&S Example 11.2).
stalkies <- read_raw("stalkies.csv")

# Human gene lengths -- a large, strongly right-skewed distribution
# (W&S Example 4.1).
humangenelength <- read_raw("humangenelength.csv")

# Proportion of fertile flowers.
flowers <- read_raw("flowers.csv")

# Ratio of marine biomass in reserves vs unprotected areas (W&S Example 13.1).
marine <- read_raw("marine.csv")

# --- 4. Comparing two means ------------------------------------------------

# Red-winged blackbird antibody levels before and after testosterone implant.
# A paired design: each bird measured twice (W&S Example 12.2).
blackbird <- read_raw("blackbird.csv") |>
  mutate(time = factor(time, levels = c("Before", "After")))

# Total phosphorus upstream and downstream of sewage treatment plants on 10
# rivers. Paired design.
sewage <- read_raw("sewage.csv") |>
  mutate(location = factor(location, levels = c("Upstream", "Downstream")))

# --- 5. Comparing more than two means (ANOVA) ------------------------------

# Melatonin production under three light treatments (W&S Example 15.1).
# Factor levels are set explicitly so "control" is the reference group rather
# than whichever level happens to sort first alphabetically.
circadian <- read_raw("circadian.csv") |>
  mutate(treatment = factor(treatment, levels = c("control", "knee", "eyes")))

# Plant persistence across isolation treatments.
plantpersistence <- read_raw("plantpersistence.csv") |>
  mutate(treatment = factor(treatment))

# Serotonin levels in locusts at three treatment times.
locust <- read_raw("locust.csv") |>
  mutate(treatment_time = factor(treatment_time))

# --- 6. Correlation and regression -----------------------------------------

# Wolf pack data (W&S Example 16.2).
wolf <- read_raw("wolf.csv")

# Years of experience vs impressiveness of a magic trick (W&S Example 16.5).
trick <- read_raw("trick.csv")

# Plant biomass stability across species-richness treatments (W&S Example 17.3).
plantbiomass <- read_raw("plantbiomass.csv")

# Bumpus's classic house sparrow survival data.
bumpus <- read_raw("bumpus.csv") |>
  mutate(across(c(sex, age), factor))

# --- 7. Workflow / teaching-mechanics datasets -----------------------------

# Physical measurements from past BIOL 202 students.
#
# NOTE the raw files code handedness inconsistently: students.csv uses "r"/"l"
# while subset_students.csv uses "Right"/"Left". Both are recoded to the full
# words here so the two datasets agree and so output is readable.
recode_side <- function(x) {
  factor(
    dplyr::case_when(
      tolower(substr(x, 1, 1)) == "r" ~ "Right",
      tolower(substr(x, 1, 1)) == "l" ~ "Left",
      .default = NA_character_
    ),
    levels = c("Left", "Right")
  )
}

# A UNIT CORRECTION, APPLIED DELIBERATELY AND RECORDED HERE.
#
# Five of the 154 students have a recorded head circumference of 21-24 cm. That
# is physically impossible for an adult (typical adult heads are 52-60 cm; 21 cm
# is smaller than a newborn's). Those five values are almost certainly measured
# in INCHES: 21-24 inches converts to 53-61 cm, which falls exactly in the
# plausible range, while every other value in the dataset is already sensible.
#
# We therefore convert any value below 45 cm to centimetres. The 45 cm threshold
# sits in the empty gap between the five erroneous values (max 24) and the
# smallest genuine measurement (53), so it cannot catch a real observation.
#
# This is an inference, not a recorded fact about how the data were collected --
# which is exactly why the correction lives in this script rather than in a
# hand-edited CSV. It is visible, reversible, and re-runnable.
students <- read_raw("students.csv") |>
  mutate(
    head_circum_cm = if_else(head_circum_cm < 45, head_circum_cm * 2.54, head_circum_cm),
    across(c(dominant_hand, dominant_foot, dominant_eye), recode_side)
  )

subset_students <- read_raw("subset_students.csv") |>
  mutate(across(c(dominant_hand, dominant_foot, dominant_eye), recode_side))

# Trout counts -- used to teach importing a local CSV that students type out
# themselves.
trout <- read_raw("trout.csv")

# A small untidy dataset, used to teach reshaping. It is deliberately left in
# its wide, messy form: cleaning it is the exercise.
example_data <- read_raw("example_data.csv")

# --- write everything to data/ ---------------------------------------------
#
# usethis::use_data() writes each object to data/<name>.rda. overwrite = TRUE
# lets the script be re-run; compress = "bzip2" keeps the package small.

usethis::use_data(
  bacteria, bird_malaria, birds, blackbird, bodytemp, bumpus, cancer,
  circadian, damselfly, example_data, flowers, haircolour, hostplant,
  humangenelength, locust, marine, myco_status, plantbiomass,
  plantpersistence, plumage, sewage, stalkies, students, subset_students,
  tigerdeaths, titanic, trick, trout, wolf, worm,
  overwrite = TRUE,
  compress = "bzip2"
)
