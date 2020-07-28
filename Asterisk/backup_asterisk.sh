
#!/bin/bash
date_for_backup=$(date +'%d.%m.%Y')
dest_dir=/mnt/backup/asterisk/$date_for_backup
sudo yum install -y cifs-utils
mkdir /mnt/backup
mount -t cifs //192.168.0.201/pilot_test_asterisk_backup /mnt/backup -o user=duplicity,password=Backup_123
mkdir -p $dest_dir/etc/asterisk
mkdir -p $dest_dir/var/lib/asterisk
ls /mnt/backup
sudo cp -r /etc/asterisk/* $dest_dir/etc/asterisk
sudo cp -r /var/lib/asterisk/* $dest_dir/var/lib/asterisk












