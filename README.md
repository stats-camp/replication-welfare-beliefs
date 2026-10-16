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

The whole script runs in stats.camp. On 2026-10-15 it was executed in Stata
19.5 and in the native engine on scratch copies, and all 581 result rows
(summaries, `ttesti`, `codebook` counts, the robust OLS regressions, `suest`
with the two cross-equation `test` lines, every `lincom`, and the `esttab`
cells of Tables A2–A4) are equal at the displayed precision. `snapshot erase`,
`version 18`, `cap`, `est sto` with reused names, value-labelled treatment
dummies in `if` conditions and regressions, and the `esttab` layout options
(`compress`, `b()`/`se()` formats, `varwidth()`, `modelwidth()`, `nonotes`,
`addnotes()`, `label`, `mtitles()`, `title()`, empty `drop()`/`order()`) all
work.

Remaining differences are presentational:

- `esttab` places a coefficient that first appears in a later model after
  `Constant` (Tables A2 and A3); estout keeps the constant last.
- `codebook` prints its own layout rather than Stata's `Type:`/`Range:`/
  `Unique values:`/`Mean:`/`Percentiles:` block.
- `ttesti` prints a `Group |` header and six-digit standard errors.
- Figures 1 and 2 (`twoway lfit`) are identical to Stata's since
  2026-10-15: a lone `lfit` shows no legend, and the Control/Corrected legend
  stays inside at `position(2) ring(0)`. See `aea_replication/figure_comparison.html` in the main repository.

[TODO.md](TODO.md) tracks these items.

## Changes from the original package

- Line 17: the `use` statement's `/-- ADD PATH --/` placeholder (which the
  original README asks each replicator to fill in) was replaced with the
  repository-relative path to the `.dta` file, and the line was uncommented.
- Stata abbreviations were spelled out (`gl` → `global`, `reg …, r` →
  `reg …, robust`) in an earlier revision; both forms are accepted now, and the
  spelled-out form is kept. Semantics are identical.
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
