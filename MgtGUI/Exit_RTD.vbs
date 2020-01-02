'******************************************************************************
'* RTEStopScan.vbs
'******************************************************************************
'*  AUTHOR: Fereshteh Mahvarsayyad
'*
'*  DESCRIPTION:
'*    This script stops Alarm Summary, ARINC Display, and the Real Time Display(s)
'*    on the specied Pcs
'*
'*  DATE: 31-Sep-03 8:31:03 AM
'*
'*  NOTE:
'*    1) Update the "AlarmSumDispPC" variable, to name the Pc where the
'*    Alarm Summary Disply is to be stoped. This variable shall match the variable
'*    with the same name in the "RTEStartScan.vbs"
'*
'*    5) Update the "ARINCDispPC" variable, to name the Pc where the
'*    ARINC Disply is to be stoped. This variable shall match the variable
'*    with the same name in the "RTEStartScan.vbs".
'*
'*    6) Update the "RTDPCNames" variable to list the name of the Pcs where the
'*    Real Time Disply(s) are to be stoped. PC names shall be separated by comma
'*    with no space
'*
'*    7) The "RTDPCNames" shall match the variable with the same name in the
'*    "RTEStartScan.vbs" file.
'*
'*
'*  MODIFICATIONS:
'*    DATE         REV     INITIALS  DESCRIPTION
'*    ----------   -----   --------  --------------------------------------------------
'*    08-DEC-03            FM        Added Error handling
'*    26-APR-07    V2.01   DP        Moved startup of ARINC to RTD1
'******************************************************************************

Option Explicit

'On Error Resume Next

Dim RTDPCNames


'***************************START CHANGE***************************************

RTDPCNames     = "mgthost"

'***************************END CHANGE*****************************************



'***************************DO NOT CHANGE**************************************


'*******************************************************
'**** 4. Stop Real Time Display
'*******************************************************
dim arrPCNames
arrPCNames = split (RTDPCNames, ",")

dim PCcount    ' the current number of PCs on which the app is to be started
PCcount = ubound (arrPCNames)

' terminate the app on the given computers
const Force = TRUE   ' enforce termination even if other clients still hold a connection

dim i
dim RTDDriver
dim Errors

For i = 0 to PCcount
   Err.Clear
   If arrPCNames(i) = "" Then
      Set RTDDriver = CreateObject("proDAS.RTDDriver")          ' local
      If Err.Number <> 0 Then
         MsgBox "Failed to stop the RTD Driver on the local computer: "+Err.Description
         Err.Number = 0
      End If
      StopRtdDriver
   Else
      'First RTD Driver instance
      set RTDDriver = CreateObject ("proDAS.RTDDriver", arrPCNames(i)) ' remote
      If Err.Number <> 0 Then
         MsgBox "Failed to stop the RTD Driver on '"+arrPCNames(i)+"': "+Err.Description
         Err.Number = 0
      End If
      StopRtdDriver

   End If

next
'delay 5

'*******************************************************
'**  Stop the RTDDriver
'*******************************************************
sub StopRtdDriver
  set Errors = RTDDriver.Errors
  CheckErrors
  set Errors = Nothing

  RTDDriver.Terminate Force
  set RTDDriver = Nothing
end sub

'*******************************************************
'**  check for errors and notify the user, if appropriate
'*******************************************************

sub CheckErrors
   if ( Errors.LastCallHasFailed ) then
      dim msg
      msg = "The following error was encountered: "
      do until Errors.IsEmpty
         msg = msg & vbNewLine & Errors.Message
      loop
      msgbox msg
   end if
end sub

'******************************************************************************
'**** Function GetArg()
'******************************************************************************
Function GetArg (Flag)
On Error Resume Next
    dim retVal, i
    retVal = ""
    Flag = UCase (Flag)
    'MsgBox Flag
    Dim args
    Set args = WScript.Arguments

    If args.Count > 0 Then
      For i = 0 To args.Count-1
        If UCase( args(i) ) = "/" + Flag  Then
          retVal = args(i+1)
          Exit For
        End If
      Next
    End If
    GetArg = retVal
End Function

'***************************DO NOT CHANGE**************************************