########################################192.168.0.103

$source = "\\192.168.0.86\backup_server\192.168.0.103\system\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[2].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item


########################################192.168.0.200

$source = "\\192.168.0.86\backup_server\192.168.0.200\mssql_bak\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[4].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item

$source = "\\192.168.0.86\backup_server\192.168.0.200\system\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[1].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item


########################################192.168.0.201

$source = "\\192.168.0.86\backup_server\192.168.0.201\Disk E\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[4].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item

$source = "\\192.168.0.86\backup_server\192.168.0.201\Disk  C\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[2].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item


########################################192.168.5.103

$source = "\\192.168.0.86\backup_server\192.168.5.103\C\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[3].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item


########################################192.168.5.102

$source = "\\192.168.0.86\backup_server\192.168.5.102\1c8_srvinfo\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[3].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item

$source = "\\192.168.0.86\backup_server\192.168.5.102\1CData\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[9].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item

$source = "\\192.168.0.86\backup_server\192.168.5.102\MSQQL_bak\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[9].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item

$source = "\\192.168.0.86\backup_server\192.168.5.102\sql\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[4].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item

$source = "\\192.168.0.86\backup_server\192.168.5.102\system\*.TIB"
$files = Get-ChildItem -Path $source | sort -Descending LastWriteTime
$date = $files[4].LastWriteTime
$files | Where-Object {$_.LastWriteTime -lt $date} | Remove-Item