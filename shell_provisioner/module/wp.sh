#!/bin/bash

APP_DOMAIN = $1

#########################
# vhost #
#########################

cat ${CONFIG_PATH}/apache/wp.vhost.conf > /etc/apache2/sites-available/${APP_DOMAIN}.conf
a2ensite ${APP_DOMAIN}.conf
echo 127.0.0.1 $APP_DOMAIN >> /etc/hosts

#########################
# database #
#########################

$MYSQLCMD "CREATE DATABASE ${APP_DBNAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"

CONFIG_PATH='/vagrant/shell_provisioner/config'

cd /var/www/sites

# Install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# Install wp-dotenv package
wp package install aaemnnosttv/wp-cli-dotenv-command:^1.0

if [ ! -d "wp" ]; then

    # Create themosis project
    composer create-project themosis/themosis wp

    # Configure environment
    cd /vagrant/sites/wp
    rm .travis.yml
    rm .env.local

    cp ${CONFIG_PATH}/wp/.env.local /vagrant/sites/wp

    sed -i "s/INSERT-HOSTNAME/vagrant/g" config/environment.php

fi