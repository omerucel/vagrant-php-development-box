This vagrant project aims you to a PHP development box with minimum requirements. Project based on Ubuntu Raring (13.04 64bit) and puppet. You should put your public files to public folder (like .htaccess, index.php etc.).

# Usage

```bash
$ git clone https://github.com/omerucel/vagrant-php-development-box.git
$ cd vagrant-php-development-box/vagrant
$ vagrant up
```

# Applications & Libraries

* Apache 2
* PHP 5.4, Composer, Xdebug
* MySQL

# PHP Extensions

* php-curl
* php-xdebug
* php-pear
* php-mysql

# Default Ports

You can use following ports to access installed services. Of course, you can change this ports in vagrant/Vagrantfile.

```ini
MySQL = 3307
Apache = 8080
XDebug = 9091
```