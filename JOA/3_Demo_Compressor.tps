Option Explicit

'* <script.tps>
'******************************************************************************
'*  AUTHOR: <Joachim Agou>
'*
'*  DESCRIPTION:
'*  <Simulation of compressor testing. Works with Compressor Map RTD page.>
'*
'*  DATE: 12/24/2019
'*
'*  MODIFICATIONS:
'*    DATE         WHO  VERSION   DESCRIPTION
'*    ----------   ---  --------  --------------------------------------------------
'*    20191225     JOA  1.0       Initial version
'*    20191225     JOA  2.0       Added prerequisites section
'******************************************************************************



'******************************************************************************
'************************* LOCAL VARIABLE DECLARATIONS ************************
'******************************************************************************

dim bool1
channel "Sim_Compressor_PR, Sim_Compressor_W, Demo_Compressor_PR, Demo_Compressor_W"



'******************************************************************************
'******************************** PREREQUISITES *******************************
'******************************************************************************

note "*** DEMO COMPRESSOR ***"
note" "

Caution "Ensure the corresponding RTD page is loaded."

'show_view "mangtp5-rtd1", "View 0", "xxxxx.v"
'show_view "prodasrtd1", "View 0", "xxxxx.v"
'show_view "rtd1host", "View 0", "xxxxx.v"
'result "The Real-Time Display page has been loaded", REPORT & "Demo", BLACK
delay 5



'******************************************************************************
'************************************ DEMO ************************************
'******************************************************************************

result "Demo Compressor is started", REPORT & "Demo Compressor", BLACK

set_channel Sim_Compressor_PR, 0
set_channel Sim_Compressor_W, 0
delay 5
do_fullset 1, "Steady-state measurement completed", "Demo Compressor"

result "A steady-state measurement has been taken automatically", REPORT & "Demo Compressor", BLACK
result "     * Pressure Ratio =" &fv_Demo_Compressor_PR, REPORT & "Fullset", BLUE
result "         ** Pressure Ratio offset =" &FormatNumber(fv_Demo_Compressor_PR-fv_Sim_Compressor_PR,0), REPORT & "Demo Compressor", RED
result "     * Mass Flow Rate =" &fv_Demo_Compressor_W &" kg/s", REPORT & "Demo Compressor", BLUE
result "         ** Mass Flow Rate offset =" &FormatNumber(fv_Demo_Compressor_W-fv_Sim_Compressor_W,0) & " kg/s", REPORT & "Demo Compressor", RED

'******************************************************************************

set_channel Sim_Compressor_PR, 0.9
set_channel Sim_Compressor_W, 4
delay 5
do_fullset 1, "Steady-state measurement completed", "Demo Compressor"

result "A steady-state measurement has been taken automatically", REPORT & "Demo Compressor", BLACK
result "     * Pressure Ratio =" &fv_Demo_Compressor_PR, REPORT & "Fullset", BLUE
result "         ** Pressure Ratio offset =" &FormatNumber(fv_Demo_Compressor_PR-fv_Sim_Compressor_PR,0), REPORT & "Demo Compressor", RED
result "     * Mass Flow Rate =" &fv_Demo_Compressor_W &" kg/s", REPORT & "Demo Compressor", BLUE
result "         ** Mass Flow Rate offset =" &FormatNumber(fv_Demo_Compressor_W-fv_Sim_Compressor_W,0) & " kg/s", REPORT & "Demo Compressor", RED

'******************************************************************************

set_channel Sim_Compressor_PR, 1
set_channel Sim_Compressor_W, 5
delay 5
do_fullset 1, "Steady-state measurement completed", "Demo Compressor"

result "A steady-state measurement has been taken automatically", REPORT & "Demo Compressor", BLACK
result "     * Pressure Ratio =" &fv_Demo_Compressor_PR, REPORT & "Fullset", BLUE
result "         ** Pressure Ratio offset =" &FormatNumber(fv_Demo_Compressor_PR-fv_Sim_Compressor_PR,0), REPORT & "Demo Compressor", RED
result "     * Mass Flow Rate =" &fv_Demo_Compressor_W &" kg/s", REPORT & "Demo Compressor", BLUE
result "         ** Mass Flow Rate offset =" &FormatNumber(fv_Demo_Compressor_W-fv_Sim_Compressor_W,0) & " kg/s", REPORT & "Demo Compressor", RED

'******************************************************************************

set_channel Sim_Compressor_PR, 1.5
set_channel Sim_Compressor_W, 6
delay 5
do_fullset 1, "Steady-state measurement completed", "Demo Compressor"

result "A steady-state measurement has been taken automatically", REPORT & "Demo Compressor", BLACK
result "     * Pressure Ratio =" &fv_Demo_Compressor_PR, REPORT & "Fullset", BLUE
result "         ** Pressure Ratio offset =" &FormatNumber(fv_Demo_Compressor_PR-fv_Sim_Compressor_PR,0), REPORT & "Demo Compressor", RED
result "     * Mass Flow Rate =" &fv_Demo_Compressor_W &" kg/s", REPORT & "Demo Compressor", BLUE
result "         ** Mass Flow Rate offset =" &FormatNumber(fv_Demo_Compressor_W-fv_Sim_Compressor_W,0) & " kg/s", REPORT & "Demo Compressor", RED

'******************************************************************************

set_channel Sim_Compressor_PR, 2.3
set_channel Sim_Compressor_W, 10
delay 5
do_fullset 1, "Steady-state measurement completed", "Demo Compressor"

result "A steady-state measurement has been taken automatically", REPORT & "Demo Compressor", BLACK
result "     * Pressure Ratio =" &fv_Demo_Compressor_PR, REPORT & "Fullset", BLUE
result "         ** Pressure Ratio offset =" &FormatNumber(fv_Demo_Compressor_PR-fv_Sim_Compressor_PR,0), REPORT & "Demo Compressor", RED
result "     * Mass Flow Rate =" &fv_Demo_Compressor_W &" kg/s", REPORT & "Demo Compressor", BLUE
result "         ** Mass Flow Rate offset =" &FormatNumber(fv_Demo_Compressor_W-fv_Sim_Compressor_W,0) & " kg/s", REPORT & "Demo Compressor", RED

'******************************************************************************

set_channel Sim_Compressor_PR, 6.5
set_channel Sim_Compressor_W, 18
delay 5
do_fullset 1, "Steady-state measurement completed", "Demo Compressor"

result "A steady-state measurement has been taken automatically", REPORT & "Demo Compressor", BLACK
result "     * Pressure Ratio =" &fv_Demo_Compressor_PR, REPORT & "Fullset", BLUE
result "         ** Pressure Ratio offset =" &FormatNumber(fv_Demo_Compressor_PR-fv_Sim_Compressor_PR,0), REPORT & "Demo Compressor", RED
result "     * Mass Flow Rate =" &fv_Demo_Compressor_W &" kg/s", REPORT & "Demo Compressor", BLUE
result "         ** Mass Flow Rate offset =" &FormatNumber(fv_Demo_Compressor_W-fv_Sim_Compressor_W,0) & " kg/s", REPORT & "Demo Compressor", RED

'******************************************************************************

set_channel Sim_Compressor_PR, 6
set_channel Sim_Compressor_W, 18
delay 5
do_fullset 1, "Steady-state measurement completed", "Demo Compressor"

result "A steady-state measurement has been taken automatically", REPORT & "Demo Compressor", BLACK
result "     * Pressure Ratio =" &fv_Demo_Compressor_PR, REPORT & "Fullset", BLUE
result "         ** Pressure Ratio offset =" &FormatNumber(fv_Demo_Compressor_PR-fv_Sim_Compressor_PR,0), REPORT & "Demo Compressor", RED
result "     * Mass Flow Rate =" &fv_Demo_Compressor_W &" kg/s", REPORT & "Demo Compressor", BLUE
result "         ** Mass Flow Rate offset =" &FormatNumber(fv_Demo_Compressor_W-fv_Sim_Compressor_W,0) & " kg/s", REPORT & "Demo Compressor", RED

'******************************************************************************

set_channel Sim_Compressor_PR, 7
set_channel Sim_Compressor_W, 20
delay 5
do_fullset 1, "Steady-state measurement completed", "Demo Compressor"

result "A steady-state measurement has been taken automatically", REPORT & "Demo Compressor", BLACK
result "     * Pressure Ratio =" &fv_Demo_Compressor_PR, REPORT & "Fullset", BLUE
result "         ** Pressure Ratio offset =" &FormatNumber(fv_Demo_Compressor_PR-fv_Sim_Compressor_PR,0), REPORT & "Demo Compressor", RED
result "     * Mass Flow Rate =" &fv_Demo_Compressor_W &" kg/s", REPORT & "Demo Compressor", BLUE
result "         ** Mass Flow Rate offset =" &FormatNumber(fv_Demo_Compressor_W-fv_Sim_Compressor_W,0) & " kg/s", REPORT & "Demo Compressor", RED


beep 1

result "Demo Compressor is completed", REPORT & "Demo Compressor", BLACK