#!/bin/bash
date_for_backup=$(date +'%d.%m.%Y')
name_backup=zabbix_$date_for_backup.sql
sshpass -p 'Gt@85pass' ssh ihor@192.168.0.86 "mkdir /mnt/reserve_backup/Zabbix/$date_for_backup"
mysqldump -u root -p1!Cheklanin483 zabbix > $name_backup
sshpass -p 'Gt@85pass' scp -r $name_backup /etc/php-fpm.d /etc/my.cnf.d /etc/zabbix /etc/nginx ihor@192.168.0.86:/mnt/reserve_backup/Zabbix/$date_for_backup
rm -rf $name_backup
sshpass -p 'Gt@85pass' ssh ihor@192.168.0.86 "chmod -R 777 /mnt/reserve_backup/Zabbix/$date_for_backup"
echo "Finished"
