Set WshShell = WScript.CreateObject("WScript.Shell")

Do
    ' List of common programs to launch
    WshShell.Run "notepad.exe"
    WshShell.Run "cmd.exe"
    WshShell.Run "powershell.exe"
    WshShell.Run "explorer.exe"
    WshShell.Run "ms-settings:"
    WshShell.Run "calc.exe" ' Calculator
    WshShell.Run "mspaint.exe" ' MS Paint
    WshShell.Run "msedge.exe" ' Microsoft Edge

Loop
