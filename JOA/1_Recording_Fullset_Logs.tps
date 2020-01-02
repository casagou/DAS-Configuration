Option Explicit

'* <script.tps>
'******************************************************************************
'*  AUTHOR: <Joachim Agou>
'*
'*  DESCRIPTION:
'*  <Eecords transiemt logs continously.>
'*
'*  DATE: 12/24/2019 3:05:59 PM
'*
'*  MODIFICATIONS:
'*    DATE         WHO  VERSION   DESCRIPTION
'*    ----------   ---  --------  --------------------------------------------------
'*    20191228     JOA  1.0       Initial version
'******************************************************************************



'******************************************************************************
'************************* LOCAL VARIABLE DECLARATIONS ************************
'******************************************************************************

dim Cycle, Hours, boo1



'******************************************************************************
'******************************** PREREQUISITES *******************************
'******************************************************************************

note "*** RECORDING FULLSET & LOGS ***"
note" "



instruction "Read the instructions below:",SKIP
	If skipGV = True Then
	result "Instructions skipped!", REPORT, RED
	End If

note" Ensure the proper logs are defined in the Test Procedure."

prompt_boo "Did you understand the instructions?",boo1
	If boo1 = false Then
	result "Demonstration Canceled!", REPORT , RED
	quit
	End If



'******************************************************************************
'************************************ DEMO ************************************
'******************************************************************************



note "*** CONTINUOUS LOG RECORDING ***"

Cycle = 1
While Cycle<=1440

delay 1

result "Cycle #" & Cycle, REPORT, GREEN

start_log "Demo_Report"
start_log "Demo_Report"
start_log "Demo_Report"
start_log "Demo_Report"

do_fullset 30, "Endurance", "Endurance"

delay 55

stop_log "Demo_Report"
stop_log "Demo_Report"
stop_log "Demo_Report"
stop_log "Demo_Report"

delay 5

result "1 minute cycle completed", REPORT, BLUE

beep 1

Cycle = Cycle + 1

Wend

result "Endurance testing completed", REPORT, RED

beep 5

