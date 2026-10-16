# Validation status and remaining items

Validated 2026-10-15 against Stata 19.5 (unchanged script apart from the path
and abbreviation adaptations listed in the README): 581 of 581 result rows
equal. The items below are display differences, not numerical ones.

- [ ] **`esttab` row order.** Keep `_cons` last when a later model adds a
  coefficient (Tables A2 and A3 print `Constant` before `Confidence in UI
  Belief` / `Misbelief (UI Belief - 18)`).
- [ ] **`codebook` layout.** Print Stata's block (`Type:`, `Range:`/`Units:`,
  `Unique values:`/`Missing .:`, `Mean:`, `Std. dev.:`, percentile row).
- [ ] `ttesti`: blank header instead of `Group |`; seven significant digits.
- [x] Figures: a single `lfit` shows no legend and `legend(ring(0)
  position(2))` is honoured (2026-10-15). Renderings are compared in
  `aea_replication/figure_comparison.html` in the main repository.
- [ ] Verify the browser build separately.
