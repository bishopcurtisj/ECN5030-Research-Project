clear all
cls
use "..\..\..\Data\stata-files\nhl_draft.dta"

reg position_code rv i.round drv d if rv<=14 & rv>=-14 & year<=2010,r

reg age rv drv i.round i.position_code d if rv<=14 & rv>=-14 & year<=2010,r

reg years_played rv i.round drv i.position_code d if rv<=14 & rv>=-14 & year<=2010,r

reg games_played rv i.round drv i.position_code d if rv<=14 & rv>=-14 & year<=2010,r

reg age_of_retirement rv drv i.round i.position_code d if rv<=14 & rv>=-14 & year<=2010,r


rdbwselect years_played rv, kernel(uniform)
rdbwselect years_played rv, kernel(uniform)
rdbwselect years_played rv, kernel(uniform)

cls
reg years_played rv i.round drv i.position_code d if rv<=2.78 & rv>=-2.78 & year<=2010,r

reg games_played rv i.round drv i.position_code d if rv<=2.78 & rv>=-2.78 & year<=2010,r

reg age_of_retirement rv drv i.round i.position_code d if rv<=2.78 & rv>=-2.78 & year<=2010,r




preserve
drop if year>2010

drop if position=="G"

xi: xtpoisson years_played   rv drv i.year  d if year<=2000 ,fe vce(robust)
xi: xtpoisson games_played  rv drv i.year  d if year<=2000 & position!="G",fe vce(robust)
xi: xtpoisson years_played   rv drv i.year  d if year>=2010 & position!="G",fe vce(robust)


restore
