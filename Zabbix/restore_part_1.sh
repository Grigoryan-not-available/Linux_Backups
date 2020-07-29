#!/bin/bash
#first - connect via ssh
#ssh ihor@192.168.0.86
date_for_restore=29.07.2020
yum install sshpass -y
sshpass -p 'Gt@85pass' ssh ihor@192.168.0.86 "ls /mnt/reserve_backup/Zabbix/$date_for_restore"
sleep 5
systemctl stop firewalld
systemctl disable firewalld
rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum install -y nginx 
systemctl start nginx
systemctl enable nginx
yum install -y epel-release
rpm -Uhv http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php71
yum install -y php71 php-fpm php-cli php-mysql php-gd php-ldap php-odbc php-pdo php-pecl-memcache php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap php-bcmath
systemctl start php-fpm
systemctl enable php-fpm
netstat -tulpn | grep php-fpm
sleep 5
#sudo cp -rpf /mnt/backup/zabbix/$date_for_restore/php-fpm.d/www.conf /etc/php-fpm.d/www.conf
sshpass -p 'Gt@85pass' scp -rp ihor@192.168.0.86:/mnt/reserve_backup/Zabbix/$date_for_restore/php-fpm.d/www.conf /etc/php-fpm.d/www.conf
systemctl restart php-fpm
ll /var/run/php-fpm/php-fpm.sock 
sleep 5
#sudo cp -rpf /mnt/backup/zabbix/mariadb.repo /etc/yum.repos.d/
sshpass -p 'Gt@85pass' scp -rp ihor@192.168.0.86:/mnt/reserve_backup/Zabbix/mariadb.repo /etc/yum.repos.d/
yum install -y MariaDB-server MariaDB-client
systemctl start mariadb
systemctl enable mariadb
/usr/bin/mysql_secure_installation
#sudo cp -rpf /mnt/backup/zabbix/$date_for_restore/my.cnf.d/server.cnf /etc/my.cnf.d/server.cnf
sshpass -p 'Gt@85pass' scp -rp ihor@192.168.0.86:/mnt/reserve_backup/Zabbix/$date_for_restore/my.cnf.d/server.cnf /etc/my.cnf.d/server.cnf
systemctl restart mariadb
systemctl status mariadb.service
sleep 5
rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
yum install -y zabbix-server-mysql zabbix-web-mysql
mysql -uroot -p
#create database zabbix character set utf8 collate utf8_bin;
#grant all privileges on zabbix.* to zabbix@localhost identified by 'small_zabix' WITH GRANT OPTION;
#exit

