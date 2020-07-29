#!/bin/bash
date_for_restore=29.07.2020
yum install -y zabbix-server-mysql zabbix-web-mysql
df -h
#sudo cp /mnt/backup/zabbix/$date_for_restore/zabbix_$date_for_restore.sql .
sshpass -p 'Gt@85pass' scp -rpf ihor@192.168.0.86:/mnt/reserve_backup/Zabbix/$date_for_restore/zabbix_$date_for_restore.sql .
mysql -uzabbix -psmall_zabix zabbix < zabbix_$date_for_restore.sql
df -h
sleep 5
#sudo cp -rpf /mnt/backup/zabbix/$date_for_restore/zabbix/zabbix_server.conf /etc/zabbix/zabbix_server.conf
sshpass -p 'Gt@85pass' scp -rpf ihor@192.168.0.86:/mnt/reserve_backup/Zabbix/$date_for_restore/zabbix/zabbix_server.conf /etc/zabbix/zabbix_server.conf
systemctl start zabbix-server
systemctl enable zabbix-server
cat /var/log/zabbix/zabbix_server.log
sleep 5
yum install -y policycoreutils-python
cd ~
sudo curl https://support.zabbix.com/secure/attachment/53320/zabbix_server_add.te > zabbix_server_add.te
sudo checkmodule -M -m -o zabbix_server_add.mod zabbix_server_add.te
sudo semodule_package -m zabbix_server_add.mod -o zabbix_server_add.pp
sudo semodule -i zabbix_server_add.pp
systemctl restart zabbix-server
cat /var/log/zabbix/zabbix_server.log
sleep 5 
systemctl restart php-fpm
#sudo cp -rf /mnt/backup/zabbix/$date_for_restore/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
sshpass -p 'Gt@85pass' scp -rpf ihor@192.168.0.86:/mnt/reserve_backup/Zabbix/$date_for_restore/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
nginx -t
nginx -s reload
chown -R nginx:nginx /var/lib/php/session
chown -R nginx:nginx /etc/zabbix/web
setsebool -P httpd_can_connect_zabbix on
setsebool -P httpd_can_network_connect_db on
