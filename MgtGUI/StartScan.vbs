'******************************************************************************
'* RTEStartScan.vbs
'******************************************************************************
'*  AUTHOR: Fereshteh Mahvarsayyad
'*
'*  DESCRIPTION:
'*    This script launches the specied Displays on the specifed Pcs
'*
'*  DATE: 30-Sep-03 6:02:03 PM
'*
'*  NOTE:
'*    1) This script accepts the user name and password to pass to the Real Time
'*    Display(s).
'*
'*    2) To launch the Alarm Summary Display, set the "StartAlarmSumDisp" variable
'*    to true; otherwise false
'*
'*    3) Update the "AlarmSumDispPC" variable, to name the Pc where the
'*    Alarm Summary Disply is to be started. This variable shall match the variable
'*    with the same name in the "RTEStopScan.vbs".
'*
'*    4) To launch the ARINC Display, set the "StartArincDisp" variable
'*    to true; otherwise false
'*
'*    5) Update the "ARINCDispPC" variable, to name the Pc where the
'*    ARINC Disply is to be started. This variable shall match the variable
'*    with the same name in the "RTEStopScan.vbs".
'*
'*    6) To launch the Real Time Display(s), set the "StartRTD" variable
'*    to true; otherwise false
'*
'*    7) Update the "RTDPCNames" variable to list the name of the Pcs where the
'*    Real Time Displys are to be started. PC names shall be separated by comma
'*    with no space.
'*
'*    8) The "RTDPCNames" shall match the variable with the same name in the
'*    "RTEStopScan.vbs" file.
'*
'*
'*  MODIFICATIONS:
'*    DATE         REV     INITIALS  DESCRIPTION
'*    ----------   -----   --------  --------------------------------------------------
'*    08-DEC-03            FM        Added Error handling
'*    23-FEB-04            FM        Retrieve possible command line arguments
'*                                   (cf. NCR# 11476)
'*    07-FEB-07            TPS       Cleaned up the RTD Driver code
'*    10-JAN-20            JOA       Fixed script to start multi RTD Driver instance (wrong "if" logic). Cleaned up code and indentation. Added verbosity.
'******************************************************************************



Option Explicit

'On Error Resume Next

Dim StartRTD
Dim RTDPCNames

Dim StartAlarmSumDisp
Dim AlarmSumDispPC
Dim StartInfoSumDisp
Dim InfoSumDispPC
Dim StartArincDisp
Dim ARINCDispPC
Dim RTDDriver
Dim Errors

Dim MgtGUI_Monitor1, MgtGUI_Monitor2, MgtGUI_Monitor3, MgtGUI_Monitor4
Dim RTD1_Monitor1, RTD1_Monitor2, RTD1_Monitor3, RTD1_Monitor4
Dim RTD2_Monitor1, RTD2_Monitor2, RTD2_Monitor3, RTD2_Monitor4
Dim RTD3_Monitor1, RTD3_Monitor2, RTD3_Monitor3, RTD3_Monitor4
Dim RTD4_Monitor1, RTD4_Monitor2, RTD4_Monitor3, RTD4_Monitor4
Dim RTD5_Monitor1, RTD5_Monitor2, RTD5_Monitor3, RTD5_Monitor4
Dim RTD6_Monitor1, RTD6_Monitor2, RTD6_Monitor3, RTD6_Monitor4

Dim ViewObj

'Command line parameters
Dim argHostName
Dim argServiceName
Dim argUserName
Dim argPassword
Dim argTestCell
Dim argEngineType
Dim argSerialNumber
Dim argTestID
Dim argEngStandard
Dim argCustomer
Dim argSubSystems
Dim arrSubSystems
Dim objCommands



'/////////////////////// SECTION TO BE UPDATED FOR EVERY PROJECT //////////////////////

AlarmSumDispPC = "prodasmgt"
InfoSumDispPC = "prodasmgt"
ARINCDispPC    = ""
'RTDPCNames     = "prodasmgt,prodasrtd1"
RTDPCNames     = "prodasrtd1"

StartRTD          = TRUE

 '////////////////////// END SECTION  ///////////////////////////////////////////////



'******************************************************************************
'*** Sub GetStartupPages() Sets up startup pages per engine
'******************************************************************************
Sub GetStartupPages()

'/////////////////////// SECTION TO BE UPDATED FOR EVERY PROJECT //////////////////////

if argEngineType = "ATP_Calibration" Then

' MgtGUI	
	MgtGUI_Monitor1		= "1_DAS_Control.v"
	MgtGUI_Monitor2		= "2_Simulations2.v"
	MgtGUI_Monitor3		= "2_Alarms.v"
	MgtGUI_Monitor4		= "2_Calculations.v"

' RTD #1	
	RTD1_Monitor1		= "1_DAS_Control.v"
	RTD1_Monitor2		= "2_Simulations2.v"
	RTD1_Monitor3		= "2_Alarms.v"
	RTD1_Monitor4		= "2_Calculations.v"

' RTD #2		
	RTD2_Monitor1		= "2_Conversion_DecHexBin.v"
	RTD2_Monitor2		= "2_Conversion_DecHexBin.v"
	RTD2_Monitor3		= "2_Languages.v"
	RTD2_Monitor4		= "2_Polar.v"
		
' RTD #3		
	RTD3_Monitor1		= "2_Profile_Plot.v"
	RTD3_Monitor2		= "2_Simulations_32Channels.v"
	RTD3_Monitor3		= "1_DAS_Control.v"
	RTD3_Monitor4		= "1_DAS_Control.v"
		
' RTD #4		
	RTD4_Monitor1		= "1_DAS_Control.v"
	RTD4_Monitor2		= "1_DAS_Control.v"
	RTD4_Monitor3		= "1_DAS_Control.v"
	RTD4_Monitor4		= "1_DAS_Control.v"
		
' RTD #5		
	RTD5_Monitor1		= "1_DAS_Control.v"
	RTD5_Monitor2		= "1_DAS_Control.v"
	RTD5_Monitor3		= "1_DAS_Control.v"
	RTD5_Monitor4		= "1_DAS_Control.v"
		
' RTD #6		
	RTD6_Monitor1		= "1_DAS_Control.v"
	RTD6_Monitor2		= "1_DAS_Control.v"
	RTD6_Monitor3		= "1_DAS_Control.v"
	RTD6_Monitor4		= "1_DAS_Control.v"

Elseif argEngineType = "X115C" Then

' MgtGUI	
	MgtGUI_Monitor1		= "1_DAS_Control.v"
	MgtGUI_Monitor2		= "2_Simulations2.v"
	MgtGUI_Monitor3		= "3_CompressorMap_Panel.v"
	MgtGUI_Monitor4		= "4_JetEngine_MainPage.v"

' RTD #1
	RTD1_Monitor1		= "1_DAS_Control.v"
	RTD1_Monitor2		= "2_Simulations2.v"
	RTD1_Monitor3		= "3_CompressorMap_Panel.v"
	RTD1_Monitor4		= "4_JetEngine_MainPage.v"
		
' RTD #2
	RTD2_Monitor1		= "4_JetEngine_Picture.v"
	RTD2_Monitor2		= "5_Bellmouth_Mass_Flow.v"
	RTD2_Monitor3		= "6_GasTurbine_Mechanical_Verif.v"
	RTD2_Monitor4		= "6_GasTurbine_Picture.v"
		
' RTD #3
	RTD3_Monitor1		= "6_GasTurbine_Speed_Targets.v"
	RTD3_Monitor2		= "1_DAS_Control.v"
	RTD3_Monitor3		= "1_DAS_Control.v"
	RTD3_Monitor4		= "1_DAS_Control.v"
		
' RTD #4
	RTD4_Monitor1		= "1_DAS_Control.v"
	RTD4_Monitor2		= "1_DAS_Control.v"
	RTD4_Monitor3		= "1_DAS_Control.v"
	RTD4_Monitor4		= "1_DAS_Control.v"
		
' RTD #5
	RTD5_Monitor1		= "1_DAS_Control.v"
	RTD5_Monitor2		= "1_DAS_Control.v"
	RTD5_Monitor3		= "1_DAS_Control.v"
	RTD5_Monitor4		= "1_DAS_Control.v"
		
' RTD #6
	RTD6_Monitor1		= "1_DAS_Control.v"
	RTD6_Monitor2		= "1_DAS_Control.v"
	RTD6_Monitor3		= "1_DAS_Control.v"
	RTD6_Monitor4		= "1_DAS_Control.v"
End If

'////////////////////// END SECTION  ///////////////////////////////////////////////

End Sub



'******************************************************************************
'*** 1. Retrieve the arguments
'******************************************************************************
argHostName       = GetArg ("HostName")
argServiceName    = GetArg ("Servicename")
argUserName       = GetArg ("UserName")
argPassword       = GetArg ("Password")
argTestCell       = GetArg ("Testcellid")
argEngineType     = GetArg ("EngineType")
argSerialNumber   = GetArg ("Serialnumber")
argTestID         = GetArg ("Testid")
argEngStandard    = GetArg ("EngineStandard")
argCustomer       = GetArg ("Customer")
argSubSystems     = GetArg ("subsystem")
arrSubSystems     = Split (argSubSystems, ",")


StartAlarmSumDisp = IsSubSystemOnline("LIMIT_ACTION")
StartInfoSumDisp = IsSubSystemOnline("LIMIT_ACTION_INFO")
StartArincDisp = IsSubSystemOnline("ARINC")



'******************************************************************************
'**** 2. Start Alarm Summary Display
'******************************************************************************
If StartAlarmSumDisp Then
    Err.Number = 0
    Set objCommands = CreateObject("ALARMSUMSERVER.Commands", AlarmSumDispPC)
    If Err.Number <> 0 Then
        MsgBox "Failed to create the Alarm Summary Display on '" & AlarmSumDispPC & "' : " & Err.Number
        Err.Number = 0
    Else
        objCommands.Start
        Set objCommands = Nothing
    End If
End If



'******************************************************************************
'**** 2.5. Start Info Summary Display
'******************************************************************************
If StartInfoSumDisp Then
    Err.Number = 0
    Set objCommands = CreateObject("ALARMSUMSERVER2.Commands", InfoSumDispPC)
    If Err.Number <> 0 Then
        MsgBox "Failed to create the Info Summary Display on '" & InfoSumDispPC & "' : " & Err.Number
        Err.Number = 0
    Else
        objCommands.Start
        Set objCommands = Nothing
    End If
End If



'******************************************************************************
'**** 3. Start ARINC Display
'******************************************************************************
If StartArincDisp Then
    Err.Number = 0
    Set objCommands = CreateObject("ARINCDISPLAYSERVER.Commands", ARINCDispPC )
    If Err.Number <> 0 Then
        MsgBox "Failed to create the ARINC Display on '" & ARINCDispPC & "' : " & Err.Number
        Err.Number = 0
    Else
        objCommands.Start
        Set objCommands = Nothing
    End If
End If



'******************************************************************************
'**** 4. Start Real Time Display
'******************************************************************************
If StartRTD Then
    GetStartupPages
    Err.Number = 0

    dim arrPCNames
    arrPCNames = split (RTDPCNames, ",")

    dim PCcount    ' the current number of PCs on which the app is to be started
    PCcount = UBound (arrPCNames)

    Dim i
    For i = 0 To PCcount
    'Required step - this will make VB Script interpreter not blow up on re-assigment of the
    'variable
    Set ViewObj = Nothing
    Set RTDDriver = Nothing
    Err.Number = 0

    If arrPCNames(i) = "" Then
        Set RTDDriver = CreateObject("proDAS.RTDDriver")

        If Err.Number <> 0 Then
            MsgBox "Failed to create the RTD Driver on the local computer: " & Err.Number
            Err.Number = 0
        End If
    Else
	
'/////////////////////// SECTION TO BE UPDATED FOR EVERY PROJECT //////////////////////
	
       'First RTD Driver instance - ALL Computers in RTDPCNames
			Set RTDDriver = CreateObject ("proDAS.RTDDriver", arrPCNames (i))
			'ERR.NUMBER = 438 must be ok return code?
			If Err.Number <> 0  And Err.Number <> 438 Then
				MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
				Err.Number = 0
			Else
				StartRtdDriver i, 0
			End If


       'Second RTD Driver instance - ALL Computers in RTDPCNames
			Set RTDDriver = CreateObject ("proDAS.RTDDriver2", arrPCNames (i))
			'ERR.NUMBER = 438 must be ok return code?
			If Err.Number <> 0  And Err.Number <> 438 Then
				MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
				Err.Number = 0
			Else
				StartRtdDriver i, 1
			End If


       ' 'Third RTD Driver instance - ALL Computers in RTDPCNames
			' Set RTDDriver = CreateObject ("proDAS.RTDDriver3", arrPCNames (i))
			' 'ERR.NUMBER = 438 must be ok return code?
			' If Err.Number <> 0  And Err.Number <> 438 Then
				' MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
				' Err.Number = 0
			' Else
				' StartRtdDriver i, 2
			' End If

			
       ' 'Third RTD Driver instance - SELECTOR for RTD #2, RTD #4, RTD #7
		' If i = 1 OR i = 3 OR i = 6 Then 
			' Set RTDDriver = CreateObject ("proDAS.RTDDriver3", arrPCNames (i))
			' 'ERR.NUMBER = 438 must be ok return code?
			' If Err.Number <> 0  And Err.Number <> 438 Then
				' MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
				' Err.Number = 0
			' Else
				' StartRtdDriver i, 2
			' End If
		' End If
		
		
       ' 'Fourth RTD Driver instance - ALL Computers in RTDPCNames
			' Set RTDDriver = CreateObject ("proDAS.RTDDriver3", arrPCNames (i))
			' 'ERR.NUMBER = 438 must be ok return code?
			' If Err.Number <> 0  And Err.Number <> 438 Then
				' MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
				' Err.Number = 0
			' Else
				' StartRtdDriver i, 3
			' End If

			
       ' 'Fourth RTD Driver instance - SELECTOR for RTD #4 and RTD #7
		' If i = 3 OR i = 6 Then 
			' Set RTDDriver = CreateObject ("proDAS.RTDDriver3", arrPCNames (i))
			' 'ERR.NUMBER = 438 must be ok return code?
			' If Err.Number <> 0  And Err.Number <> 438 Then
				' MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
				' Err.Number = 0
			' Else
				' StartRtdDriver i, 3
			' End If
		' End If

 '////////////////////// END SECTION  ///////////////////////////////////////////////
      
     End If

    Next
End If



'******************************************************************************
'**  Start the RTD Driver
'******************************************************************************
Sub StartRtdDriver (i, j)

  set Errors = RTDDriver.Errors
  CheckErrors i

  'If argUserName = "" Then
    'argusername = "sl5"
  'End If
  'If argPassword = "" Then
    'argPassword = "sl5sl5"
  'End If

  RTDDriver.Login Trim (argUserName), Trim (argPassword)
  CheckErrors i 
	    
  Set ViewObj = RTDDriver.CreateView("View 0")

  If Err.Number <> 0  And Err.Number <> 438 Then
    MsgBox "Failed to create view for the RTD Driver on '" & arrPCNames(i) &"': "+Err.Description
    Err.Number = 0
  Else
	Select Case i
	
'/////////////////////// SECTION TO BE UPDATED FOR EVERY PROJECT //////////////////////


'MgtGUI
Case 0
	' Select Case j
		' 'Monitor #1 of MgtGUI
		' Case 0
			' ViewObj.PageName = MgtGUI_Monitor1
			' ViewObj.SetPosition 0, 0, 1920, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #2 of MgtGUI
		' Case 1
			' ViewObj.PageName = MgtGUI_Monitor2
			' ViewObj.SetPosition 1920, 0, 3840, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
	' End Select

'RTD #1
Case 1
	Select Case j
		'Monitor #1 of RTD #1
		Case 0
			ViewObj.PageName = RTD1_Monitor1
			ViewObj.SetPosition 0, 0, 1920, 1200
			WScript.Sleep 1000	    
			ViewObj.Reload
		'Monitor #2 of RTD #1
		Case 1
			ViewObj.PageName = RTD1_Monitor2
			ViewObj.SetPosition 1920, 0, 3840, 1200
			WScript.Sleep 1000	    
			ViewObj.Reload
		' 'Monitor #3 of RTD #1
		' Case 2
			' ViewObj.PageName = RTD1_Monitor3
			' ViewObj.SetPosition 1920, 0, 3840, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #4 of RTD #1
		' Case 3
			' ViewObj.PageName = RTD1_Monitor4
			' ViewObj.SetPosition 1920, 0, 3840, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
	End Select
	
' 'RTD #2
' Case 2
	' Select Case j
		' 'Monitor #1 of RTD #2
		' Case 0
			' ViewObj.PageName = RTD2_Monitor1
			' ViewObj.SetPosition 0, 0, 1920, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #2 of RTD #2
		' Case 1
			' ViewObj.PageName = RTD2_Monitor2
			' ViewObj.SetPosition 1920, 0, 3840, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #3 of RTD #2
		' Case 2
			' ViewObj.PageName = RTD2_Monitor3
			' ViewObj.SetPosition 3840, 0, 5760, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #4 of RTD #2
		' Case 3
			' ViewObj.PageName = RTD2_Monitor4
			' ViewObj.SetPosition 5760, 0, 7680, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
	' End Select
	
           
' 'RTD #3
' Case 3
	' Select Case j
		' 'Monitor #1 of RTD #3
		' Case 0
			' ViewObj.PageName = RTD3_Monitor1
			' ViewObj.SetPosition 0, 0, 1920, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #2 of RTD #3
		' Case 1
			' ViewObj.PageName = RTD3_Monitor2
			' ViewObj.SetPosition 1920, 0, 3840, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #3 of RTD #3
		' Case 2
			' ViewObj.PageName = RTD3_Monitor3
			' ViewObj.SetPosition 3840, 0, 5760, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #4 of RTD #3
		' Case 3
			' ViewObj.PageName = RTD3_Monitor4
			' ViewObj.SetPosition 5760, 0, 7680, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
	' End Select
	
' 'RTD #4
' Case 4
	' Select Case j
		' 'Monitor #1 of RTD #4
		' Case 0
			' ViewObj.PageName = RTD4_Monitor1
			' ViewObj.SetPosition 0, 0, 1920, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #2 of RTD #4
		' Case 1
			' ViewObj.PageName = RTD4_Monitor2
			' ViewObj.SetPosition 1920, 0, 3840, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #3 of RTD #4
		' Case 2
			' ViewObj.PageName = RTD4_Monitor3
			' ViewObj.SetPosition 3840, 0, 5760, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #4 of RTD #4
		' Case 3
			' ViewObj.PageName = RTD4_Monitor4
			' ViewObj.SetPosition 5760, 0, 7680, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
	' End Select
	
' 'RTD #5
' Case 5
	' Select Case j
		' 'Monitor #1 of RTD #5
		' Case 0
			' ViewObj.PageName = RTD5_Monitor1
			' ViewObj.SetPosition 0, 0, 1920, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #2 of RTD #5
		' Case 1
			' ViewObj.PageName = RTD5_Monitor2
			' ViewObj.SetPosition 1920, 0, 3840, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #3 of RTD #5
		' Case 2
			' ViewObj.PageName = RTD5_Monitor3
			' ViewObj.SetPosition 3840, 0, 5760, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #4 of RTD #5
		' Case 3
			' ViewObj.PageName = RTD5_Monitor4
			' ViewObj.SetPosition 5760, 0, 7680, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
	' End Select
	
' 'RTD #6
' Case 6
	' Select Case j
		' 'Monitor #1 of RTD #6
		' Case 0
			' ViewObj.PageName = RTD6_Monitor1
			' ViewObj.SetPosition 0, 0, 1920, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #2 of RTD #6
		' Case 1
			' ViewObj.PageName = RTD6_Monitor2
			' ViewObj.SetPosition 1920, 0, 3840, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #3 of RTD #6
		' Case 2
			' ViewObj.PageName = RTD6_Monitor3
			' ViewObj.SetPosition 3840, 0, 5760, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
		' 'Monitor #4 of RTD #6
		' Case 3
			' ViewObj.PageName = RTD6_Monitor4
			' ViewObj.SetPosition 5760, 0, 7680, 1200
			' WScript.Sleep 1000	    
			' ViewObj.Reload
	' End Select
                                	

 '////////////////////// END SECTION  ///////////////////////////////////////////////
  
    End Select
    CheckErrors i

    Set ViewObj = Nothing
  End If
  Set RTDDriver = Nothing
End Sub



'******************************************************************************
'**  check for errors and notify the user, if appropriate
'******************************************************************************
Sub CheckErrors (i)
    If ( Errors.LastCallHasFailed ) Then
        Dim msg
        msg = "The following error was encountered for the RTD Driver on " & arrPCNames(i)
        Do Until Errors.IsEmpty
            msg = msg & vbNewLine & Errors.Message
        Loop
    End If
End Sub



'******************************************************************************
'**** Function GetArg()
'******************************************************************************
Function GetArg (Flag)
    dim retVal
    retVal = ""
    Flag = UCase (Flag)
    Dim args
    Set args = WScript.Arguments

    If args.Count > 0 Then
        For i=0 to args.Count-1
            If UCase( args(i) ) = "/" + Flag  Then
                retVal = args(i+1)
                Exit For
            End If
        Next
    End if
    GetArg = retVal
End Function



'******************************************************************************
'**** Function IsSubSystemOnline()
'******************************************************************************
Function IsSubSystemOnline(SubSystemName)
    on error resume Next
    Dim retVal
    retVal = False

    Dim lb
    Dim ub

    lb = lbound(arrSubSystems)
    ub = ubound(arrSubSystems)

    For i=lb to ub
        If InStr( UCase(arrSubSystems(i)), UCase(SubSystemName) ) > 0 Then
            retVal = True
            Exit For
        End If
    Next

    IsSubSystemOnline = retVal
End Function



'******************************************************************************
'**** Sub DumpArgs()
'**** Debugging tool
'******************************************************************************
Sub DumpArgs()
    Dim strDump

    strDump = "Arguments  Received from MGT GUI: "
    strDump =  strDump + "argHostName = " + argHostName
    strDump =  strDump + "; argServiceName = " + argServiceName
    strDump =  strDump + "; argUserName = " + argUserName
    strDump =  strDump + "; argPassword = " + argPassword
    strDump =  strDump + "; argTestCell = " + argTestCell
    strDump =  strDump + "; argEngineType = " + argEngineType
    strDump =  strDump + "; argSerialNumber = " + argSerialNumber
    strDump =  strDump + "; argTestID = " + argTestID
    strDump =  strDump + "; argEngStandard = " + argEngStandard
    strDump =  strDump + "; argCustomer = " + argCustomer
    strDump =  strDump + "; argSubSystems = " + argSubSystems
    MsgBox strDump
End Sub
'***************************DO NOT CHANGE**************************************