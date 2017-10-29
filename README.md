nu-vagrant - Nugato vagrant environment
============
Simple vagrant LAMP for PHP Development. Master branch has PHP 7.1 version.
If you need Vagrant with PHP 5.6 look at branch php56

Requirements
------------
* VirtualBox <http://www.virtualbox.org>
* Vagrant <http://www.vagrantup.com>
* Git <http://git-scm.com/>

Usage
-----

### Startup

1. Clone this repository
    ```
    git clone https://github.com/nugato/nu-vagrant.git project
    ```
2. Run vagrant
    ```
    cd project
    vagrant up
    ```
3. Now your vagrant is running and ready to work.

### Connecting

#### SSH
You can connect with your vagrant by command: ``` vagrant ssh ```

#### Urls
* **Main** http://10.0.0.200/
* **Phpmyadmin** http://10.0.0.200/phpmyadmin

#### MySQL
* **Host:** 10.0.0.200
* **Username:** root
* **Password:** root
* **Port:** 3306

#### Installers
In progress ...

#### Selenium
If you want to use selenium on your local machine using this vagrant: 

1. Download selenium on your local machine
`http://selenium-release.storage.googleapis.com/3.6/selenium-server-standalone-3.6.0.jar`
2. Download chrome driver
`
wget https://chromedriver.storage.googleapis.com/2.29/chromedriver_mac64.zip
unzip chromedriver_mac64.zip
mv chromedriver /usr/local/bin
rm chromedriver_mac64.zip
`
3. Log in to the vagrant by ssh 
`vagrant ssh`
4. Run Selenium server as HUB on vagrant machine
`java -jar ~/selenium-server-standalone-3.6.0.jar -role hub`
5. Run Selenium on your local machine as NODE with chrome driver
`java -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver -jar selenium-server-standalone-3.6.0.jar -role node -hub http://10.0.0.200:4444/grid/register/`
6. Have fun with behat test :)

> If you are using linux then you have to download linux64 version chromedriver_linux64.zip

Technical Details
-----------------
* Ubuntu 16.04 64-bit
* Apache 2.4
* PHP 7.1
* MySQL 5.7
* XDebug
* Composer
* Phpmyadmin
* Selenium server 3.6

The web root is located in the project directory at `var/www/html/` and you can install your files there