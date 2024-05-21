clear all
cls
use ../../../Data/stata-files/combined.dta

xtset playerID season

preserve

collapse (mean) rv scaled_seasons_over_24 d , by(playerID)

keep if rv<=8 & rv>=-8

collapse (mean) scaled_seasons_over_24 d, by(rv)

twoway (scatter scaled_seasons_over_24 rv if d==0, mc(red)) (scatter scaled_seasons_over_24 rv if d==1, mc(blue)) (lfit scaled_seasons_over_24 rv if d==0, lc(red)) (lfit scaled_seasons_over_24 rv if d==1, lc(blue))

restore

preserve

collapse (mean) rv scaled_games_over_24 d , by(playerID)

keep if rv<=8 & rv>=-8

collapse (mean) scaled_games_over_24 d, by(rv)

twoway (scatter scaled_games_over_24 rv if d==0, mc(red)) (scatter scaled_games_over_24 rv if d==1, mc(blue)) (lfit scaled_games_over_24 rv if d==0, lc(red)) (lfit scaled_games_over_24 rv if d==1, lc(blue))

restore

preserve

collapse (mean) rv games_over_24 d , by(playerID)

keep if rv<=8 & rv>=-8

collapse (mean) games_over_24 d, by(rv)

twoway (scatter games_over_24 rv if d==0, mc(red)) (scatter games_over_24 rv if d==1, mc(blue)) (lfit games_over_24 rv if d==0, lc(red)) (lfit games_over_24 rv if d==1, lc(blue))

restore


preserve

collapse (mean) rv seasons_over_24 d , by(playerID)

keep if rv<=8 & rv>=-8

collapse (mean) seasons_over_24 d, by(rv)

twoway (scatter seasons_over_24 rv if d==0, mc(red)) (scatter seasons_over_24 rv if d==1, mc(blue)) (lfit seasons_over_24 rv if d==0, lc(red)) (lfit seasons_over_24 rv if d==1, lc(blue))

restore 

preserve

collapse (mean) rv games_over_24 d drv round draft_year, by(playerID)
reg games_over_24 rv i.round drv d if rv<=14 & rv>=-14 & draft_year<=2010,r

restore

preserve

collapse (mean) rv seasons_over_24 d drv round draft_year, by(playerID)
reg seasons_over_24 rv i.round drv d if rv<=14 & rv>=-14 & draft_year<=2010,r

restore