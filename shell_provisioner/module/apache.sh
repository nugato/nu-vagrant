#!/bin/bash

# Apache
apt-get install -y apache2 libapache2-mod-fcgid
a2enmod rewrite expires headers proxy proxy_http proxy_fcgi actions fastcgi alias ssl

chmod -R a+rX /var/log/apache2
sed -i 's/640/666/' /etc/logrotate.d/apache2

echo 'Listen 80
      Listen 443
' >  /etc/apache2/ports.conf

# Swap for composer
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1

# Install virtualhost management script
git clone https://github.com/RoverWire/virtualhost
sed -i -e 's/var\/www/var\/www\/html/g' virtualhost/virtualhost.sh
sudo chmod +x virtualhost/virtualhost.sh
sudo cp virtualhost/virtualhost.sh /usr/local/bin/virtualhost
rm -rf virtualhost

service apache2 restart