#!/bin/bash
date_for_backup=$(date +'%d.%m.%Y')
sudo yum install -y cifs-utils
mkdir /mnt/backup
mount.cifs //192.168.0.201/pilot_test_zabbix_back /mnt/backup -o user=duplicity,password=Backup_123
ls /mnt/backup
sleep 5
name_backup=zabbix_$date_for_backup.sql
dest_dir=/mnt/backup/zabbix/$date_for_backup
mkdir $dest_dir
mysqldump -u root -p1!Cheklanin483 zabbix > $dest_dir/$name_backup
cp -r /etc/php-fpm.d $dest_dir
cp -r /etc/my.cnf.d $dest_dir
cp -r /etc/zabbix $dest_dir
cp -r /etc/nginx $dest_dir
umount //192.168.0.201/pilot_test_zabbix_back
echo "Finished"
