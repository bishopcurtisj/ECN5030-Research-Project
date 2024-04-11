clear all
import delimited "..\..\..\Data\stata-files\nhl_draft_boot.csv"

save "..\..\Data\stata-files\nhl_boot.dta", replace

preserve

collapse 