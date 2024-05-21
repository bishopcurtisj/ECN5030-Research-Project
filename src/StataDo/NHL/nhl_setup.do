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

// seasonal combined data
clear all
import delimited "..\..\..\Data\stata-files\combined.csv"


rename distround rv
rename playerid playerID

gen d=rv>0
gen drv=d*rv
egen team_id=group(team)
drop if round==1 & d==1


save "..\..\..\Data\stata-files\combined.dta", replace

/*
// Convert combined skater data to dta
clear all 
import delimited "..\..\..\Data\stata-files\skaters_cmb.csv"

rename distround rv


gen d=rv>0
gen drv=d*rv
egen team_id=group(team)


drop if round==1 & d==1


save "..\..\..\Data\stata-files\skaters_cmb.dta", replace

// Convert combined goalie data to dta

clear all 

import delimited "..\..\..\Data\stata-files\goalies_cmb.csv"


rename distround rv


gen d=rv>0
gen drv=d*rv
egen team_id=group(team)
drop if round==1 & d==1


save "..\..\..\Data\stata-files\goalies_cmb.dta", replace */