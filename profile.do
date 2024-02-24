capture log close, all
*To close all other named logs.

cd "D:\EPM102\Data Sets\EPM102 datasets-20231022\EPM102 datasets and help files"
*The above is the directory that I always want to pull files from whenever typing "use [X database file in directory]"

macro drop _all

*******Sets up the log for the timestamp output upon file save;
local a1 = substr("`c(current_time)'",1,2)
local a2 = substr("`c(current_time)'",4,2)
local a3 = substr("`c(current_time)'",7,2)
local b =         "`c(current_date)'"

global ldirectory "D:\Stata Logs\\"

*The above is the directory where all generated logs are to be saved.

noisily display "Please enter log name:" _request(logname)

if "$logname" == "" {

global logname = "Practical Log"

}

capture mkdir "D:\Stata Logs\\"

capture log close, all

log using "$ldirectory$logname-(`b')`a1'_`a2'_`a3'.log", append

noisily display "Log File saved in folder: $ldirectory"

*The below commands I produced from scratch, despite numerous forums claiming that it was impossible to automate the process of generating and saving a do-file to a name upon opening a new instance of Stata. :D

doedit

*******Sets up the log for the timestamp output;
local a1 = substr("`c(current_time)'",1,2)
local a2 = substr("`c(current_time)'",4,2)
local a3 = substr("`c(current_time)'",7,2)
local b =         "`c(current_date)'"

global dfdirectory "D:\Stata Do-Files\\"

noisily display "Please enter do-file name:" _request(dofilename)

if "$dofilename" == "" {

global dofilename = "Practical Do-File"

}

capture mkdir "D:\Stata Do-Files\\"

doedit "$dfdirectory$dofilename-(`b')`a1'_`a2'_`a3'.do"

noisily display "Do-File opened and then saved to folder: $dfdirectory"

noisily display "Eevs started this session at `c(current_time)' `c(current_date)'"