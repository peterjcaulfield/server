#!/usr/bin/env bash

# Install Web Packages
sudo apt-get install -y build-essential dkms re2c apache2 php5 php5-dev php-pear php5-xdebug php5-json php5-sqlite \
php5-mysql php5-pgsql php5-gd curl php5-curl memcached php5-memcached libmcrypt4 php5-mcrypt postgresql redis-server beanstalkd \
openssh-server git vim python2.7-dev

# Update php to 5.5.*
sudo apt-get update && sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:ondrej/php5
sudo apt-get update && sudo apt-get dist-upgrade -y

# Configure mysql (need to take in user input here)
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password "$MYSQL_PASS"'
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password "$MYSQL_PASS"'
sudo apt-get -y install mysql-server

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Install PHPUnit
sudo pear config-set auto_discover 1
sudo pear install pear.phpunit.de/phpunit

# Enable PHP Error Reporting
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/cli/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/cli/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php5/cli/php.ini
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php5/cli/php.ini
