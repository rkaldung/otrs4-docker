#!/bin/bash
service mysqld start &
wait
mysql -uroot -e "CREATE DATABASE otrs;CREATE USER 'otrs'@'localhost' IDENTIFIED BY 'otrs';GRANT ALL PRIVILEGES ON otrs.* TO 'otrs'@'localhost' WITH GRANT OPTION;"&
wait
cat /opt/otrs/scripts/database/otrs-schema.mysql.sql | mysql -f -u root otrs &
wait
cat /opt/otrs/scripts/database/otrs-initial_insert.mysql.sql | mysql -f -u root otrs &
wait
/opt/otrs/bin/otrs.SetPassword.pl --agent root@localhost root &
wait
/opt/otrs/bin/otrs.RebuildConfig.pl &
wait
wget ftp://ftp.otrs.org/pub/otrs/itsm/bundle4/ITSM-4.0.3.opm &
wait
/opt/otrs/bin/otrs.PackageManager.pl -a install -p ITSM-4.0.3.opm &
wait
/opt/otrs/bin/Cron.sh start otrs &
wait
service httpd start
exec /usr/sbin/sshd -D
