# Licensing of this package

This package is dual-licensed, because it contains two different kinds of thing.

## Code — MIT

All R code (files in `R/`, `data-raw/`, and `tests/`) is licensed MIT. See
`LICENSE.md`.

## Content and data — CC BY-NC-SA 4.0

All course content — the tutorial vignettes, the dataset documentation, and the
bundled datasets themselves — is licensed
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/).

You are free to share and adapt this material for non-commercial purposes,
provided you give attribution and license your adaptations under the same terms.

## Third-party data included in this package

### Whitlock & Schluter datasets

Many bundled datasets accompany:

> Whitlock, M. C. & Schluter, D. *The Analysis of Biological Data.*
> W. H. Freeman / Macmillan Learning.

The authors published these datasets under **CC BY-NC-SA 4.0**:

> Whitlock, M.; Schluter, D. (2018). *Datasets for Whitlock & Schluter's "The
> Analysis of Biological Data".* <https://qubeshub.org/publications/351/1>

They are redistributed here under that same licence, which is why this
package's content licence is also CC BY-NC-SA 4.0 — the ShareAlike term
requires it. Each affected dataset names its source in its help page (see
`R/data.R`, `@source`).

**Important caveat on these data.** The authors state that most values were
digitized from graphs and tables in the original publications and "may not be
exact." They are therefore *teaching reconstructions*, not primary
measurements, and should not be used for research. Anyone needing the original
data should contact the authors of the original studies.

### Bumpus house sparrow data

`bumpus` derives from Bumpus, H. C. (1898), and is in the public domain.

### Course-authored data

Datasets marked "Course teaching dataset" or "Fictitious data" in their help
pages were authored for BIOL 202 and are licensed CC BY-NC-SA 4.0 with the rest
of the content.

### Student-volunteered data

`students` and `subset_students` contain measurements volunteered by students
in past offerings of BIOL 202. They are anonymized and contain no identifying
information.

## A note on the previous repository

The predecessor repository (`github.com/ubco-biology/BIOL202`) carried no
licence file, which by default means all rights reserved and left its reuse
status unclear. This package settles that.
