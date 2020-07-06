$source = "\\192.168.0.86\reserve_backup\PF\*.bak"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[9].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item