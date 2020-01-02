Option Explicit

'* <script.tps>
'******************************************************************************
'*  AUTHOR: Joachim Agou
'*
'*  DESCRIPTION:
'*  records transiemt logs continously
'*
'*  DATE: 07/06/2019 10:05:05 AM
'*
'*  MODIFICATIONS:
'*    DATE         WHO  NCR    DESCRIPTION
'*    ----------   ---  -----  --------------------------------------------------
'*
'******************************************************************************


' *********************************************************************
' ******************** LOCAL VARIABLE DECLARATIONS ********************
' *********************************************************************
dim Cycle

' *********************************************************************
' ******************** DEMO ********************
' *********************************************************************

note "*** CONTINUOUS LOG RECORDING ***"

Cycle = 1
While Cycle<=100

delay 1

result "Cycle #" & Cycle, REPORT & "Log increment testing", GREEN

start_log "Demo_Log_10Hz"

delay 120

stop_log "Demo_Log_10Hz"

result "5 minutes log completed", REPORT & "Log increment testing", BLUE

beep 1

Cycle = Cycle + 1

Wend

result "Log increment testing completed", REPORT & "Log increment testing", RED

beep 5