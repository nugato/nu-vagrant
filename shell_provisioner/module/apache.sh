#!/bin/bash

# Apache
apt-get install -y apache2 libapache2-mod-fcgid
a2enmod rewrite expires headers proxy proxy_http proxy_fcgi actions fastcgi alias ssl

chmod -R a+rX /var/log/apache2
sed -i 's/640/666/' /etc/logrotate.d/apache2

echo 'Listen 80
      Listen 443
' >  /etc/apache2/ports.conf

service apache2 restart