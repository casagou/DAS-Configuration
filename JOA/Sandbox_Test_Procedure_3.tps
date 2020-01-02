Option Explicit

'* <script.tps>
'******************************************************************************
'*  AUTHOR: <your name goes here>
'*
'*  DESCRIPTION:
'*  <describe the script here>
'*
'*  DATE: 12/24/2019 3:05:59 PM
'*
'*  MODIFICATIONS:
'*    DATE         WHO  VERSION   DESCRIPTION
'*    ----------   ---  --------  --------------------------------------------------
'*    20191225     JOA  1.0       Initial version
'******************************************************************************


'******************************************************************************
'************************* LOCAL VARIABLE DECLARATIONS ************************
'******************************************************************************
dim booFullset, booWarmUp, booStartTest

channel "Sim_IndustrialGT_N_GG, Sim_IndustrialGT_N_PT, Sim_IndustrialGT_N_Generator, Sim_IndustrialGT_T_M, Sim_IndustrialGT_ZI_0404030, Sim_IndustrialGT_P_Baro, Sim_IndustrialGT_ME_0405690, Sim_IndustrialGT_PDT_2210, Sim_IndustrialGT_PDT_400X, Sim_IndustrialGT_TE_0404000_A, Sim_IndustrialGT_TE_0404000_B, Sim_IndustrialGT_PD_Inlet_A, Sim_IndustrialGT_PD_Inlet_B, Sim_IndustrialGT_PT_0404000, Sim_IndustrialGT_TE_0404900, Sim_IndustrialGT_PT_0404900, Sim_IndustrialGT_TE_040461X, Sim_IndustrialGT_PT_040460X, Sim_IndustrialGT_TE_0404650, Sim_IndustrialGT_PT_0404650, Sim_IndustrialGT_TT_040_2001, Sim_IndustrialGT_PT_040_2001, Sim_IndustrialGT_FT_040_2001, Sim_IndustrialGT_T_O_in, Sim_IndustrialGT_T_O_GG_fr_out, Sim_IndustrialGT_T_O_GG_re_out, Sim_IndustrialGT_T_O_PT_out, Sim_IndustrialGT_P_O_GG_fr, Sim_IndustrialGT_P_O_GG_re, Sim_IndustrialGT_P_O_PT, Sim_IndustrialGT_F_O_GG_fr, Sim_IndustrialGT_F_O_GG_re, Sim_IndustrialGT_F_O_PT, Sim_IndustrialGT_TE_0401110_A, Sim_IndustrialGT_TE_0401110_B, Sim_IndustrialGT_TE_0401120_A, Sim_IndustrialGT_TE_0401120_B, Sim_IndustrialGT_TE_0401130_A, Sim_IndustrialGT_TE_0401130_B, Sim_IndustrialGT_TE_0401140_A, Sim_IndustrialGT_TE_0401140_B, Sim_IndustrialGT_TE_0401310_A, Sim_IndustrialGT_TE_0401310_B, Sim_IndustrialGT_TE_0401320_A, Sim_IndustrialGT_TE_0401320_B, Sim_IndustrialGT_TE_0401330_A, Sim_IndustrialGT_TE_0401330_B, Sim_IndustrialGT_TE_0401340_A, Sim_IndustrialGT_TE_0401340_B, Sim_IndustrialGT_T_O_LG_in, Sim_IndustrialGT_T_O_LG_out, Sim_IndustrialGT_F_O_LG, Demo_IndustrialGT_GG_PT_Selector, Demo_IndustrialGT_GG_Target_ISO, Demo_IndustrialGT_PT_Target_ISO, Demo_IndustrialGT_GG_Target, Demo_IndustrialGT_PT_Target, Demo_IndustrialGT_N_GG_ISO, Demo_IndustrialGT_N_PT_ISO, Demo_IndustrialGT_Pow_ISO, Demo_IndustrialGT_Eta_ISO, Demo_IndustrialGT_T4_ISO, Demo_IndustrialGT_GG_PT_Status, Demo_IndustrialGT_Response "



'******************************************************************************
'************************************ DEMO ************************************
'******************************************************************************

note "*** DEMO THERMODYNAMIQUE VERIFICATION TEST ***"

caution "Initialization"
start_log "Demo_Report", "Accel", "Transient log GG and PT Speed started"
result "A Transient Log recording the speeds has been started", REPORT & "Log", BLACK

'set_channel Demo_IndustrialGT_Response, 0.05
set_channel Demo_IndustrialGT_Response, 0.1

set_channel Sim_IndustrialGT_N_GG, 11000
set_channel Sim_IndustrialGT_N_PT, 5500
set_channel Sim_IndustrialGT_N_Generator, 3816
set_channel Sim_IndustrialGT_T_M, 8000
set_channel Sim_IndustrialGT_ZI_0404030, 14
set_channel Sim_IndustrialGT_P_Baro, 1.0155
set_channel Sim_IndustrialGT_ME_0405690, 64
set_channel Sim_IndustrialGT_PDT_2210, -1.3
set_channel Sim_IndustrialGT_PDT_400X, 0.0272
'set_channel Sim_IndustrialGT_TE_400X, 21
set_channel Sim_IndustrialGT_TE_0404000_A, 21.6
set_channel Sim_IndustrialGT_TE_0404000_B, 21.4
set_channel Sim_IndustrialGT_PD_Inlet_A, -0.0047
set_channel Sim_IndustrialGT_PD_Inlet_B, -0.0052
set_channel Sim_IndustrialGT_PT_0404000, 0.00645
set_channel Sim_IndustrialGT_TE_0404900, 320.9
set_channel Sim_IndustrialGT_PT_0404900, 7.91
set_channel Sim_IndustrialGT_TE_040461X, 539.666666666667
set_channel Sim_IndustrialGT_PT_040460X, 1.1304
set_channel Sim_IndustrialGT_TE_0404650, 421.38125
set_channel Sim_IndustrialGT_PT_0404650, -0.00265
set_channel Sim_IndustrialGT_TT_040_2001, 20
set_channel Sim_IndustrialGT_PT_040_2001, 23
set_channel Sim_IndustrialGT_FT_040_2001, 1000
set_channel Sim_IndustrialGT_T_O_in, 41.6
set_channel Sim_IndustrialGT_T_O_GG_fr_out, 50.7
set_channel Sim_IndustrialGT_T_O_GG_re_out, 63
set_channel Sim_IndustrialGT_T_O_PT_out, 54.4
set_channel Sim_IndustrialGT_P_O_GG_fr, 2.3329
set_channel Sim_IndustrialGT_P_O_GG_re, 2.1272
set_channel Sim_IndustrialGT_P_O_PT, 2.0498
set_channel Sim_IndustrialGT_F_O_GG_fr, 233.5
set_channel Sim_IndustrialGT_F_O_GG_re, 49.9
set_channel Sim_IndustrialGT_F_O_PT, 181.7
'set_channel Sim_IndustrialGT_VE_0401060_X, 21
'set_channel Sim_IndustrialGT_VE_0401060_Y, 19
'set_channel Sim_IndustrialGT_VE_0401061_X, 15
'set_channel Sim_IndustrialGT_VE_0401061_Y, 13
'set_channel Sim_IndustrialGT_VE_0401260_X, 11
'set_channel Sim_IndustrialGT_VE_0401260_Y, 11
'set_channel Sim_IndustrialGT_VE_0401261_X, 13
'set_channel Sim_IndustrialGT_VE_0401261_Y, 12
'set_channel Sim_IndustrialGT_ZE_0401050_A, 0.04
'set_channel Sim_IndustrialGT_ZE_0401050_B, 0.04
'set_channel Sim_IndustrialGT_ZE_0401250_A, -0.01
'set_channel Sim_IndustrialGT_ZE_0401250_B, -0.03
set_channel Sim_IndustrialGT_TE_0401110_A, 79.2
set_channel Sim_IndustrialGT_TE_0401110_B, 81.9
set_channel Sim_IndustrialGT_TE_0401120_A, 63.6
set_channel Sim_IndustrialGT_TE_0401120_B, 63.2
set_channel Sim_IndustrialGT_TE_0401130_A, 61.8
set_channel Sim_IndustrialGT_TE_0401130_B, 61.3
set_channel Sim_IndustrialGT_TE_0401140_A, 56.3
set_channel Sim_IndustrialGT_TE_0401140_B, 57.3
set_channel Sim_IndustrialGT_TE_0401310_A, 50.7
set_channel Sim_IndustrialGT_TE_0401310_B, 52.1
set_channel Sim_IndustrialGT_TE_0401320_A, 58.7
set_channel Sim_IndustrialGT_TE_0401320_B, 56.9
set_channel Sim_IndustrialGT_TE_0401330_A, 49.3
set_channel Sim_IndustrialGT_TE_0401330_B, 48.8
set_channel Sim_IndustrialGT_TE_0401340_A, 51.7
set_channel Sim_IndustrialGT_TE_0401340_B, 50.9
'set_channel Sim_IndustrialGT_VE_9001000_X, 26
'set_channel Sim_IndustrialGT_VE_9001000_Y, 22
set_channel Sim_IndustrialGT_T_O_LG_in, 41.9
set_channel Sim_IndustrialGT_T_O_LG_out, 46.9
set_channel Sim_IndustrialGT_F_O_LG, 287.4


'show_view "prodasrtd1", "View 0", "Speed_Monitoring.v"
result "Real-Time Display has been loaded", REPORT & "RTD page", BLACK








'************************************ PT4 *************************************

note "Going to GG4_PT4"


set_channel Demo_IndustrialGT_GG_PT_Selector, 15
set_channel Demo_IndustrialGT_GG_PT_Status, 15

set_channel Demo_IndustrialGT_GG_Target_ISO, 12700
set_channel Demo_IndustrialGT_PT_Target_ISO, 12600
do_fullset 0
result "Going to GG speed ISO target = " &cv_Demo_IndustrialGT_GG_Target_ISO &" rpm and PT speed ISO target = " &cv_Demo_IndustrialGT_PT_Target_ISO &" rpm", REPORT & "Set Point", BLACK
'delay 1

result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_GG_Target &" rpm", REPORT & "Set Point", BLUE
result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_PT_Target &" rpm", REPORT & "Set Point", BLUE
set_channel Sim_IndustrialGT_N_GG, cv_Demo_IndustrialGT_GG_Target
set_channel Sim_IndustrialGT_N_PT, cv_Demo_IndustrialGT_PT_Target


set_channel Sim_IndustrialGT_N_GG, 12945
set_channel Sim_IndustrialGT_N_PT, 12807
set_channel Sim_IndustrialGT_N_Generator, 8066
set_channel Sim_IndustrialGT_T_M, 6174.5
set_channel Sim_IndustrialGT_ZI_0404030, 1.9
set_channel Sim_IndustrialGT_P_Baro, 1.0147
set_channel Sim_IndustrialGT_ME_0405690, 51.8
set_channel Sim_IndustrialGT_PDT_2210, -2.22
set_channel Sim_IndustrialGT_PDT_400X, 0.0492


set_channel Sim_IndustrialGT_TE_0404000_A, 24.5
set_channel Sim_IndustrialGT_TE_0404000_B, 24.2
set_channel Sim_IndustrialGT_PD_Inlet_A, -0.0079
set_channel Sim_IndustrialGT_PD_Inlet_B, -0.009
set_channel Sim_IndustrialGT_PT_0404000, 0.01105
set_channel Sim_IndustrialGT_TE_0404900, 394.4
set_channel Sim_IndustrialGT_PT_0404900, 11.904
set_channel Sim_IndustrialGT_TE_040461X, 647.125
set_channel Sim_IndustrialGT_PT_040460X, 1.89015
set_channel Sim_IndustrialGT_TE_0404650, 464.5
set_channel Sim_IndustrialGT_PT_0404650, -0.00445
set_channel Sim_IndustrialGT_TT_040_2001, 32.7
set_channel Sim_IndustrialGT_PT_040_2001, 24.2199
set_channel Sim_IndustrialGT_FT_040_2001, 1944.8
set_channel Sim_IndustrialGT_T_O_in, 49.6
set_channel Sim_IndustrialGT_T_O_GG_fr_out, 60.9
set_channel Sim_IndustrialGT_T_O_GG_re_out, 78.2
set_channel Sim_IndustrialGT_T_O_PT_out, 76.6
set_channel Sim_IndustrialGT_P_O_GG_fr, 2.1768
set_channel Sim_IndustrialGT_P_O_GG_re, 2.0539
set_channel Sim_IndustrialGT_P_O_PT, 1.9326
set_channel Sim_IndustrialGT_F_O_GG_fr, 228.8
set_channel Sim_IndustrialGT_F_O_GG_re, 48.5
set_channel Sim_IndustrialGT_F_O_PT, 179.5


set_channel Sim_IndustrialGT_TE_0401110_A, 85.1
set_channel Sim_IndustrialGT_TE_0401110_B, 88
set_channel Sim_IndustrialGT_TE_0401120_A, 71.5
set_channel Sim_IndustrialGT_TE_0401120_B, 71.3
set_channel Sim_IndustrialGT_TE_0401130_A, 72.1
set_channel Sim_IndustrialGT_TE_0401130_B, 70.9
set_channel Sim_IndustrialGT_TE_0401140_A, 70.3
set_channel Sim_IndustrialGT_TE_0401140_B, 70.3
set_channel Sim_IndustrialGT_TE_0401310_A, 68.4
set_channel Sim_IndustrialGT_TE_0401310_B, 69.7
set_channel Sim_IndustrialGT_TE_0401320_A, 79.7
set_channel Sim_IndustrialGT_TE_0401320_B, 77.3
set_channel Sim_IndustrialGT_TE_0401330_A, 73.1
set_channel Sim_IndustrialGT_TE_0401330_B, 70.9
set_channel Sim_IndustrialGT_TE_0401340_A, 69.1
set_channel Sim_IndustrialGT_TE_0401340_B, 68.8


set_channel Sim_IndustrialGT_T_O_LG_in, 49.7
set_channel Sim_IndustrialGT_T_O_LG_out, 66.3
set_channel Sim_IndustrialGT_F_O_LG, 304.3


'delay 8
beep 1


set_channel Demo_IndustrialGT_GG_PT_Status, 21
result "Stabilizing - Minimum 5 minutes ...", REPORT & "Stabilization", BLACK
'delay 1
result "Stabilization completed", REPORT & "Stabilization", GREEN
'delay 1

set_channel Demo_IndustrialGT_GG_PT_Status, 22
'delay 1
do_fullset 1, "Thermodynamic measurement: N_GG4 N_PT4", "GG4_PT4"
result "A steady-state measurement has been taken automatically", REPORT & "Fullset", BLACK
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_GG_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_GG_ISO-fv_Demo_IndustrialGT_GG_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_PT_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_PT_ISO-fv_Demo_IndustrialGT_PT_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * Power ISO =" &fv_Demo_IndustrialGT_Pow_ISO &" kW", REPORT & "Fullset", BLUE
result "     * Efficiency ISO =" &fv_Demo_IndustrialGT_Eta_ISO &" %", REPORT & "Fullset", BLUE
result "     * T4 ISO =" &fv_Demo_IndustrialGT_T4_ISO &" degC", REPORT & "Fullset", BLUE
set_channel Demo_IndustrialGT_GG_PT_Status, 23
'delay 1
result "Thermodynamic measurement GG4_PT4 completed", REPORT & "Fullset", GREEN
result " ", REPORT
result " ", REPORT
result " *** All GG4 measurements have been completed ***", REPORT & "Fullset", GREEN
result " ", REPORT
result " ", REPORT


'******************************************************************************
'************************************ GG5 *************************************
'******************************************************************************
caution "GG5"
'************************************ PT1 *************************************


note "Going to GG5_PT1"


set_channel Demo_IndustrialGT_GG_PT_Selector, 16
set_channel Demo_IndustrialGT_GG_PT_Status, 16

set_channel Demo_IndustrialGT_GG_Target_ISO, -88888
set_channel Demo_IndustrialGT_PT_Target_ISO, 6000
do_fullset 0

result "Going to GG speed ISO target = " &cv_Demo_IndustrialGT_GG_Target_ISO &" rpm and PT speed ISO target = " &cv_Demo_IndustrialGT_PT_Target_ISO &" rpm", REPORT & "Set Point", BLACK
delay 1


result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_GG_Target &" rpm", REPORT & "Set Point", BLUE
result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_PT_Target &" rpm", REPORT & "Set Point", BLUE
set_channel Sim_IndustrialGT_N_GG, cv_Demo_IndustrialGT_GG_Target
set_channel Sim_IndustrialGT_N_PT, cv_Demo_IndustrialGT_PT_Target


set_channel Sim_IndustrialGT_N_GG, 13336
set_channel Sim_IndustrialGT_N_PT, 7348
set_channel Sim_IndustrialGT_N_Generator, 4624
set_channel Sim_IndustrialGT_T_M, 12895.5
set_channel Sim_IndustrialGT_ZI_0404030, -2.4
set_channel Sim_IndustrialGT_P_Baro, 1.0144
set_channel Sim_IndustrialGT_ME_0405690, 49.3
set_channel Sim_IndustrialGT_PDT_2210, -2.56
set_channel Sim_IndustrialGT_PDT_400X, 0.0584


set_channel Sim_IndustrialGT_TE_0404000_A, 25
set_channel Sim_IndustrialGT_TE_0404000_B, 24.7
set_channel Sim_IndustrialGT_PD_Inlet_A, -0.0094
set_channel Sim_IndustrialGT_PD_Inlet_B, -0.0103
set_channel Sim_IndustrialGT_PT_0404000, 0.01285
set_channel Sim_IndustrialGT_TE_0404900, 419.55
set_channel Sim_IndustrialGT_PT_0404900, 13.48055
set_channel Sim_IndustrialGT_TE_040461X, 702.575
set_channel Sim_IndustrialGT_PT_040460X, 2.2343
set_channel Sim_IndustrialGT_TE_0404650, 508.75
set_channel Sim_IndustrialGT_PT_0404650, -0.0037
set_channel Sim_IndustrialGT_TT_040_2001, 33.5
set_channel Sim_IndustrialGT_PT_040_2001, 24.0543
set_channel Sim_IndustrialGT_FT_040_2001, 2313.1
set_channel Sim_IndustrialGT_T_O_in, 49.5
set_channel Sim_IndustrialGT_T_O_GG_fr_out, 61.6
set_channel Sim_IndustrialGT_T_O_GG_re_out, 81.8
set_channel Sim_IndustrialGT_T_O_PT_out, 69
set_channel Sim_IndustrialGT_P_O_GG_fr, 2.2167
set_channel Sim_IndustrialGT_P_O_GG_re, 2.0871
set_channel Sim_IndustrialGT_P_O_PT, 1.9701
set_channel Sim_IndustrialGT_F_O_GG_fr, 230.5
set_channel Sim_IndustrialGT_F_O_GG_re, 48.8
set_channel Sim_IndustrialGT_F_O_PT, 180.7


set_channel Sim_IndustrialGT_TE_0401110_A, 85.5
set_channel Sim_IndustrialGT_TE_0401110_B, 88.7
set_channel Sim_IndustrialGT_TE_0401120_A, 72.1
set_channel Sim_IndustrialGT_TE_0401120_B, 72.1
set_channel Sim_IndustrialGT_TE_0401130_A, 73
set_channel Sim_IndustrialGT_TE_0401130_B, 71.9
set_channel Sim_IndustrialGT_TE_0401140_A, 70.4
set_channel Sim_IndustrialGT_TE_0401140_B, 70.1
set_channel Sim_IndustrialGT_TE_0401310_A, 59.1
set_channel Sim_IndustrialGT_TE_0401310_B, 60.6
set_channel Sim_IndustrialGT_TE_0401320_A, 68.1
set_channel Sim_IndustrialGT_TE_0401320_B, 66
set_channel Sim_IndustrialGT_TE_0401330_A, 59.1
set_channel Sim_IndustrialGT_TE_0401330_B, 57.9
set_channel Sim_IndustrialGT_TE_0401340_A, 64.8
set_channel Sim_IndustrialGT_TE_0401340_B, 66


set_channel Sim_IndustrialGT_T_O_LG_in, 49.6
set_channel Sim_IndustrialGT_T_O_LG_out, 57.4
set_channel Sim_IndustrialGT_F_O_LG, 294.8


'delay 8
beep 1

set_channel Demo_IndustrialGT_GG_PT_Status, 21
result "Stabilizing - Minimum 10 minutes ...", REPORT & "Stabilization", BLACK
'delay 1
result "Halfway - 5 more minutes ...", REPORT & "Stabilization", BLACK
'delay 1
result "Stabilization completed", REPORT & "Stabilization", GREEN
'delay 1

set_channel Demo_IndustrialGT_GG_PT_Status, 22
'delay 1
do_fullset 1, "Thermodynamic measurement: N_GG5 N_PT1", "GG5_PT1"
result "A steady-state measurement has been taken automatically", REPORT & "Fullset", BLACK
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_GG_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_GG_ISO-fv_Demo_IndustrialGT_GG_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_PT_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_PT_ISO-fv_Demo_IndustrialGT_PT_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * Power ISO =" &fv_Demo_IndustrialGT_Pow_ISO &" kW", REPORT & "Fullset", BLUE
result "     * Efficiency ISO =" &fv_Demo_IndustrialGT_Eta_ISO &" %", REPORT & "Fullset", BLUE
result "     * T4 ISO =" &fv_Demo_IndustrialGT_T4_ISO &" degC", REPORT & "Fullset", BLUE
set_channel Demo_IndustrialGT_GG_PT_Status, 23
'delay 1
result "Thermodynamic measurement GG5_PT1 completed", REPORT & "Fullset", GREEN
result " ", REPORT
result " ", REPORT



'************************************ PT2 *************************************

note "Going to GG5_PT2"

set_channel Demo_IndustrialGT_GG_PT_Selector, 17
set_channel Demo_IndustrialGT_GG_PT_Status, 17

set_channel Demo_IndustrialGT_GG_Target_ISO, -88888
set_channel Demo_IndustrialGT_PT_Target_ISO, 8400
do_fullset 0
result "Going to GG speed ISO target = " &cv_Demo_IndustrialGT_GG_Target_ISO &" rpm and PT speed ISO target = " &cv_Demo_IndustrialGT_PT_Target_ISO &" rpm", REPORT & "Set Point", BLACK
'delay 1


result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_GG_Target &" rpm", REPORT & "Set Point", BLUE
result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_PT_Target &" rpm", REPORT & "Set Point", BLUE

'set_channel Sim_IndustrialGT_N_GG, cv_Demo_IndustrialGT_GG_Target
'set_channel Sim_IndustrialGT_N_PT, cv_Demo_IndustrialGT_PT_Target

set_channel Sim_IndustrialGT_N_GG, 13335
set_channel Sim_IndustrialGT_N_PT, 8565
set_channel Sim_IndustrialGT_N_Generator, 5392
set_channel Sim_IndustrialGT_T_M, 11702.4
set_channel Sim_IndustrialGT_ZI_0404030, -2.3
set_channel Sim_IndustrialGT_P_Baro, 1.0144
set_channel Sim_IndustrialGT_ME_0405690, 48
set_channel Sim_IndustrialGT_PDT_2210, -2.55
set_channel Sim_IndustrialGT_PDT_400X, 0.0585


set_channel Sim_IndustrialGT_TE_0404000_A, 25.2
set_channel Sim_IndustrialGT_TE_0404000_B, 24.8
set_channel Sim_IndustrialGT_PD_Inlet_A, -0.0094
set_channel Sim_IndustrialGT_PD_Inlet_B, -0.0103
set_channel Sim_IndustrialGT_PT_0404000, 0.01285
set_channel Sim_IndustrialGT_TE_0404900, 419.4
set_channel Sim_IndustrialGT_PT_0404900, 13.4985
set_channel Sim_IndustrialGT_TE_040461X, 702.383333333333
set_channel Sim_IndustrialGT_PT_040460X, 2.2389
set_channel Sim_IndustrialGT_TE_0404650, 498.78125
set_channel Sim_IndustrialGT_PT_0404650, -0.00395
set_channel Sim_IndustrialGT_TT_040_2001, 33.5
set_channel Sim_IndustrialGT_PT_040_2001, 24.0472
set_channel Sim_IndustrialGT_FT_040_2001, 2311.5
set_channel Sim_IndustrialGT_T_O_in, 49.2
set_channel Sim_IndustrialGT_T_O_GG_fr_out, 61.5
set_channel Sim_IndustrialGT_T_O_GG_re_out, 81.6
set_channel Sim_IndustrialGT_T_O_PT_out, 70.8
set_channel Sim_IndustrialGT_P_O_GG_fr, 2.2132
set_channel Sim_IndustrialGT_P_O_GG_re, 2.0812
set_channel Sim_IndustrialGT_P_O_PT, 1.9666
set_channel Sim_IndustrialGT_F_O_GG_fr, 230.2
set_channel Sim_IndustrialGT_F_O_GG_re, 48.7
set_channel Sim_IndustrialGT_F_O_PT, 180.2


set_channel Sim_IndustrialGT_TE_0401110_A, 85.5
set_channel Sim_IndustrialGT_TE_0401110_B, 88.6
set_channel Sim_IndustrialGT_TE_0401120_A, 72
set_channel Sim_IndustrialGT_TE_0401120_B, 71.9
set_channel Sim_IndustrialGT_TE_0401130_A, 72.8
set_channel Sim_IndustrialGT_TE_0401130_B, 71.7
set_channel Sim_IndustrialGT_TE_0401140_A, 70.3
set_channel Sim_IndustrialGT_TE_0401140_B, 69.9
set_channel Sim_IndustrialGT_TE_0401310_A, 60.6
set_channel Sim_IndustrialGT_TE_0401310_B, 62
set_channel Sim_IndustrialGT_TE_0401320_A, 70.3
set_channel Sim_IndustrialGT_TE_0401320_B, 68
set_channel Sim_IndustrialGT_TE_0401330_A, 61.4
set_channel Sim_IndustrialGT_TE_0401330_B, 60
set_channel Sim_IndustrialGT_TE_0401340_A, 65
set_channel Sim_IndustrialGT_TE_0401340_B, 65.9


set_channel Sim_IndustrialGT_T_O_LG_in, 49.3
set_channel Sim_IndustrialGT_T_O_LG_out, 58.7
set_channel Sim_IndustrialGT_F_O_LG, 297.2

'delay 8
beep 1

set_channel Demo_IndustrialGT_GG_PT_Status, 21
result "Stabilizing - Minimum 5 minutes ...", REPORT & "Stabilization", BLACK
'delay 1
result "Stabilization completed", REPORT & "Stabilization", GREEN
'delay 1

set_channel Demo_IndustrialGT_GG_PT_Status, 22
'delay 1
do_fullset 1, "Thermodynamic measurement: N_GG5 N_PT2", "GG5_PT2"
result "A steady-state measurement has been taken automatically", REPORT & "Fullset", BLACK
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_GG_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_GG_ISO-fv_Demo_IndustrialGT_GG_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_PT_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_PT_ISO-fv_Demo_IndustrialGT_PT_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * Power ISO =" &fv_Demo_IndustrialGT_Pow_ISO &" kW", REPORT & "Fullset", BLUE
result "     * Efficiency ISO =" &fv_Demo_IndustrialGT_Eta_ISO &" %", REPORT & "Fullset", BLUE
result "     * T4 ISO =" &fv_Demo_IndustrialGT_T4_ISO &" degC", REPORT & "Fullset", BLUE
set_channel Demo_IndustrialGT_GG_PT_Status, 23
'delay 1
result "Thermodynamic measurement GG5_PT2 completed", REPORT & "Fullset", GREEN
result " ", REPORT
result " ", REPORT



'************************************ PT3 *************************************

note "Going to GG5_PT3"

set_channel Demo_IndustrialGT_GG_PT_Selector, 18
set_channel Demo_IndustrialGT_GG_PT_Status, 18

set_channel Demo_IndustrialGT_GG_Target_ISO, -88888
set_channel Demo_IndustrialGT_PT_Target_ISO, 10800
do_fullset 0
result "Going to GG speed ISO target = " &cv_Demo_IndustrialGT_GG_Target_ISO &" rpm and PT speed ISO target = " &cv_Demo_IndustrialGT_PT_Target_ISO &" rpm", REPORT & "Set Point", BLACK
'delay 1


result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_GG_Target &" rpm", REPORT & "Set Point", BLUE
result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_PT_Target &" rpm", REPORT & "Set Point", BLUE
'set_channel Sim_IndustrialGT_N_GG, cv_Demo_IndustrialGT_GG_Target
'set_channel Sim_IndustrialGT_N_PT, cv_Demo_IndustrialGT_PT_Target


set_channel Sim_IndustrialGT_N_GG, 13334
set_channel Sim_IndustrialGT_N_PT, 11011
set_channel Sim_IndustrialGT_N_Generator, 6934
set_channel Sim_IndustrialGT_T_M, 9505.7
set_channel Sim_IndustrialGT_ZI_0404030, -2.3
set_channel Sim_IndustrialGT_P_Baro, 1.0143
set_channel Sim_IndustrialGT_ME_0405690, 47.8
set_channel Sim_IndustrialGT_PDT_2210, -2.53
set_channel Sim_IndustrialGT_PDT_400X, 0.0583


set_channel Sim_IndustrialGT_TE_0404000_A, 25.5
set_channel Sim_IndustrialGT_TE_0404000_B, 25.2
set_channel Sim_IndustrialGT_PD_Inlet_A, -0.0092
set_channel Sim_IndustrialGT_PD_Inlet_B, -0.0103
set_channel Sim_IndustrialGT_PT_0404000, 0.01275
set_channel Sim_IndustrialGT_TE_0404900, 420.1
set_channel Sim_IndustrialGT_PT_0404900, 13.48125
set_channel Sim_IndustrialGT_TE_040461X, 704.366666666667
set_channel Sim_IndustrialGT_PT_040460X, 2.24095
set_channel Sim_IndustrialGT_TE_0404650, 489
set_channel Sim_IndustrialGT_PT_0404650, -0.00455
set_channel Sim_IndustrialGT_TT_040_2001, 33.6
set_channel Sim_IndustrialGT_PT_040_2001, 24.0451
set_channel Sim_IndustrialGT_FT_040_2001, 2319
set_channel Sim_IndustrialGT_T_O_in, 48.5
set_channel Sim_IndustrialGT_T_O_GG_fr_out, 61
set_channel Sim_IndustrialGT_T_O_GG_re_out, 81.3
set_channel Sim_IndustrialGT_T_O_PT_out, 74.6
set_channel Sim_IndustrialGT_P_O_GG_fr, 2.1908
set_channel Sim_IndustrialGT_P_O_GG_re, 2.0599
set_channel Sim_IndustrialGT_P_O_PT, 1.9456
set_channel Sim_IndustrialGT_F_O_GG_fr, 228.5
set_channel Sim_IndustrialGT_F_O_GG_re, 48.4
set_channel Sim_IndustrialGT_F_O_PT, 178.7


set_channel Sim_IndustrialGT_TE_0401110_A, 85.2
set_channel Sim_IndustrialGT_TE_0401110_B, 88.2
set_channel Sim_IndustrialGT_TE_0401120_A, 71.6
set_channel Sim_IndustrialGT_TE_0401120_B, 71.5
set_channel Sim_IndustrialGT_TE_0401130_A, 72.4
set_channel Sim_IndustrialGT_TE_0401130_B, 71.1
set_channel Sim_IndustrialGT_TE_0401140_A, 70
set_channel Sim_IndustrialGT_TE_0401140_B, 69.6
set_channel Sim_IndustrialGT_TE_0401310_A, 64.3
set_channel Sim_IndustrialGT_TE_0401310_B, 65.9
set_channel Sim_IndustrialGT_TE_0401320_A, 75.6
set_channel Sim_IndustrialGT_TE_0401320_B, 72.8
set_channel Sim_IndustrialGT_TE_0401330_A, 67.2
set_channel Sim_IndustrialGT_TE_0401330_B, 65.3
set_channel Sim_IndustrialGT_TE_0401340_A, 67.8
set_channel Sim_IndustrialGT_TE_0401340_B, 67.1


set_channel Sim_IndustrialGT_T_O_LG_in, 48.6
set_channel Sim_IndustrialGT_T_O_LG_out, 62.2
set_channel Sim_IndustrialGT_F_O_LG, 300.6


'delay 8
beep 1

set_channel Demo_IndustrialGT_GG_PT_Status, 21
result "Stabilizing - Minimum 5 minutes ...", REPORT & "Stabilization", BLACK
'delay 1
result "Stabilization completed", REPORT & "Stabilization", GREEN
'delay 1

set_channel Demo_IndustrialGT_GG_PT_Status, 22
'delay 1
do_fullset 1, "Thermodynamic measurement: N_GG5 N_PT3", "GG5_PT3"
result "A steady-state measurement has been taken automatically", REPORT & "Fullset", BLACK
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_GG_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_GG_ISO-fv_Demo_IndustrialGT_GG_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_PT_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_PT_ISO-fv_Demo_IndustrialGT_PT_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * Power ISO =" &fv_Demo_IndustrialGT_Pow_ISO &" kW", REPORT & "Fullset", BLUE
result "     * Efficiency ISO =" &fv_Demo_IndustrialGT_Eta_ISO &" %", REPORT & "Fullset", BLUE
result "     * T4 ISO =" &fv_Demo_IndustrialGT_T4_ISO &" degC", REPORT & "Fullset", BLUE
set_channel Demo_IndustrialGT_GG_PT_Status, 23
'delay 1
result "Thermodynamic measurement GG5_PT3 completed", REPORT & "Fullset", GREEN
result " ", REPORT
result " ", REPORT



'************************************ PT4 *************************************

note "Going to GG5_PT4"

set_channel Demo_IndustrialGT_GG_PT_Selector, 19
set_channel Demo_IndustrialGT_GG_PT_Status, 19

set_channel Demo_IndustrialGT_GG_Target_ISO, -88888
set_channel Demo_IndustrialGT_PT_Target_ISO, 12000
do_fullset 0
result "Going to GG speed ISO target = " &cv_Demo_IndustrialGT_GG_Target_ISO &" rpm and PT speed ISO target = " &cv_Demo_IndustrialGT_PT_Target_ISO &" rpm", REPORT & "Set Point", BLACK
'delay 1


result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_GG_Target &" rpm", REPORT & "Set Point", BLUE
result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_PT_Target &" rpm", REPORT & "Set Point", BLUE
set_channel Sim_IndustrialGT_N_GG, cv_Demo_IndustrialGT_GG_Target
set_channel Sim_IndustrialGT_N_PT, cv_Demo_IndustrialGT_PT_Target

set_channel Sim_IndustrialGT_N_GG, 13335
set_channel Sim_IndustrialGT_N_PT, 12226
set_channel Sim_IndustrialGT_N_Generator, 7701
set_channel Sim_IndustrialGT_T_M, 8415.8
set_channel Sim_IndustrialGT_ZI_0404030, -2.3
set_channel Sim_IndustrialGT_P_Baro, 1.0142
set_channel Sim_IndustrialGT_ME_0405690, 48.2
set_channel Sim_IndustrialGT_PDT_2210, -2.53
set_channel Sim_IndustrialGT_PDT_400X, 0.0582


set_channel Sim_IndustrialGT_TE_0404000_A, 25.4
set_channel Sim_IndustrialGT_TE_0404000_B, 25.1
set_channel Sim_IndustrialGT_PD_Inlet_A, -0.0094
set_channel Sim_IndustrialGT_PD_Inlet_B, -0.0102
set_channel Sim_IndustrialGT_PT_0404000, 0.0129
set_channel Sim_IndustrialGT_TE_0404900, 419.75
set_channel Sim_IndustrialGT_PT_0404900, 13.4433
set_channel Sim_IndustrialGT_TE_040461X, 699.725
set_channel Sim_IndustrialGT_PT_040460X, 2.21805
set_channel Sim_IndustrialGT_TE_0404650, 485.8375
set_channel Sim_IndustrialGT_PT_0404650, -0.00435
set_channel Sim_IndustrialGT_TT_040_2001, 33.7
set_channel Sim_IndustrialGT_PT_040_2001, 24.0629
set_channel Sim_IndustrialGT_FT_040_2001, 2298.5
set_channel Sim_IndustrialGT_T_O_in, 48.5
set_channel Sim_IndustrialGT_T_O_GG_fr_out, 61
set_channel Sim_IndustrialGT_T_O_GG_re_out, 81.2
set_channel Sim_IndustrialGT_T_O_PT_out, 76.5
set_channel Sim_IndustrialGT_P_O_GG_fr, 2.1825
set_channel Sim_IndustrialGT_P_O_GG_re, 2.0554
set_channel Sim_IndustrialGT_P_O_PT, 1.937
set_channel Sim_IndustrialGT_F_O_GG_fr, 228.1
set_channel Sim_IndustrialGT_F_O_GG_re, 48.3
set_channel Sim_IndustrialGT_F_O_PT, 178.6


set_channel Sim_IndustrialGT_TE_0401110_A, 85.2
set_channel Sim_IndustrialGT_TE_0401110_B, 88.2
set_channel Sim_IndustrialGT_TE_0401120_A, 71.5
set_channel Sim_IndustrialGT_TE_0401120_B, 71.5
set_channel Sim_IndustrialGT_TE_0401130_A, 72.2
set_channel Sim_IndustrialGT_TE_0401130_B, 71.1
set_channel Sim_IndustrialGT_TE_0401140_A, 69.8
set_channel Sim_IndustrialGT_TE_0401140_B, 69.5
set_channel Sim_IndustrialGT_TE_0401310_A, 66.6
set_channel Sim_IndustrialGT_TE_0401310_B, 68.1
set_channel Sim_IndustrialGT_TE_0401320_A, 77.9
set_channel Sim_IndustrialGT_TE_0401320_B, 75.3
set_channel Sim_IndustrialGT_TE_0401330_A, 70.7
set_channel Sim_IndustrialGT_TE_0401330_B, 68.7
set_channel Sim_IndustrialGT_TE_0401340_A, 68.5
set_channel Sim_IndustrialGT_TE_0401340_B, 67.8


set_channel Sim_IndustrialGT_T_O_LG_in, 48.7
set_channel Sim_IndustrialGT_T_O_LG_out, 64.7
set_channel Sim_IndustrialGT_F_O_LG, 302.5


'delay 8
beep 1

set_channel Demo_IndustrialGT_GG_PT_Status, 21
result "Stabilizing - Minimum 5 minutes ...", REPORT & "Stabilization", BLACK
'delay 1
result "Stabilization completed", REPORT & "Stabilization", GREEN
'delay 1

set_channel Demo_IndustrialGT_GG_PT_Status, 22
'delay 1
do_fullset 1, "Thermodynamic measurement: N_GG5 N_PT4", "GG5_PT4"
result "A steady-state measurement has been taken automatically", REPORT & "Fullset", BLACK
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_GG_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_GG_ISO-fv_Demo_IndustrialGT_GG_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_PT_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_PT_ISO-fv_Demo_IndustrialGT_PT_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * Power ISO =" &fv_Demo_IndustrialGT_Pow_ISO &" kW", REPORT & "Fullset", BLUE
result "     * Efficiency ISO =" &fv_Demo_IndustrialGT_Eta_ISO &" %", REPORT & "Fullset", BLUE
result "     * T4 ISO =" &fv_Demo_IndustrialGT_T4_ISO &" degC", REPORT & "Fullset", BLUE
set_channel Demo_IndustrialGT_GG_PT_Status, 23
'delay 1
result "Thermodynamic measurement GG5_PT4 completed", REPORT & "Fullset", GREEN
result " ", REPORT
result " ", REPORT



'************************************ PT5 *************************************

note "Going to GG5_PT5"

set_channel Demo_IndustrialGT_GG_PT_Selector, 20
set_channel Demo_IndustrialGT_GG_PT_Status, 20

set_channel Demo_IndustrialGT_GG_Target_ISO, -88888
set_channel Demo_IndustrialGT_PT_Target_ISO, 12600
do_fullset 0
result "Going to GG speed ISO target = " &cv_Demo_IndustrialGT_GG_Target_ISO &" rpm and PT speed ISO target = " &cv_Demo_IndustrialGT_PT_Target_ISO &" rpm", REPORT & "Set Point", BLACK
'delay 1

result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_GG_Target &" rpm", REPORT & "Set Point", BLUE
result "     * Estimated GG speed target = " &cv_Demo_IndustrialGT_PT_Target &" rpm", REPORT & "Set Point", BLUE
set_channel Sim_IndustrialGT_N_GG, cv_Demo_IndustrialGT_GG_Target
set_channel Sim_IndustrialGT_N_PT, cv_Demo_IndustrialGT_PT_Target


set_channel Sim_IndustrialGT_N_GG, 13334
set_channel Sim_IndustrialGT_N_PT, 12844
set_channel Sim_IndustrialGT_N_Generator, 8090
set_channel Sim_IndustrialGT_T_M, 7834.8
set_channel Sim_IndustrialGT_ZI_0404030, -2.1
set_channel Sim_IndustrialGT_P_Baro, 1.0141
set_channel Sim_IndustrialGT_ME_0405690, 45.3
set_channel Sim_IndustrialGT_PDT_2210, -2.55
set_channel Sim_IndustrialGT_PDT_400X, 0.0581


set_channel Sim_IndustrialGT_TE_0404000_A, 26.3
set_channel Sim_IndustrialGT_TE_0404000_B, 26
set_channel Sim_IndustrialGT_PD_Inlet_A, -0.0091
set_channel Sim_IndustrialGT_PD_Inlet_B, -0.0101
set_channel Sim_IndustrialGT_PT_0404000, 0.01275
set_channel Sim_IndustrialGT_TE_0404900, 420.45
set_channel Sim_IndustrialGT_PT_0404900, 13.3839
set_channel Sim_IndustrialGT_TE_040461X, 696.933333333333
set_channel Sim_IndustrialGT_PT_040460X, 2.1938
set_channel Sim_IndustrialGT_TE_0404650, 485.48125
set_channel Sim_IndustrialGT_PT_0404650, -0.00445
set_channel Sim_IndustrialGT_TT_040_2001, 33.8
set_channel Sim_IndustrialGT_PT_040_2001, 24.0802
set_channel Sim_IndustrialGT_FT_040_2001, 2274.2
set_channel Sim_IndustrialGT_T_O_in, 49.5
set_channel Sim_IndustrialGT_T_O_GG_fr_out, 61.6
set_channel Sim_IndustrialGT_T_O_GG_re_out, 81.8
set_channel Sim_IndustrialGT_T_O_PT_out, 78.3
set_channel Sim_IndustrialGT_P_O_GG_fr, 2.1687
set_channel Sim_IndustrialGT_P_O_GG_re, 2.0501
set_channel Sim_IndustrialGT_P_O_PT, 1.9256
set_channel Sim_IndustrialGT_F_O_GG_fr, 227.8
set_channel Sim_IndustrialGT_F_O_GG_re, 48.2
set_channel Sim_IndustrialGT_F_O_PT, 178.8


set_channel Sim_IndustrialGT_TE_0401110_A, 85.6
set_channel Sim_IndustrialGT_TE_0401110_B, 88.5
set_channel Sim_IndustrialGT_TE_0401120_A, 72.1
set_channel Sim_IndustrialGT_TE_0401120_B, 72.1
set_channel Sim_IndustrialGT_TE_0401130_A, 73
set_channel Sim_IndustrialGT_TE_0401130_B, 71.8
set_channel Sim_IndustrialGT_TE_0401140_A, 70.4
set_channel Sim_IndustrialGT_TE_0401140_B, 70.2
set_channel Sim_IndustrialGT_TE_0401310_A, 68.3
set_channel Sim_IndustrialGT_TE_0401310_B, 69.8
set_channel Sim_IndustrialGT_TE_0401320_A, 79.5
set_channel Sim_IndustrialGT_TE_0401320_B, 77.1
set_channel Sim_IndustrialGT_TE_0401330_A, 73.3
set_channel Sim_IndustrialGT_TE_0401330_B, 71.3
set_channel Sim_IndustrialGT_TE_0401340_A, 70.5
set_channel Sim_IndustrialGT_TE_0401340_B, 69.4


set_channel Sim_IndustrialGT_T_O_LG_in, 49.7
set_channel Sim_IndustrialGT_T_O_LG_out, 67
set_channel Sim_IndustrialGT_F_O_LG, 303.3


'delay 8
beep 1

set_channel Demo_IndustrialGT_GG_PT_Status, 21
result "Stabilizing - Minimum 5 minutes ...", REPORT & "Stabilization", BLACK
'delay 1
result "Stabilization completed", REPORT & "Stabilization", GREEN
'delay 1

set_channel Demo_IndustrialGT_GG_PT_Status, 22
'delay 1
do_fullset 1, "Thermodynamic measurement: N_GG5 N_PT5", "GG5_PT5"
result "A steady-state measurement has been taken automatically", REPORT & "Fullset", BLACK
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_GG_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_GG_ISO-fv_Demo_IndustrialGT_GG_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * GG speed ISO =" &fv_Demo_IndustrialGT_N_PT_ISO &" rpm", REPORT & "Fullset", BLUE
result "         ** GG target offset =" &FormatNumber(fv_Demo_IndustrialGT_N_PT_ISO-fv_Demo_IndustrialGT_PT_Target_ISO,0) & " rpm", REPORT & "Fullset", RED
result "     * Power ISO =" &fv_Demo_IndustrialGT_Pow_ISO &" kW", REPORT & "Fullset", BLUE
result "     * Efficiency ISO =" &fv_Demo_IndustrialGT_Eta_ISO &" %", REPORT & "Fullset", BLUE
result "     * T4 ISO =" &fv_Demo_IndustrialGT_T4_ISO &" degC", REPORT & "Fullset", BLUE
set_channel Demo_IndustrialGT_GG_PT_Status, 23
'delay 1
result "Thermodynamic measurement GG5_PT5 completed", REPORT & "Fullset", GREEN
result " ", REPORT
result " ", REPORT
result " *** All GG5 measurements have been completed ***", REPORT & "Fullset", GREEN
result " ", REPORT
result " ", REPORT



' *********************************************************************
' ******************** REINI ********************
' *********************************************************************

note "Reinitialization"

result " ***** THERMODYNAMIC VERIFICATION TEST has been completed *****", REPORT & "Fullset", RED

set_channel Demo_IndustrialGT_GG_PT_Selector, 0
set_channel Demo_IndustrialGT_GG_PT_Status, 0

set_channel Demo_IndustrialGT_GG_Target_ISO, -88888
set_channel Demo_IndustrialGT_PT_Target_ISO, -88888

set_channel Sim_IndustrialGT_N_GG, 11000
set_channel Sim_IndustrialGT_N_PT, 5500
set_channel Sim_IndustrialGT_N_Generator, 3816
set_channel Sim_IndustrialGT_T_M, 8000
set_channel Sim_IndustrialGT_ZI_0404030, 14
set_channel Sim_IndustrialGT_P_Baro, 1.0155
set_channel Sim_IndustrialGT_ME_0405690, 64
set_channel Sim_IndustrialGT_PDT_2210, -1.3
set_channel Sim_IndustrialGT_PDT_400X, 0.0272
'set_channel Sim_IndustrialGT_TE_400X, 21
set_channel Sim_IndustrialGT_TE_0404000_A, 21.6
set_channel Sim_IndustrialGT_TE_0404000_B, 21.4
set_channel Sim_IndustrialGT_PD_Inlet_A, -0.0047
set_channel Sim_IndustrialGT_PD_Inlet_B, -0.0052
set_channel Sim_IndustrialGT_PT_0404000, 0.00645
set_channel Sim_IndustrialGT_TE_0404900, 320.9
set_channel Sim_IndustrialGT_PT_0404900, 7.91
set_channel Sim_IndustrialGT_TE_040461X, 539.666666666667
set_channel Sim_IndustrialGT_PT_040460X, 1.1304
set_channel Sim_IndustrialGT_TE_0404650, 421.38125
set_channel Sim_IndustrialGT_PT_0404650, -0.00265
set_channel Sim_IndustrialGT_TT_040_2001, 20
set_channel Sim_IndustrialGT_PT_040_2001, 23
set_channel Sim_IndustrialGT_FT_040_2001, 1000
set_channel Sim_IndustrialGT_T_O_in, 41.6
set_channel Sim_IndustrialGT_T_O_GG_fr_out, 50.7
set_channel Sim_IndustrialGT_T_O_GG_re_out, 63
set_channel Sim_IndustrialGT_T_O_PT_out, 54.4
set_channel Sim_IndustrialGT_P_O_GG_fr, 2.3329
set_channel Sim_IndustrialGT_P_O_GG_re, 2.1272
set_channel Sim_IndustrialGT_P_O_PT, 2.0498
set_channel Sim_IndustrialGT_F_O_GG_fr, 233.5
set_channel Sim_IndustrialGT_F_O_GG_re, 49.9
set_channel Sim_IndustrialGT_F_O_PT, 181.7
'set_channel Sim_IndustrialGT_VE_0401060_X, 21
'set_channel Sim_IndustrialGT_VE_0401060_Y, 19
'set_channel Sim_IndustrialGT_VE_0401061_X, 15
'set_channel Sim_IndustrialGT_VE_0401061_Y, 13
'set_channel Sim_IndustrialGT_VE_0401260_X, 11
'set_channel Sim_IndustrialGT_VE_0401260_Y, 11
'set_channel Sim_IndustrialGT_VE_0401261_X, 13
'set_channel Sim_IndustrialGT_VE_0401261_Y, 12
'set_channel Sim_IndustrialGT_ZE_0401050_A, 0.04
'set_channel Sim_IndustrialGT_ZE_0401050_B, 0.04
'set_channel Sim_IndustrialGT_ZE_0401250_A, -0.01
'set_channel Sim_IndustrialGT_ZE_0401250_B, -0.03
set_channel Sim_IndustrialGT_TE_0401110_A, 79.2
set_channel Sim_IndustrialGT_TE_0401110_B, 81.9
set_channel Sim_IndustrialGT_TE_0401120_A, 63.6
set_channel Sim_IndustrialGT_TE_0401120_B, 63.2
set_channel Sim_IndustrialGT_TE_0401130_A, 61.8
set_channel Sim_IndustrialGT_TE_0401130_B, 61.3
set_channel Sim_IndustrialGT_TE_0401140_A, 56.3
set_channel Sim_IndustrialGT_TE_0401140_B, 57.3
set_channel Sim_IndustrialGT_TE_0401310_A, 50.7
set_channel Sim_IndustrialGT_TE_0401310_B, 52.1
set_channel Sim_IndustrialGT_TE_0401320_A, 58.7
set_channel Sim_IndustrialGT_TE_0401320_B, 56.9
set_channel Sim_IndustrialGT_TE_0401330_A, 49.3
set_channel Sim_IndustrialGT_TE_0401330_B, 48.8
set_channel Sim_IndustrialGT_TE_0401340_A, 51.7
set_channel Sim_IndustrialGT_TE_0401340_B, 50.9
'set_channel Sim_IndustrialGT_VE_9001000_X, 26
'set_channel Sim_IndustrialGT_VE_9001000_Y, 22
set_channel Sim_IndustrialGT_T_O_LG_in, 41.9
set_channel Sim_IndustrialGT_T_O_LG_out, 46.9
set_channel Sim_IndustrialGT_F_O_LG, 287.4

stop_log "Demo_Report"
result "A Transient Log recording the speeds has been stopped", REPORT & "Log", BLACK