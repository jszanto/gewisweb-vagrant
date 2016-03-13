#!/bin/bash

# Quick npm fix
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo gem install sass
sudo npm install -g grunt-cli

# Setup gewisweb
cd /vagrant
php composer.phar install
cp -n config/autoload/doctrine.local.php.dist config/autoload/doctrine.local.php
sed -i 's/username/root/g' config/autoload/doctrine.local.php
cp -n config/autoload/zdt.local.php.dist config/autoload/zdt.local.php
cp -n config/autoload/local.php.dist config/autoload/local.php
sudo chown -R www-data:www-data ./data
./vendor/bin/doctrine-module orm:schema-tool:create
npm install

# Install phpmyadmin
cd /var/www
sudo curl https://files.phpmyadmin.net/phpMyAdmin/4.5.3.1/phpMyAdmin-4.5.3.1-english.tar.gz | sudo tar xvz
sudo mv phpMyAdmin-4.5.3.1-english/ phpmyadmin/ 
