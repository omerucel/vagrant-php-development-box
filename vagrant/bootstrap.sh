#!/usr/bin/env bash

LC_ALL="en_US.UTF-8"

# PHP & Apache packages
apt-get update
apt-get install -y apache2 php5 php5-mysql php5-cli php5-xdebug php-apc php5-dev php5-curl make git-core gcc autoconf php-pear
rm -rf /var/www
ln -fs /vagrant/public /var/www

# Xdebug
cp /vagrant/vagrant/files/xdebug/20-xdebug.ini /etc/php5/conf.d/20-xdebug.ini

# xhprof
if [ ! -f /etc/php5/conf.d/20-xhprof.ini ]; then
    pecl install xhprof-0.9.3
    cp /vagrant/vagrant/files/xhprof/20-xhprof.ini /etc/php5/conf.d/20-xhprof.ini
fi

# Phalcon
if [ ! -f /etc/php5/conf.d/30-phalcon.ini ]; then
    git clone git://github.com/phalcon/cphalcon.git
    cd cphalcon/build
    ./install
    echo "extension=phalcon.so" >> /etc/php5/conf.d/30-phalcon.ini
fi

# Virtual hosts & apache mod
rm -rf /etc/apache2/sites-available/default
cp /vagrant/vagrant/files/apache/default /etc/apache2/sites-available/default
a2enmod rewrite
a2ensite default
/etc/init.d/apache2 restart

# Mysql
if [ ! -f /etc/init.d/mysql* ]; then
    #echo mysql-server-5.5 mysql-server/root_password password "" | debconf-set-selections
    #echo mysql-server-5.5 mysql-server/root_password_again password "" | debconf-set-selections
    apt-get install -y mysql-server

    replace "bind-address" "#bind-address" -- /etc/mysql/my.cnf
    /etc/init.d/mysql restart
fi

if [ ! -d /vagrant/xdebug ]; then
    mkdir /vagrant/xdebug
fi