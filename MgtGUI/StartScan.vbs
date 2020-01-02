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

Dim StartupPage1, StartupPage2, StartupPage3, StartupPage4, StartupPage5, StartupPage6, StartupPage7, StartupPage8, StartupPage9
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


'***************************START CHANGE***************************************
AlarmSumDispPC = "mangtp5-mgt"
InfoSumDispPC = "mangtp5-mgt"
ARINCDispPC    = "mangtp5-mgt"
RTDPCNames     = "mangtp5-mgt"


StartRTD          = TRUE


'******************************************************************************
'*** Sub GetStartupPages() Sets up startup pages per engine
'******************************************************************************
Sub GetStartupPages()

    if argEngineType = "ATP_Calibration" Then
	StartupPage1      = "TestBevel.v"
	StartupPage2      = "Demo_RTD_Page2.v"
	StartupPage3      = "Demo_RTD_Page3.v"
	StartupPage4      = "Demo_RTD_Page4.v"
	StartupPage5      = "Demo_RTD_Page5.v"
	StartupPage6      = "Demo_RTD_Page6.v"
	StartupPage7      = "Demo_RTD_Page7.v"
	StartupPage8      = "Demo_RTD_Page8.v"
	StartupPage9      = "Demo_RTD_Page9.v"
    Elseif argEngineType = "RM12" Then
	StartupPage1      = "TestBevel.v"
	StartupPage2      = "Demo_RTD_Page5.v"
	StartupPage3      = "Demo_RTD_Page6.v"
	StartupPage4      = "Demo_RTD_Page8.v" 
    End If
 


End Sub

'***************************END CHANGE*****************************************


'***************************DO NOT CHANGE**************************************

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
       'First RTD Driver instance
	Set RTDDriver = CreateObject ("proDAS.RTDDriver", arrPCNames (i))
        'ERR.NUMBER = 438 must be ok return code?
        If Err.Number <> 0  And Err.Number <> 438 Then
            MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
            Err.Number = 0
        Else
          StartRtdDriver i, 0
        End If

       'Second RTD Driver instance
        If i > 3 Then 
            Set RTDDriver = CreateObject ("proDAS.RTDDriver2", arrPCNames (i))
            'ERR.NUMBER = 438 must be ok return code?
            If Err.Number <> 0  And Err.Number <> 438 Then
                MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
                Err.Number = 0
            Else
            StartRtdDriver i, 1
            End If
        End If


       'Third RTD Driver instance
        If i > 2 Then        
            Set RTDDriver = CreateObject ("proDAS.RTDDriver3", arrPCNames (i))
            'ERR.NUMBER = 438 must be ok return code?
            If Err.Number <> 0  And Err.Number <> 438 Then
                MsgBox "Failed to create the RTD Driver on '" & arrPCNames(i) & "': "+Err.Description
                Err.Number = 0
            Else
                StartRtdDriver i, 2
            End If
       End If
      
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
	    
  Set ViewObj = RTDDriver.CreateView("View0")

  If Err.Number <> 0  And Err.Number <> 438 Then
    MsgBox "Failed to create view for the RTD Driver on '" & arrPCNames(i) &"': "+Err.Description
    Err.Number = 0
  Else
    Select Case i

      Case 0
        Select Case j
          Case 0
            ViewObj.PageName = StartupPage1
            ViewObj.SetPosition 0, 0, 1920, 1080
			WScript.Sleep 1000	    
            ViewObj.Reload
          Case 1
            ViewObj.PageName = StartupPage2
            ViewObj.SetPosition 1920, 0, 3840, 1080
			WScript.Sleep 1000	    
            ViewObj.Reload
		  Case 2
            ViewObj.PageName = StartupPage3
            ViewObj.SetPosition 3840, 0, 5760, 1080
			WScript.Sleep 1000	    
            ViewObj.Reload
 
        End Select

      

      Case 1
        Select Case j
          Case 0
            ViewObj.PageName = StartupPage5
            ViewObj.SetPosition 0, 0, 1920, 1080
          Case 1
            ViewObj.PageName = StartupPage6
            ViewObj.SetPosition 1920, 0, 3840, 1080
 	  Case 2
            ViewObj.PageName = StartupPage1
            ViewObj.SetPosition 3840, 0, 5760, 1080
 
        End Select

      Case 2
         Select Case j
          Case 0
            ViewObj.PageName = StartupPage9
            ViewObj.SetPosition 0, 0, 1920, 1080
          Case 1
            ViewObj.PageName = StartupPage5
            ViewObj.SetPosition -1920, 0, 0, 1080
            'ViewObj.SetPosition 0, 0, 1920, 1080
          
        End Select
      
      Case 3
        Select Case j
          Case 0
            ViewObj.PageName = StartupPage1
            ViewObj.SetPosition 0, 0, 1920, 1080
          
          
        End Select

                
       
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