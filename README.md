# Replication: Can Incorrect Beliefs about the Racial Composition of Welfare and Unemployment Insurance Beneficiaries be Changed?

Jeffrey Carpenter, Jakina Debnam Guzman, Peter Hans Matthews, and Erin L.
Wolcott — AEA Papers and Proceedings (2025).

This repository is an adaptation of the paper's official replication package
for [stats.camp](https://stats.camp), so the analysis can be run directly in
the browser — no Stata installation required.

**Open in stats.camp:**
[Carpenter_et_al_2025_Papers_and_Proceedings.do](https://stats.camp/app?open=https%3A%2F%2Fgithub.com%2Fstats-camp%2Freplication-welfare-beliefs.git&file=Carpenter_et_al_2025_Papers_and_Proceedings.do)

## The experiment

A three-stage experiment with U.S. adults (3,029 participants in Stage 1) run
on the Connect platform in 2024. Participants reported beliefs about the racial
composition of welfare (TANF) and unemployment insurance (UI) beneficiaries; a
random subset then received correct information. The paper measures whether the
information corrects misbeliefs, whether the correction persists a month later,
and how misbeliefs relate to policy support.

## Contents

| Path | Description |
| --- | --- |
| `Carpenter_et_al_2025_Papers_and_Proceedings.do` | Full analysis (tables and figures) |
| `Carpenter_et_al_2025_Papers_and_Proceedings.dta` | Merged experimental data, stages 1–3 |
| `Carpenter_et_al_2025_Papers_and_Proceedings_Experimental_instructions_appendix.pdf` | Experimental screenshots and instructions |
| `README.pdf` | The authors' original package README |

## What runs

The dataset loads with its labels, and the descriptive core of the paper runs:
summary statistics, `ttest`/`ttesti`, `codebook`, `tab`, and the robust OLS
regressions of Table A2 (`reg … $controls $w_moderators, robust` plus
`est sto`). Cells that use features stats.camp has not implemented yet error
visibly without stopping the rest of the file — they are left in place as
implementation targets:

- `snapshot`, `suest` (and the two cross-equation `test` lines after it),
  `version`, `cap`, `set more off`.
- Regressions and `if` conditions involving the value-labeled treatment
  dummies (`treatment`, `w_corrected`, `u_corrected`, `misbelief`): the
  engine currently decodes value-labeled variables as strings, so numeric
  comparisons and regressions on them fail.
- `esttab` layout options (`compress`, `varwidth`, `addnotes`, …) and the
  `twoway lfit` figure options (`xline`, `graphregion`, …).
- `est sto` re-using an existing name (Stata silently replaces; the engine
  errors).

## Changes from the original package

- Line 17: the `use` statement's `/-- ADD PATH --/` placeholder (which the
  original README asks each replicator to fill in) was replaced with the
  repository-relative path to the `.dta` file, and the line was uncommented.
- Stata abbreviations were spelled out (`gl` → `global`, `reg …, r` →
  `reg …, robust`) because stats.camp does not resolve these abbreviations
  yet. Semantics are identical.
- No other changes.

## Source and attribution

Carpenter, Jeffrey, Jakina Debnam Guzman, Peter Hans Matthews, and Erin
Wolcott. 2025. "Data and Code for: Can Incorrect Beliefs about the Racial
Composition of Welfare and Unemployment Insurance Beneficiaries be Changed."
American Economic Association [publisher], Inter-university Consortium for
Political and Social Research [distributor].
[https://doi.org/10.3886/E219150V1](https://doi.org/10.3886/E219150V1)

The data were collected by the authors; all data and code are © the original
authors and are redistributed here, with the one-line adaptation described
above, from the AEA Data and Code Repository deposit. Please cite the paper
and the replication package if you use these materials.
