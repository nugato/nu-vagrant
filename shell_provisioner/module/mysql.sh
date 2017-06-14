#!/bin/bash

PASSWORD='root'
MYSQL_CONFIG_FILE="/etc/mysql/my.cnf"

# Install MySQL
echo "mysql-server mysql-server/root_password password $PASSWORD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $PASSWORD" | debconf-set-selections
apt-get -y install mysql-client mysql-server

# Configuration
sed -i "s/\[mysqld\]/[mysqld]\ninnodb_file_per_table = 1/" ${MYSQL_CONFIG_FILE}
sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" ${MYSQL_CONFIG_FILE}
service mysql restart

# Create root user
MYSQLCMD="mysql -uroot -p$PASSWORD -e"
$MYSQLCMD "CREATE USER root@'10.0.0.1' IDENTIFIED BY '$PASSWORD';"
$MYSQLCMD "GRANT ALL PRIVILEGES ON *.* TO root@'10.0.0.1';"
$MYSQLCMD "FLUSH PRIVILEGES;"

# Phpmyadmin
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get -y install phpmyadmin