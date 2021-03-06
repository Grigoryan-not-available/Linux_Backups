#########################################PF
$source = "\\192.168.0.86\reserve_backup\PF\*.bak"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[9].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item

#########################################RC_1
$source = "\\192.168.0.86\reserve_backup\RC_1\*.rar"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[9].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item

#########################################RC_2
$source = "\\192.168.0.86\reserve_backup\RC_2\*.bak"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[9].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item