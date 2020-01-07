'Tigran
'Joachim


If WScript.Arguments.Count = 0 Then 
    MsgBox "The script argument is missing an audio file target location." & vbCrLf & vbCrLf & "Define in the InvokeScript parameter (Channel Editor) a target location to an audio file.", vbExclamation + VbMsgBoxSetForeground, "Missing Audio File"
    Wscript.Quit
End If

Dim oPlayer
Set oPlayer = CreateObject("WMPlayer.OCX")

' Play audio
oPlayer.URL = WScript.Arguments.Item(0)

oPlayer.controls.play 

While oPlayer.playState <> 1 ' 1 = Stopped
  WScript.Sleep 100
Wend

' Release the audio file
oPlayer.close