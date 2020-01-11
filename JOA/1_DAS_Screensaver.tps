Option Explicit

'* <script.tps>
'******************************************************************************
'*  AUTHOR: <Joachim Agou>
'*
'*  DESCRIPTION:
'*  <Visual demo>
'*
'*  DATE: 01/03/2020 
'*
'*  MODIFICATIONS:
'*    DATE         WHO  VERSION   DESCRIPTION
'*    ----------   ---  --------  --------------------------------------------------
'*    20200103     JOA  1.0       Initial version
'*    20200105     JOA  2.0       Cleanup code. Added verbosity.
'******************************************************************************



'******************************************************************************
'************************* LOCAL VARIABLE DECLARATIONS ************************
'******************************************************************************

dim Boo1, Cycle, Big_Cycle
channel "Math_Float1, Math_Float2, Math_Float3, Math_Float4, Math_Float5, Math_Bool1, Math_Bool2, Sim_Compressor_PR, Sim_Compressor_W, Sim_Compressor_Response_Selector, Demo_JetEngine_Flight_Selector"



'******************************************************************************
'******************************** PREREQUISITES *******************************
'******************************************************************************

note "*** SCREENSAVER ***"
note" "

'show_view "mangtp5-rtd1", "View 0", "xxxxx.v"
'show_view "prodasrtd1", "View 0", "xxxxx.v"
'show_view "rtd1host", "View 0", "xxxxx.v"
'result "The Real-Time Display page has been loaded", REPORT & "Demo", BLACK
'delay 5

instruction "Before you start:",SKIP
	If skipGV = True Then
	result "Instructions skipped!", REPORT, RED
	End If

note "> Verify the RTD pages (.v files) of the test procedure are defined in the RTE."
note "> Verify the RTD1 computer has started RTD Driver with View 0 and View 1."
note " "
note " "
note " "

prompt_boo "Did you understand the instructions?",boo1
	If Boo1 = false Then
	result "Demonstration Canceled!", REPORT , RED
	quit
	End If



'******************************************************************************
'************************************ DEMO ************************************
'******************************************************************************

note "Starting screensaver ..."

Cycle = 1
While Cycle<=1000


note "Templates ..."

show_view "prodasrtd1", "View 0", "0_Template_1920_1200.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 1

show_view "prodasrtd1", "View 1", "0_Template_1920_1200_Panel.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 1



'******************************************************************************

note "DAS ..."

show_view "prodasrtd1", "View 0", "1_Clock.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 2

show_view "prodasrtd1", "View 1", "1_DAS_Control.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 4

show_view "prodasrtd1", "View 0", "1_PBS_Purge_Control.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 3



'******************************************************************************

note "Demonstration ..."

show_view "prodasrtd1", "View 1", "2_Alarms.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 1


show_view "prodasrtd1", "View 0", "2_Calculations.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 2


set_channel Math_Float1, 1
set_channel Math_Float2, 2
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 0
set_channel Math_Bool2, 0

delay 2

set_channel Math_Float1, 1
set_channel Math_Float2, 10
set_channel Math_Float3, 100
set_channel Math_Float4, 1000
set_channel Math_Float5, 10000
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -86
set_channel Math_Float2, 21
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 0
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, 0
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -10
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -20
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -30
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -40
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -201
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -199
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -196
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -195
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, -250
set_channel Math_Float2, -194
set_channel Math_Float3, 3
set_channel Math_Float4, 4
set_channel Math_Float5, 5
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 2

set_channel Math_Float1, 1.123
set_channel Math_Float2, 8
set_channel Math_Float3, 88
set_channel Math_Float4, 100
set_channel Math_Float5, 111
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1

delay 1




show_view "prodasrtd1", "View 1", "2_Conversion_DecHexBin.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 2

show_view "prodasrtd1", "View 0", "2_Languages.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 1

show_view "prodasrtd1", "View 1", "2_Polar.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 5

show_view "prodasrtd1", "View 0", "2_Profile_Plot.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 2

set_channel Math_Float1, 10
set_channel Math_Float2, 20
set_channel Math_Float3, 30
set_channel Math_Float4, 40
set_channel Math_Float5, 50
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1
delay 4

set_channel Math_Float1, 10
set_channel Math_Float2, 120
set_channel Math_Float3, 130
set_channel Math_Float4, 140
set_channel Math_Float5, 150
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1
delay 5

set_channel Math_Float1, 1.123
set_channel Math_Float2, 8
set_channel Math_Float3, 88
set_channel Math_Float4, 100
set_channel Math_Float5, 111
set_channel Math_Bool1, 1
set_channel Math_Bool2, 1
delay 5


show_view "prodasrtd1", "View 1", "2_Simulations.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 5

show_view "prodasrtd1", "View 0", "2_Simulations_32Channels.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 2

show_view "prodasrtd1", "View 1", "2_Simulations2.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 10



'******************************************************************************

note "Compressor ..."

show_view "prodasrtd1", "View 0", "3_CompressorMap.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 1

show_view "prodasrtd1", "View 1", "3_CompressorMap_Panel.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 10

set_channel Sim_Compressor_Response_Selector, 2
set_channel Sim_Compressor_PR, 0
set_channel Sim_Compressor_W, 0
delay 5

set_channel Sim_Compressor_PR, 0.9
set_channel Sim_Compressor_W, 4
delay 3

set_channel Sim_Compressor_PR, 1
set_channel Sim_Compressor_W, 5
delay 3

set_channel Sim_Compressor_PR, 1.5
set_channel Sim_Compressor_W, 6
delay 3

set_channel Sim_Compressor_PR, 2.3
set_channel Sim_Compressor_W, 10
delay 2

set_channel Sim_Compressor_PR, 6.5
set_channel Sim_Compressor_W, 18
delay 3


set_channel Sim_Compressor_PR, 6
set_channel Sim_Compressor_W, 18
delay 3

set_channel Sim_Compressor_Response_Selector, 1
set_channel Sim_Compressor_PR, 7
set_channel Sim_Compressor_W, 20
delay 5



'******************************************************************************

note "Jet Engine ..."

show_view "prodasrtd1", "View 0", "4_JetEngine_MainPage.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 5

show_view "prodasrtd1", "View 1", "4_JetEngine_Picture.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 10

set_channel Demo_JetEngine_Flight_Selector, 1
delay 2

set_channel Demo_JetEngine_Flight_Selector, 3
delay 5

set_channel Demo_JetEngine_Flight_Selector, 6
delay 5

show_view "prodasrtd1", "View 0", "4_JetEngine_VibSurvey.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT

delay 1

set_channel Demo_JetEngine_Flight_Selector, 1
delay 3



'******************************************************************************

note "Bellmouth Mass Flow ..."

show_view "prodasrtd1", "View 1", "5_Bellmouth_Mass_Flow.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 2



'******************************************************************************

note "Industrial Gas Turbine ..."

show_view "prodasrtd1", "View 0", "6_GasTurbine_Mechanical_Verif.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 5

show_view "prodasrtd1", "View 1", "6_GasTurbine_Picture.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 5

show_view "prodasrtd1", "View 0", "6_GasTurbine_Speed_Targets.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 5

show_view "prodasrtd1", "View 1", "6_GasTurbine_Speed_Torque.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 5

show_view "prodasrtd1", "View 0", "6_GasTurbine_Thermo_Verif.v"
result "The Real-Time Display page has been loaded on View 0", REPORT, BLACK
result " ", REPORT
delay 5



'******************************************************************************

note "Emissions ..."

show_view "prodasrtd1", "View 1", "7_Emissions.v"
result "The Real-Time Display page has been loaded on View 1", REPORT, BLACK
result " ", REPORT
delay 5



'******************************************************************************

note "Next cycle ..."

result "Cycle Calculations completed", REPORT & "Calculations cycle", BLUE

Cycle = Cycle + 1

Wend


result "All cycles completed!", REPORT, GREEN

beep 5