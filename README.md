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

Technical Details
-----------------
* Ubuntu 16.04 64-bit
* Apache 2.4
* PHP 7.1
* MySQL 5.7
* XDebug
* Composer
* Phpmyadmin

The web root is located in the project directory at `var/www/html/` and you can install your files there