$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Any, 4444)
$listener.Start()
$client = $listener.AcceptTcpClient()
$stream = $client.GetStream()
$reader = [System.IO.StreamReader]::new($stream)
while($true) {
    $data = $reader.ReadLine()
    Write-Host $data
}
