* Can Incorrect Beliefs about the Racial Composition of Welfare and Unemployment Insurance Beneficiaries be Changed?
* Carpenter et al. (2025)
* Papers & Proceedings Analysis
* 2/5/25



cap log close
clear all
snapshot erase _all
set more off
version 18


* Load merged experimental data from stages 1 through 3.

use "Carpenter_et_al_2025_Papers_and_Proceedings.dta"

global controls "age female four_year inc_over_75k south"

global w_moderators "w_confidence white iat_binary explicit_binary"

global u_moderators "u_confidence white iat_binary explicit_binary"



* Experimental design

** Return rates for stages 2 and 3.
sum participate_stage_2 participate_stage_3


** Selection on observables for stages 2 and 3.
*** Stage 2 versus stage 1.
sum age female four_year advanced_deg inc_over_75k white
sum age female four_year advanced_deg inc_over_75k white if participate_stage_2 == 1
ttesti 3025 42.65 15.10 2834 42.95 15
ttesti 3029 0.511 0.5 2834 0.512 0.5
ttesti 3029 0.421 0.494 2834 0.422 0.494
ttesti 3029 0.158 0.365 2834 0.159 0.366
ttesti 3029 0.422 0.494 2834 0.420 0.494
ttesti 3029 0.717 0.450 2834 0.717 0.450

*** Stage 3 versus stage 2.
sum age female four_year advanced_deg inc_over_75k white if participate_stage_2 == 1
sum age female four_year advanced_deg inc_over_75k white if participate_stage_3 == 1
ttesti 2834 42.95 15.00 2314 44.32 15.01
ttesti 2834 0.512 0.5 2314 0.516 0.5
ttesti 2834 0.422 0.494 2314 0.415 0.493
ttesti 2834 0.159 0.366 2314 0.162 0.369
ttesti 2834 0.420 0.494 2314 0.419 0.493
ttesti 2834 0.719 0.450 2314 0.740 0.439


** Time spent on each stage.
codebook duration_stage_1
codebook durationinseconds
codebook duration_stage_3



* Results

** Table A1: Treatment balance on observables.
sum age female white black four_year advanced_deg inc_over_75k  if treatment == 1
sum age female white black four_year advanced_deg inc_over_75k  if treatment == 2
sum age female white black four_year advanced_deg inc_over_75k  if treatment == 3
sum age female white black four_year advanced_deg inc_over_75k  if treatment == 4

reg w_corrected age female white black four_year advanced_deg inc_over_75k, robust

reg u_corrected age female white black four_year advanced_deg inc_over_75k, robust


** Belief summary statistics.
sum w_belief w_confidence
tab w_belief
ttest w_belief == 29

sum u_belief u_confidence
tab u_belief
ttest u_belief == 18


** Table A2: Determinants of participant beliefs and misbeliefs.
reg w_belief w_corrected, robust
reg u_belief u_corrected, robust

reg w_belief $controls $w_moderators, robust
est sto W1

reg w_belief_abs_diff $controls $w_moderators, robust
est sto W2

reg u_belief $controls $u_moderators, robust
est sto U1

reg u_belief_abs_diff $controls $u_moderators, robust
est sto U2

esttab W1 W2 U1 U2, compress b(%10.3fc) se(%10.3fc) varwidth(40) nonotes addnotes("Dependent variable is welfare (TANF) or unemployment (UI) belief." "OLS with robust standard errors reported." "* p<0.10, ** p<0.05, *** p<0.01.") label replace star(* 0.10 ** 0.05 *** 0.01) /*
	*/ drop() mtitles("Welfare" "Welfare" "Unemployment" "Unemployment") title("Determinants of participant beliefs.") /*
	*/ order()


** Policy support summary statistics.
codebook w_support
codebook u_support
	
		
** Figure 1: The relationship between baseline racial misbeliefs and program support.
twoway (lfit w_support w_belief_minus_29 if w_corrected == 0), xline(0) ytitle("Support for Welfare (TANF)") ylabel(0(10)50) xlabel(-30(20)70) graphregion(fcolor(white))

twoway (lfit u_support u_belief_minus_18 if u_corrected == 0), xline(0) ytitle("Support for Unemployment (UI)") ylabel(0(10)50) xlabel(-20(20)80) graphregion(fcolor(white))
	
	

** Table A3: Prior beliefs and policy support.
reg w_support w_belief_minus_29 if w_corrected == 0, robust
est sto W1

reg w_support w_belief_minus_29 $controls if w_corrected == 0, robust
est sto W2

reg u_support u_belief_minus_18 if u_corrected == 0, robust
est sto U1

reg u_support u_belief_minus_18 $controls if u_corrected == 0, robust
est sto U2

esttab W1 W2 U1 U2, compress b(%10.3fc) se(%10.3fc) varwidth(40) nonotes addnotes("Dependent variable is TANF or UI support." "Controls include age, sex, education, income and geographic region." "OLS with robust standard errors reported." "* p<0.10, ** p<0.05, *** p<0.01.") label replace star(* 0.10 ** 0.05 *** 0.01) /*
	*/ drop(age female four_year inc_over_75k south) mtitles("TANF" "TANF+" "UI" "UI+") title("Policy support treatment effects.") /*
	*/ order()

*** Testing if the correlations differ by policy.
reg w_support misbelief if w_corrected == 0
est sto W1
reg u_support misbelief if u_corrected == 0
est sto U1

suest W1 U1, vce(robust)
test [W1_mean]_cons  - [U1_mean]_cons  = 0
test [W1_mean]misbelief  - [U1_mean]misbelief = 0


** Figure 2: The persistence of misbelief correction one month following the information intervention.
twoway (lfit w_belief_S3_minus_29 w_belief_minus_29 if w_corrected == 0) (lfit w_belief_S3_minus_29 w_belief_minus_29 if w_corrected == 1), xline(0) ytitle("Stage 3 Misbelief (Welfare Belief - 29)") ylabel(-30(20)70) xlabel(-30(20)70) legend(on order(1 "Control" 2 "Corrected" ) ring(0) position(2)) graphregion(fcolor(white))

twoway (lfit u_belief_S3_minus_18 u_belief_minus_18 if u_corrected == 0) (lfit u_belief_S3_minus_18 u_belief_minus_18 if u_corrected == 1), xline(0) ytitle("Stage 3 Misbelief (UI Belief - 18)") ylabel(-20(20)80) xlabel(-20(20)80) legend(on order(1 "Control" 2 "Corrected" ) ring(0) position(2)) graphregion(fcolor(white))

	
** Table A4: Misbelief correction and persistence. 	
reg w_belief_S3_minus_29 w_corrected w_belief_minus_29 w_corrected_belief_minus_29, robust
lincom	w_belief_minus_29 - 1
lincom	w_belief_minus_29 + w_corrected_belief_minus_29
est sto WM1	

reg w_belief_S3_minus_29 w_corrected w_belief_minus_29 w_corrected_belief_minus_29 $controls, robust
lincom	w_belief_minus_29 - 1
lincom	w_belief_minus_29 + w_corrected_belief_minus_29	
est sto WM2	 

reg u_belief_S3_minus_18 u_corrected u_belief_minus_18 u_corrected_belief_minus_18, robust
lincom	u_belief_minus_18 - 1
lincom	u_belief_minus_18 + u_corrected_belief_minus_18
est sto UM1	

reg u_belief_S3_minus_18 u_corrected u_belief_minus_18 u_corrected_belief_minus_18 $controls, robust
lincom	u_belief_minus_18 - 1
lincom	u_belief_minus_18 + u_corrected_belief_minus_18	
est sto UM2	

esttab WM1 WM2 UM1 UM2, compress b(%10.3fc) se(%10.3fc) varwidth(45) modelwidth(7) nonotes addnotes("Dependent variable is Stage 3 misbelief. OLS with robust standard errors" "reported. Controls include age, sex, education, income and geographic region." "* p<0.10, ** p<0.05, *** p<0.01.") label replace star(* 0.10 ** 0.05 *** 0.01) /*
	*/ drop($controls) mtitles("None" "Controls" "None" "Controls") title("Misbelief correction and persistence.") /*
	*/ order()		
	
	
	
	
	

