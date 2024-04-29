clear all
cls
use "..\..\..\Data\stata-files\nhl_draft.dta"


preserve
keep if year<=2010
keep if rv<=8 & rv>=-8

collapse (mean) scaled_years d, by(rv)

twoway (scatter scaled_years rv if d==0, mc(red)) (scatter scaled_years rv if d==1, mc(blue)) (lfit scaled_years rv if d==0, lc(red)) (lfit scaled_years rv if d==1, lc(blue))

restore

preserve
keep if year<=2010
keep if rv<=8 & rv>=-8

collapse (mean) position_code d, by(rv)

twoway (scatter position_code rv if d==0, mc(red)) (scatter position_code rv if d==1, mc(blue)) (lfit position_code rv if d==0, lc(red)) (lfit position_code rv if d==1, lc(blue))

restore

preserve
keep if year<=2010
keep if rv<=8 & rv>=-8
drop if age==0

collapse (mean) age d, by(rv)

twoway (scatter age rv if d==0, mc(red)) (scatter age rv if d==1, mc(blue)) (lfit age rv if d==0, lc(red)) (lfit age rv if d==1, lc(blue))

restore


preserve
keep if year <=2010
collapse (mean) scaled_years scaled_age_of_retirement scaled_games_played, by(rv)
twoway (scatter scaled_years rv, mc(yellow)) (scatter scaled_age_of_retirement rv, mc(blue)) (scatter scaled_games_played rv, mc(red)), xline(0)

restore



preserve

drop if year>2010
keep if rv>= -8 & rv<=8
collapse scaled_years, by(rv)

twoway (scatter scaled_years rv)(lfit scaled_years rv if rv<=0)(lfit scaled_years rv if rv>0)

restore




