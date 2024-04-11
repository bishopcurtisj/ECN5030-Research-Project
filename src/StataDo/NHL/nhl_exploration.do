clear all
use "..\..\..\Data\stata-files\nhl_draft.dta"

preserve 
collapse (mean) scaled_years, by(D dist_round)
scatter scaled_years D

restore


preserve
keep if year <=2010
collapse (mean) scaled_years scaled_age_of_retirement scaled_games_played, by(dist_round)
twoway (scatter scaled_years dist_round, mc(yellow)) (scatter scaled_age_of_retirement dist_round, mc(blue)) (scatter scaled_games_played dist_round, mc(red)), xline(0)

restore

preserve
drop if year>2010

drop if position=="G"


reg years_played rv drv d

collapse (mean) years_played gpg ppg, by(rv)

twoway (scatter years_played rv if rv<13&rv>=-14)(lfit years_played rv if rv>=-14&rv<=0) (lfit years_played rv if rv>0&rv<13)

restore

preserve

drop if year>2010
keep if rv>= -8 & rv<=8
collapse scaled_years, by(rv)

twoway (scatter scaled_years rv)(lfit scaled_years rv if rv<=0)(lfit scaled_years rv if rv>0)

restore

preserve

drop if year>2010
collapse scaled_years, by(rv)

twoway (scatter scaled_years rv)(lfit scaled_years rv if rv<=0)(lfit scaled_years rv if rv>0)

restore

preserve
keep if year<=2010
keep if (position != "G") & (position!= "D")
collapse (mean) goals, by(dist_round)
scatter goals dist_round, xline(0)

restore


preserve

drop if year>=2010 | year<=1998
collapse (mean) scaled_years, by(dist_round)
scatter scaled_years dist_round, xline(0) 

restore

preserve

collapse (mean) scaled_years, by(pick)
scatter scaled_years pick, xline(0) 

restore

preserve

collapse (mean) pos_years, by(dist_round)
scatter pos_years dist_round, xline(0)

restore



preserve

collapse (median) years_played, by(dist_round)
scatter years_played dist_round, xline(0)

restore

preserve

collapse (mean) age_of_retirement, by(dist_round)
scatter age_of_retirement dist_round, xline(0)

restore
preserve

collapse (median) age_of_retirement, by(dist_round)
scatter age_of_retirement dist_round, xline(0)

restore

preserve
collapse (median) years_played, by(pick)
line(years_played pick)

restore

preserve
collapse (mean) years_played, by(overall_pick)
scatter (years_played overall_pick)
restore

preserve

keep if round==2 | round == 3
drop if round==2 & D==1
drop if round==3 & D==0

collapse (mean) games_played, by(dist_round)
line (games_played dist_round), xline(0)

restore