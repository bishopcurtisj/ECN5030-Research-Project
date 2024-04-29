clear all
import delimited "..\..\..\Data\stata-files\nfl_draft.csv"



rename distround rv
gen d=rv>0
egen team_id=group(team)
gen drv = d*rv

drop if round==1 & d==1


save "..\..\..\Data\stata-files\nfl_draft.dta", replace

