Option Explicit

'* <script.tps>
'******************************************************************************
'*  AUTHOR: <Joachim Agou>
'*
'*  DESCRIPTION:
'*  <This is a sandbox and a template.>
'*
'*  DATE: 12/24/2019 3:05:59 PM
'*
'*  MODIFICATIONS:
'*    DATE         WHO  VERSION   DESCRIPTION
'*    ----------   ---  --------  --------------------------------------------------
'*    20191225     JOA  1.0       Initial version
'*    20191228     JOA  2.0       Added prerequisites section
'******************************************************************************



'******************************************************************************
'************************* LOCAL VARIABLE DECLARATIONS ************************
'******************************************************************************

dim boo1
channel "Math_Float1, Math_Float2, Math_Float3, Math_Float4, Math_Float5, Math_Bool1, Math_Bool2"



'******************************************************************************
'******************************** PREREQUISITES *******************************
'******************************************************************************

note "*** SANDBOX TEST PROCEDURE ***"
note" "

Caution "Ensure the corresponding RTD page is loaded."

'show_view "mangtp5-rtd1", "View 0", "xxxxx.v"
'show_view "prodasrtd1", "View 0", "xxxxx.v"
'show_view "rtd1host", "View 0", "xxxxx.v"
'result "The Real-Time Display page has been loaded", REPORT & "Demo", BLACK
delay 5

instruction "Read the instructions below:",SKIP
	If skipGV = True Then
	result "Instructions skipped!", REPORT, RED
	End If

note" "

prompt_boo "Did you understand the instructions?",boo1
	If boo1 = false Then
	result "Demonstration Canceled!", REPORT , RED
	quit
	End If



'******************************************************************************
'************************************ DEMO ************************************
'******************************************************************************

note "This is a test."
caution "This is a test."
warning "This is a test."
result "Demo Test Procedure is started", REPORT, BLUE
result "Demo Test Procedure is started", REPORT, GREEN
result "Demo Test Procedure is started", REPORT, RED
result "Demo Test Procedure is started", REPORT, BLACK
result "Demo Test Procedure is started", REPORT, YELLOW

instruction "Instruction #1", skip
	If skipGV = True Then
	result "Instructions skipped!", REPORT, RED
	End If

result "Instruction #1 is in progress ...", REPORT, BLACK
	delay 5
	result "Instruction #1 is completed", REPORT, GREEN

instruction "Instruction #2", skip
	If skipGV = True Then
	result "Instructions skipped!", REPORT, RED
	End If

result "Instruction #2 is in progress ...", REPORT, BLACK
	delay 5
	result "Instruction #2 is completed", REPORT, GREEN

result RTE_Date
result RTE_Time
result "beep - beep - beep - beep - beep", REPORT, BLACK
beep 5