clear all
use "..\..\..\Data\stata-files\nhl_draft.dta"

reg age_of_retirement dist_round i.round DxDist_Round i.position_code D

reg years_played dist_round i.round DxDist_Round i.position_code D

reg games_played dist_round i.round DxDist_Round i.position_code D

reg scaled_games_played dist_round DxDist_Round D

predict ypred

preserve
drop if year>2010

drop if position=="G"

xi: xtpoisson years_played   rv drv i.year  d if year<=2000 ,fe vce(robust)
xi: xtpoisson games_played  rv drv i.year  d if year<=2000 & position!="G",fe vce(robust)
xi: xtpoisson years_played   rv drv i.year  d if year>=2010 & position!="G",fe vce(robust)


restore