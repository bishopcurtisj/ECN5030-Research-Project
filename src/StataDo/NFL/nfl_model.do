clear all
cls
use "..\..\..\Data\stata-files\nfl_draft.dta"

matrix betas = J(4,2,.)
matrix rownames betas = seasons_played age_of_retirement games_played seasons_started

reg seasonsplayed rv i.round drv i.position_code d if rv<=16 & rv>=-16 & season<=2013,r
mat betas[1,1] = _b[d]
reg age_of_retirement rv i.round drv i.position_code d if rv<=16 & rv>=-16 & season<=2013,r
mat betas[2,1] = _b[d]

reg games rv i.round drv i.position_code d if rv<=16 & rv>=-16 & season<=2013,r
mat betas[3,1] = _b[d]

reg seasons_started rv i.round drv i.position_code d if rv<=16 & rv>=-16 & season<=2013, r
mat betas[4,1] = _b[d]


/*
rdbwselect seasonsplayed rv, kernel(uniform)
rdbwselect age_of_retirement rv, kernel(uniform)
rdbwselect games rv, kernel(uniform)
rdbwselect seasons_started rv, kernel(uniform)*/






cls
reg seasonsplayed rv i.round drv i.position_code d if rv<=3.2 & rv>=-3.2 & season<=2013,r
mat betas[1,2] = _b[d]
reg age_of_retirement rv i.round drv i.position_code d if rv<=3.2 & rv>=-3.2 & season<=2013,r
mat betas[2,2] = _b[d]

reg games rv i.round drv i.position_code d if rv<=3.2 & rv>=-3.2 & season<=2013,r
mat betas[3,2] = _b[d]

reg seasons_started rv i.round drv i.position_code d if rv<=3.2 & rv>=-3.2 & season<=2013, r
mat betas[4,2] = _b[d]

matrix list betas