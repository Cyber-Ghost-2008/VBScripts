Set objShell = CreateObject("WScript.Shell")
Set objNetwork = CreateObject("WScript.Network")
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set objFileSystem = CreateObject("Scripting.FileSystemObject")

' Get device information
strComputerName = objNetwork.ComputerName
strUserName = objNetwork.UserName
Set colItems = objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
For Each objItem in colItems
    strOS = objItem.Caption & " " & objItem.Version
Next

' Display device information
WScript.Echo "Computer Name: " & strComputerName
WScript.Echo "User Name: " & strUserName
WScript.Echo "Operating System: " & strOS

' Get WiFi information using netsh command
Set objExec = objShell.Exec("netsh wlan show interfaces")
strOutput = objExec.StdOut.ReadAll

' Parse WiFi information
Set regexSSID = New RegExp
regexSSID.Pattern = "SSID\s+:\s+(.+)"
regexSSID.IgnoreCase = True

Set regexSignal = New RegExp
regexSignal.Pattern = "Signal\s+:\s+([0-9]+)%"
regexSignal.IgnoreCase = True

Set matchesSSID = regexSSID.Execute(strOutput)
Set matchesSignal = regexSignal.Execute(strOutput)

If matchesSSID.Count > 0 Then
    SSID = matchesSSID(0).SubMatches(0)
Else
    SSID = "N/A"
End If

If matchesSignal.Count > 0 Then
    SignalStrength = matchesSignal(0).SubMatches(0) & "%"
Else
    SignalStrength = "N/A"
End If

' Display WiFi information
WScript.Echo "SSID: " & SSID
WScript.Echo "Signal Strength: " & SignalStrength
