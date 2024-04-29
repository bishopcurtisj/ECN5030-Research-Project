clear all
import delimited "..\..\..\Data\stata-files\nhl_draft.csv"


rename distround rv

gen gpg=goals/games_played
gen ppg=(points)/games_played
gen d=rv>0
gen drv=d*rv
egen team_id=group(team)
drop if round==1 & d==1


save "..\..\..\Data\stata-files\nhl_draft.dta", replace
