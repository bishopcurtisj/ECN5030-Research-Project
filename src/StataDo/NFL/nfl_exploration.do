clear all
use "..\..\..\Data\stata-files\nfl_draft.dta"
cls

preserve

collapse (mean) scaled_years scaled_age_of_retirement scaled_games_played, by(rv)
twoway (scatter scaled_years rv, mc(yellow)) (scatter scaled_age_of_retirement rv, mc(blue)) (scatter scaled_games_played rv, mc(red)), xline(0)

restore

preserve

drop if season > 2013
drop if rv>16 | rv<-16
collapse (mean) scaled_years d, by(rv)
twoway (scatter scaled_years rv if d==1, mc(red)) (scatter scaled_years rv if d==0, mc(blue)) (lfit scaled_years rv if d==1, lc(red)) (lfit scaled_years rv if d==0, lc(blue))

restore

preserve

drop if season > 2013
drop if rv>16 | rv<-16
collapse (mean) seasons_started d, by(rv)
twoway (scatter seasons_started rv if d==1, mc(red)) (scatter seasons_started rv if d==0, mc(blue)) (lfit seasons_started rv if d==1, lc(red)) (lfit seasons_started rv if d==0, lc(blue))

restore




preserve

drop if season > 2013
drop if rv>16 | rv<-16
collapse (mean) scaled_seasons_started d, by(rv)
twoway (scatter scaled_seasons_started rv if d==1, mc(red)) (scatter scaled_seasons_started rv if d==0, mc(blue)) (lfit scaled_seasons_started rv if d==1, lc(red)) (lfit scaled_seasons_started rv if d==0, lc(blue))

restore

preserve

drop if season > 2013
drop if rv>16 | rv<-16
collapse (mean) position_code d, by(rv)
twoway (scatter position_code rv if d==1, mc(red)) (scatter position_code rv if d==0, mc(blue)) (lfit position_code rv if d==1, lc(red)) (lfit position_code rv if d==0, lc(blue))

restore

preserve

drop if season > 2013
drop if rv>16 | rv<-16
collapse (mean) age d, by(rv)
twoway (scatter age rv if d==1, mc(red)) (scatter age rv if d==0, mc(blue)) (lfit age rv if d==1, lc(red)) (lfit age rv if d==0, lc(blue))

restore
