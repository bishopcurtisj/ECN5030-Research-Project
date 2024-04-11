clear all
import delimited "..\..\..\Data\stata-files\nfl_draft.csv"



rename distround dist_round
gen rv=dist_round
gen d=rv>=0
gen drv=d*rv
egen team_id=group(team)


drop if round==1 & d==1


save "..\..\..\Data\stata-files\nfl_draft.dta", replace

