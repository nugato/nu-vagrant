#!/bin/bash

# PHP
apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php
apt-get update -y

apt-get install -y php7.1 libapache2-mod-php7.1 php7.1-bcmath php7.1-cli php7.1-curl \
    php7.1-common php7.1-mbstring php7.1-gd php7.1-intl php7.1-xml \
    php7.1-mysql php7.1-mcrypt php7.1-zip php7.1-fpm

sed -i 's/;date.timezone.*/date.timezone = Europe\/Warsaw/' /etc/php/7.1/fpm/php.ini
sed -i 's/;date.timezone.*/date.timezone = Europe\/Warsaw/' /etc/php/7.1/cli/php.ini
sed -i 's/^user = www-data/user = vagrant/' /etc/php/7.1/fpm/pool.d/www.conf
sed -i 's/^group = www-data/group = vagrant/' /etc/php/7.1/fpm/pool.d/www.conf

service php7.1-fpm restart

# composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
ln -s /usr/bin/composer.phar /usr/bin/composer