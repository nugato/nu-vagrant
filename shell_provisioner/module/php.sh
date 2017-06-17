#!/bin/bash

# PHP
apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php
apt-get update -y

apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-cli php5.6-curl \
    php5.6-common php5.6-mbstring php5.6-gd php5.6-intl php5.6-xml \
    php5.6-mysql php5.6-mcrypt php5.6-zip php5.6-fpm

sed -i 's/;date.timezone.*/date.timezone = Europe\/Warsaw/' /etc/php/5.6/fpm/php.ini
sed -i 's/;date.timezone.*/date.timezone = Europe\/Warsaw/' /etc/php/5.6/cli/php.ini
sed -i 's/^user = www-data/user = vagrant/' /etc/php/5.6/fpm/pool.d/www.conf
sed -i 's/^group = www-data/group = vagrant/' /etc/php/5.6/fpm/pool.d/www.conf

service php5.6-fpm restart

# composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
ln -s /usr/bin/composer.phar /usr/bin/composer