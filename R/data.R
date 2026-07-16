# ---------------------------------------------------------------------------
# data.R -- documentation for the bundled BIOL 202 teaching datasets
# ---------------------------------------------------------------------------
#
# Each dataset below is documented with roxygen2. These help pages ARE the data
# dictionary for the package: every variable gets a type, units where
# applicable, a description, and a note where values may be missing. Every
# dataset records its provenance and licence in @source.
#
# View any of these in R with, for example: ?birds
#
# The datasets themselves are built by data-raw/make_data.R. If you change a
# variable there, update its entry here.
#
# PROVENANCE NOTE (applies to every dataset marked "W&S" below)
#
# Datasets accompanying Whitlock & Schluter's "The Analysis of Biological Data"
# are redistributed here under CC BY-NC-SA 4.0, the licence under which the
# authors published them. The authors note that most values were digitized from
# graphs and tables in the original publications and "may not be exact" -- these
# are teaching reconstructions, not the primary measurements. Anyone needing the
# original data should contact the original study authors.
# ---------------------------------------------------------------------------


# === One categorical variable ==============================================

#' Bird types observed at a marsh
#'
#' Counts of birds, classified by type, observed at a marsh habitat. Used to
#' practise frequency tables and bar charts for a single categorical variable.
#'
#' @format A data frame with 86 rows and 1 variable:
#' \describe{
#'   \item{type}{factor. Type of bird observed. One of `Predatory`,
#'     `Shorebird`, `Songbird`, `Waterfowl`. Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"birds"

#' Human deaths caused by tigers, by activity
#'
#' What each person was doing when killed by a tiger, near Chitwan National
#' Park, Nepal. Used to practise frequency tables and bar charts, and to
#' motivate ordering categories by frequency rather than alphabetically.
#'
#' @format A data frame with 88 rows and 2 variables:
#' \describe{
#'   \item{person}{numeric. Individual identifier, 1-88. Not missing.}
#'   \item{activity}{factor. Activity the person was engaged in when killed
#'     (e.g. `Disturbing tiger kill`, `Fishing`, `Forest products`,
#'     `Fuelwood/timber`, `Grass/fodder`, `Herding`, `Toilet`). Not missing.}
#' }
#' @source W&S Example 2.2A. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"tigerdeaths"

#' Direction of damselfly wing-spot rotation
#'
#' Direction in which each of 20 damselflies rotated. Used to teach the
#' binomial test and confidence intervals for a proportion, where the null
#' expectation of an even split (p = 0.5) is biologically natural.
#'
#' @format A data frame with 20 rows and 1 variable:
#' \describe{
#'   \item{direction}{factor. Direction of rotation: `clockwise` or
#'     `counter_clockwise`. Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"damselfly"

#' Student hair colour
#'
#' Hair colour recorded for 100 students. Used to practise frequency and
#' relative-frequency tables.
#'
#' @format A data frame with 100 rows and 1 variable:
#' \describe{
#'   \item{colour}{factor. Hair colour: `Black`, `Blonde`, `Brown`, `Red`.
#'     Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"haircolour"

#' Mycorrhizal status of plant species
#'
#' Mycorrhizal symbiosis type for 50 plant species randomly selected from a
#' regional flora. Most land plants form symbioses with mycorrhizal fungi, and
#' several distinct types of symbiosis exist.
#'
#' These data are **fictitious**, authored for the course. The dataset is used
#' to teach students to check for missing values before analysis -- and here the
#' answer is that there are none. That is deliberate: a missing-data check that
#' comes back clean is the normal case, and students should still perform it.
#'
#' @format A data frame with 50 rows and 1 variable:
#' \describe{
#'   \item{myco_status}{factor. Mycorrhizal status: `AM` (arbuscular
#'     mycorrhizal), `ECM` (ectomycorrhizal), `ErM` (ericoid mycorrhizal),
#'     `NM` (non-mycorrhizal). Not missing (16 ECM, 13 AM, 12 NM, 9 ErM).}
#' }
#' @source Fictitious data authored for BIOL 202, UBC Okanagan.
"myco_status"

#' Planthopper host-plant choice
#'
#' Results of 23 independent trials in which a planthopper chose between two
#' host plant species. The researcher's question was whether planthoppers
#' prefer one host species over the other -- a natural binomial test with a
#' null of no preference.
#'
#' @format A data frame with 23 rows and 1 variable:
#' \describe{
#'   \item{hostchoice}{factor. Host plant species chosen: `A` or `B`.
#'     Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"hostplant"


# === Two categorical variables =============================================

#' Aspirin treatment and cancer incidence
#'
#' A large randomized clinical trial of whether regular aspirin reduces cancer
#' incidence in women. Used to teach contingency tables, the chi-square test of
#' association, and odds ratios. The large sample size makes a useful contrast
#' with `worm`: here a very small effect is still detectable.
#'
#' @format A data frame with 39,876 rows and 2 variables:
#' \describe{
#'   \item{aspirin_treatment}{factor. Treatment received: `Aspirin` or
#'     `Placebo`. Not missing.}
#'   \item{response}{factor. Outcome: `Cancer` or `No cancer`. Not missing.}
#' }
#' @source W&S Example 9.2. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"cancer"

#' Parasite infection and being eaten
#'
#' Whether fish infected with a trematode parasite were eaten by birds, the
#' parasite's next host. Tests the hypothesis that the parasite manipulates its
#' host's behaviour to promote transmission. Used to teach contingency tables
#' and the chi-square test of association.
#'
#' @format A data frame with 141 rows and 2 variables:
#' \describe{
#'   \item{infection}{factor. Infection level: `uninfected`, `lightly`,
#'     `highly`. Not missing.}
#'   \item{fate}{factor. Whether the fish was `eaten` or `not eaten`.
#'     Not missing.}
#' }
#' @source W&S Example 9.4. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"worm"

#' Malaria infection and reproductive effort in birds
#'
#' An experiment testing whether increased reproductive effort raises the risk
#' of malaria infection. Birds in the treatment group had eggs removed, forcing
#' them to lay again. Used to teach association between two categorical
#' variables, and the distinction between experimental and observational
#' evidence for causation.
#'
#' @format A data frame with 65 rows and 3 variables:
#' \describe{
#'   \item{bird}{numeric. Individual bird identifier, 1-65. Not missing.}
#'   \item{treatment}{factor. Experimental group: `Control` or `Egg removal`.
#'     Not missing.}
#'   \item{response}{factor. Infection outcome: `Malaria` or `No Malaria`.
#'     Not missing.}
#' }
#' @source W&S Example 2.3A. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"bird_malaria"

#' Bird plumage colour and habitat
#'
#' Plumage colour morph recorded for 30 randomly sampled birds in each of two
#' habitats. The researcher suspected that colour morph depends on nesting
#' habitat. Used in assignments for the chi-square test of association.
#'
#' @format A data frame with 60 rows and 2 variables:
#' \describe{
#'   \item{colour}{factor. Plumage colour morph: `blue`, `brown`, `red`.
#'     Not missing.}
#'   \item{habitat}{factor. Habitat sampled: `forest` or `grassland`.
#'     Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"plumage"

#' Survival of Titanic passengers
#'
#' Passenger records from the 1912 sinking of the RMS Titanic. Used to teach
#' contingency tables and association, and as a realistic example of a dataset
#' with substantial missing data.
#'
#' Note the missingness: `age` is missing for 680 of 1,313 passengers (52%),
#' and `destination` for 558. This is not random -- records were less complete
#' for third-class passengers -- which makes the dataset a good prompt for
#' discussing what missing data can do to a conclusion.
#'
#' @format A data frame with 1,313 rows and 7 variables:
#' \describe{
#'   \item{passenger_class}{factor. Travel class: `1st`, `2nd`, `3rd`.
#'     Not missing.}
#'   \item{name}{character. Passenger name. Not missing.}
#'   \item{age}{numeric. Age in years. **Missing for 680 passengers.**}
#'   \item{embarked}{factor. Port of embarkation: `Cherbourg`, `Queenstown`,
#'     `Southampton`. **Missing for 493 passengers.**}
#'   \item{destination}{character. Intended destination. **Missing for 558
#'     passengers.**}
#'   \item{sex}{factor. `female` or `male`. Not missing.}
#'   \item{survive}{factor. Survived the sinking: `yes` or `no`. Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan, derived from the
#'   widely distributed public-domain Titanic passenger list.
"titanic"


# === One numeric variable ==================================================

#' Bacterial taxa on beech leaves
#'
#' The number of unique bacterial taxa (operational taxonomic units, OTUs)
#' identified on one randomly chosen leaf from each of 20 randomly chosen
#' American beech trees.
#'
#' These data are **fictitious**, authored for the course. The distribution is
#' deliberately strongly right-skewed, so it motivates the log transformation.
#'
#' @format A data frame with 20 rows and 1 variable:
#' \describe{
#'   \item{num_taxa}{numeric. Number of bacterial OTUs on the leaf; counts,
#'     range 47-4668. Not missing.}
#' }
#' @source Fictitious data authored for BIOL 202, UBC Okanagan.
"bacteria"

#' Human body temperature
#'
#' Body temperature of 25 randomly chosen healthy people. Used to teach the
#' one-sample t-test, notably against the conventional value of 98.6 degrees F.
#'
#' @format A data frame with 25 rows and 2 variables:
#' \describe{
#'   \item{individual}{numeric. Person identifier, 1-25. Not missing.}
#'   \item{temperature}{numeric. Body temperature in degrees Fahrenheit;
#'     range 97.4-100.0. Not missing.}
#' }
#' @source W&S Example 11.3. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"bodytemp"

#' Stalk-eyed fly eyespan
#'
#' Eyespan measurements from 9 male stalk-eyed flies. A deliberately small
#' sample, used to teach confidence intervals for a mean where the t
#' distribution matters.
#'
#' @format A data frame with 9 rows and 2 variables:
#' \describe{
#'   \item{individual}{numeric. Fly identifier, 1-9. Not missing.}
#'   \item{eyespan}{numeric. Eyespan in millimetres; range 8.15-9.45.
#'     Not missing.}
#' }
#' @source W&S Example 11.2. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"stalkies"

#' Human gene lengths
#'
#' Lengths of 22,385 known human genes. A large, strongly right-skewed
#' distribution, used to teach histograms, skew, and why the mean and median
#' diverge -- and, later, as a population to sample from when demonstrating
#' sampling distributions.
#'
#' @format A data frame with 22,385 rows and 4 variables:
#' \describe{
#'   \item{gene}{character. Ensembl gene identifier. Not missing.}
#'   \item{size}{numeric. Gene length in number of nucleotides;
#'     range 69-109,200. Not missing.}
#'   \item{name}{character. Gene symbol (e.g. `TSPAN6`). Not missing.}
#'   \item{description}{character. Short description of the gene product.
#'     **Missing for 432 genes.**}
#' }
#' @source W&S Example 4.1. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"humangenelength"

#' Proportion of fertile flowers
#'
#' Proportion of flowers that were fertile in each of 30 plants. Because the
#' values are proportions bounded at 0 and 1, this dataset is used to teach the
#' arcsine square-root transformation.
#'
#' @format A data frame with 30 rows and 1 variable:
#' \describe{
#'   \item{prop_fertile}{numeric. Proportion of flowers that were fertile;
#'     unitless, range 0.006-0.987. Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"flowers"

#' Biomass ratio in marine reserves
#'
#' Ratio of biomass inside a marine reserve to biomass in a comparable
#' unprotected area, for 32 reserves. A ratio of 1 means no difference, so the
#' dataset is used to teach one-sample tests, log transformation (ratios are
#' naturally multiplicative), and the sign/Wilcoxon alternatives.
#'
#' @format A data frame with 32 rows and 1 variable:
#' \describe{
#'   \item{biomass_ratio}{numeric. Biomass in reserve divided by biomass
#'     outside; unitless, range 0.83-4.25. Not missing.}
#' }
#' @source W&S Example 13.1. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"marine"


# === Comparing two means ===================================================

#' Blackbird antibody levels before and after testosterone
#'
#' Antibody production measured in 13 red-winged blackbirds before and after
#' testosterone implantation. Because each bird is measured twice, the
#' measurements are not independent -- this is the course's worked example of a
#' **paired** t-test.
#'
#' The data are in long format: 13 birds x 2 time points = 26 rows.
#'
#' @format A data frame with 26 rows and 3 variables:
#' \describe{
#'   \item{blackbird}{numeric. Bird identifier, 1-13. Each appears twice.
#'     Not missing.}
#'   \item{time}{factor. Measurement occasion: `Before` or `After`
#'     (levels ordered this way deliberately). Not missing.}
#'   \item{antibody}{numeric. Log antibody performance score; range 3.9-5.0.
#'     Not missing.}
#' }
#' @source W&S Example 12.2. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"blackbird"

#' Phosphorus upstream and downstream of sewage treatment plants
#'
#' Total phosphorus concentration measured upstream and downstream of a sewage
#' treatment plant on each of 10 rivers. Because both measurements come from the
#' same river, this is a **paired** design -- a second worked example
#' contrasting with `blackbird`.
#'
#' @format A data frame with 20 rows and 3 variables:
#' \describe{
#'   \item{river}{numeric. River identifier, 1-10. Each appears twice.
#'     Not missing.}
#'   \item{location}{factor. Sampling location relative to the plant:
#'     `Upstream` or `Downstream` (levels ordered this way deliberately).
#'     Not missing.}
#'   \item{total_p}{numeric. Total phosphorus concentration in mg/L;
#'     range 10.1-14.5. Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"sewage"


# === Comparing more than two means (ANOVA) =================================

#' Circadian rhythm shift under three light treatments
#'
#' Melatonin production shift in 22 people randomly assigned to one of three
#' light treatments. The course's primary worked example for single-factor
#' ANOVA.
#'
#' Treatment levels are ordered `control`, `knee`, `eyes` so that `control` is
#' the reference group in model output, rather than whichever level happens to
#' sort first alphabetically.
#'
#' @format A data frame with 22 rows and 2 variables:
#' \describe{
#'   \item{treatment}{factor. Light exposure treatment: `control` (no light),
#'     `knee` (light applied behind the knee), `eyes` (light applied to the
#'     eyes). Not missing.}
#'   \item{shift}{numeric. Shift in circadian rhythm in hours; negative values
#'     indicate a delay. Range -2.83 to 0.73. Not missing.}
#' }
#' @source W&S Example 15.1. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"circadian"

#' Plant persistence under isolation treatments
#'
#' Number of generations a plant population persisted under each of four
#' habitat-isolation treatments. Used for ANOVA practice.
#'
#' @format A data frame with 16 rows and 2 variables:
#' \describe{
#'   \item{treatment}{factor. Isolation treatment: `1_Continuous`, `2_Medium`,
#'     `3_Long`, `4_Isolated`. Numeric prefixes keep the levels in their natural
#'     order rather than alphabetical. Not missing.}
#'   \item{generations}{numeric. Generations persisted; counts, range 8-16.
#'     Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"plantpersistence"

#' Serotonin levels in locusts
#'
#' Serotonin concentration in locusts measured after 0, 1, or 2 hours of
#' treatment. Used for ANOVA and for practising the distinction between a
#' numeric variable and a grouping factor that happens to be numbered.
#'
#' @format A data frame with 30 rows and 2 variables:
#' \describe{
#'   \item{serotonin_level}{numeric. Serotonin concentration; range 3.2-21.3.
#'     Not missing.}
#'   \item{treatment_time}{factor. Hours of treatment: `0`, `1`, `2`. Stored as
#'     a factor deliberately -- it identifies groups, and treating it as numeric
#'     would fit a regression rather than an ANOVA. Not missing.}
#' }
#' @source W&S Figure 2.1-2. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"locust"


# === Correlation and regression ============================================

#' Wolf inbreeding and reproduction
#'
#' Inbreeding coefficient and number of pups surviving their first winter, for
#' 24 wolf packs. Used to teach correlation.
#'
#' @format A data frame with 24 rows and 2 variables:
#' \describe{
#'   \item{inbreed_coef}{numeric. Inbreeding coefficient; unitless, 0-0.4.
#'     Higher values mean more inbred. Not missing.}
#'   \item{n_pups}{numeric. Number of pups surviving their first winter;
#'     counts, range 1-8. Not missing.}
#' }
#' @source W&S Example 16.2. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"wolf"

#' Experience and impressiveness of a magic trick
#'
#' Years of experience and a rated impressiveness score. Used to teach
#' correlation, and Spearman's rank correlation in particular, since
#' `impressiveness_score` is an ordinal rating rather than a measurement.
#'
#' @format A data frame with 21 rows and 2 variables:
#' \describe{
#'   \item{years}{numeric. Years of experience; range 2-50. Not missing.}
#'   \item{impressiveness_score}{numeric. Rated impressiveness on an ordinal
#'     scale of 1-5. Not missing.}
#' }
#' @source W&S Example 16.5. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"trick"

#' Plant diversity and ecosystem stability
#'
#' Biomass stability measured after 10 years in plots planted with 1, 2, 4, 8,
#' or 16 species. The research hypothesis was that greater species richness
#' leads to greater ecosystem stability. The course's worked example for least-
#' squares regression.
#'
#' Note that `n_species` takes only five distinct values, which makes this a
#' useful case for discussing when a numeric predictor is treated as continuous
#' (regression) versus as a grouping factor (ANOVA).
#'
#' @format A data frame with 161 rows and 2 variables:
#' \describe{
#'   \item{n_species}{numeric. Number of plant species in the plot: 1, 2, 4, 8,
#'     or 16. Not missing.}
#'   \item{biomass_stability}{numeric. Measure of ecosystem stability;
#'     unitless, range 1.34-15.76. Higher means more stable. Not missing.}
#' }
#' @source W&S Example 17.3. Whitlock, M. & Schluter, D. (2018). Datasets for
#'   Whitlock & Schluter's "The Analysis of Biological Data". CC BY-NC-SA 4.0.
"plantbiomass"

#' Bumpus's house sparrows
#'
#' Hermon Bumpus's classic 1898 dataset: measurements of house sparrows
#' collected after a severe winter storm in Providence, Rhode Island, recording
#' which birds survived. One of the earliest datasets used to study natural
#' selection in action.
#'
#' **Three quirks worth knowing before using these data:**
#'
#' 1. `age` is recorded for every male and for **no female** -- the missingness
#'    is completely structural, not random. Any analysis using `age` silently
#'    becomes a males-only analysis.
#' 2. `bumpus_number` is **not a unique identifier**: 136 rows carry only 72
#'    distinct values, and the values are not unique within a sex either. Do not
#'    use it as a key.
#' 3. Measurements mix units: some are in millimetres, others in inches, as
#'    recorded in the original 1898 publication.
#'
#' @format A data frame with 136 rows and 13 variables:
#' \describe{
#'   \item{bumpus_number}{numeric. Bumpus's original specimen number. **Not
#'     unique** -- see note above. Not missing.}
#'   \item{sex}{factor. `f` or `m`. Not missing.}
#'   \item{age}{factor. `a` (adult) or `y` (young). **Missing for all 49
#'     females** -- see note above.}
#'   \item{survival}{logical. `TRUE` if the bird survived the storm.
#'     Not missing.}
#'   \item{total_length_mm}{numeric. Total body length in mm. Not missing.}
#'   \item{alar_extent_mm}{numeric. Wingspan in mm. Not missing.}
#'   \item{weight_g}{numeric. Body mass in grams. Not missing.}
#'   \item{length_beak_and_head_mm}{numeric. Combined beak and head length in
#'     mm. Not missing.}
#'   \item{length_humerus_in}{numeric. Humerus length in inches. Not missing.}
#'   \item{length_femur_in}{numeric. Femur length in inches. Not missing.}
#'   \item{length_tibiotarsus_in}{numeric. Tibiotarsus length in inches.
#'     Not missing.}
#'   \item{skull_width_in}{numeric. Skull width in inches. Not missing.}
#'   \item{keel_length_in}{numeric. Keel (sternum) length in inches.
#'     Not missing.}
#' }
#' @source Bumpus, H.C. (1898). The elimination of the unfit as illustrated by
#'   the introduced sparrow, Passer domesticus. Public domain.
"bumpus"


# === Workflow and teaching-mechanics datasets ==============================

#' Physical measurements of BIOL 202 students
#'
#' Measurements volunteered by students in a past offering of BIOL 202. Used
#' throughout the tutorials as a familiar dataset with both numeric and
#' categorical variables.
#'
#' **A unit correction has been applied.** Five of the 154 students recorded a
#' head circumference of 21-24, which is impossible in centimetres (adult heads
#' are 52-60 cm) and almost certainly means those five measured in inches.
#' `data-raw/make_data.R` multiplies any value below 45 by 2.54. This is an
#' inference rather than a recorded fact about collection; the correction is
#' visible and reversible in the build script.
#'
#' @format A data frame with 154 rows and 6 variables:
#' \describe{
#'   \item{height_cm}{numeric. Height in centimetres; range 150-210.8.
#'     Not missing.}
#'   \item{head_circum_cm}{numeric. Head circumference in centimetres. See the
#'     unit correction noted above. Not missing.}
#'   \item{number_of_siblings}{numeric. Number of siblings; counts, range 0-6.
#'     Not missing.}
#'   \item{dominant_hand}{factor. `Left` or `Right`. Not missing.}
#'   \item{dominant_foot}{factor. `Left` or `Right`. Not missing.}
#'   \item{dominant_eye}{factor. `Left` or `Right`. Not missing.}
#' }
#' @source Volunteered by students in a past offering of BIOL 202, UBC
#'   Okanagan. Anonymized -- no identifying information is recorded.
"students"

#' Physical measurements of 30 BIOL 202 students
#'
#' A 30-student subset of the same survey behind [students], used in
#' assignments where a smaller sample is wanted.
#'
#' In the raw files, handedness was coded `r`/`l` in `students` but
#' `Right`/`Left` here; `data-raw/make_data.R` recodes both to `Right`/`Left`
#' so the two datasets agree.
#'
#' @format A data frame with 30 rows and 6 variables:
#' \describe{
#'   \item{height_cm}{numeric. Height in centimetres; range 155-188.
#'     Not missing.}
#'   \item{head_circum_cm}{numeric. Head circumference in centimetres;
#'     range 53.5-60.2. Not missing.}
#'   \item{number_of_siblings}{numeric. Number of siblings; counts, range 0-6.
#'     Not missing.}
#'   \item{dominant_hand}{factor. `Left` or `Right`. Not missing.}
#'   \item{dominant_foot}{factor. `Left` or `Right`. Not missing.}
#'   \item{dominant_eye}{factor. `Left` or `Right`. Not missing.}
#' }
#' @seealso [students]
#' @source Volunteered by students in a past offering of BIOL 202, UBC
#'   Okanagan. Anonymized -- no identifying information is recorded.
"subset_students"

#' Trout caught at three lakes
#'
#' A deliberately tiny tidy dataset: trout caught per day at each of three
#' Okanagan lakes. Students type these values into a spreadsheet themselves and
#' import the result, which is how the course teaches tidy data structure and
#' reading a local CSV.
#'
#' @format A data frame with 9 rows and 3 variables:
#' \describe{
#'   \item{site}{character. Lake sampled: `Mabel-lake`, `Postill-lake`, or
#'     `Ellison-lake`. Not missing.}
#'   \item{day}{numeric. Day of sampling: 1, 2, or 3. Not missing.}
#'   \item{trout_caught}{numeric. Number of trout caught; counts, range 0-5.
#'     Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"trout"

#' Untidy example data
#'
#' A small, deliberately **untidy** dataset used to teach what tidy data is and
#' how to reshape data into it. The five `rep` columns each hold the same
#' measurement taken on a different replicate, so the data are in wide format:
#' one row holds five observations, violating the tidy rule that each row is one
#' observation.
#'
#' This dataset is intentionally left messy. Tidying it is the exercise.
#'
#' @format A data frame with 21 rows and 7 variables:
#' \describe{
#'   \item{substance}{character. Substance applied: `NaCl`, `Sucrose`, or
#'     `CaCl2`. Not missing.}
#'   \item{conc}{numeric. Concentration applied; range 0-300. Not missing.}
#'   \item{rep1}{numeric. Measured response, replicate 1. Not missing.}
#'   \item{rep2}{numeric. Measured response, replicate 2. Not missing.}
#'   \item{rep3}{numeric. Measured response, replicate 3. Not missing.}
#'   \item{rep4}{numeric. Measured response, replicate 4. Not missing.}
#'   \item{rep5}{numeric. Measured response, replicate 5. Not missing.}
#' }
#' @source Course teaching dataset, BIOL 202, UBC Okanagan.
"example_data"
