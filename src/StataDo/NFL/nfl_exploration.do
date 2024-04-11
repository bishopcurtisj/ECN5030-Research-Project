clear all
use "..\..\..\Data\stata-files\nfl_draft.dta"


preserve

collapse (mean) scaled_years scaled_age_of_retirement scaled_games_played, by(dist_round)
twoway (scatter scaled_years dist_round, mc(yellow)) (scatter scaled_age_of_retirement dist_round, mc(blue)) (scatter scaled_games_played dist_round, mc(red)), xline(0)

restore





preserve

collapse (mean) seasonsPlayed, by(dist_round)
scatter (seasonsPlayed dist_round)

restore

preserve
collapse (median) seasonsPlayed, by(pick)
line(games pick)

restore

preserve
collapse (mean) seasonsPlayed, by(overall_pick)
scatter (seasonsPlayed overall_pick)
restore

preserve

keep if round==2 | round == 3
drop if round==2 & D==1
drop if round==3 & D==0

collapse (mean) games, by(dist_round)
line(games dist_round)

restore
