#!/bin/bash
sudo ln -s /usr/bin/nodejs /usr/bin/node;
sudo gem install sass;
sudo npm install -g grunt-cli;
cd /var/www;
git clone https://github.com/GEWIS/gewisweb.git;
cd gewisweb;
php composer.phar install;
cp -n config/autoload/doctrine.local.php.dist config/autoload/doctrine.local.php;
cp -n config/autoload/zdt.local.php.dist config/autoload/zdt.local.php;
cp -n config/autoload/local.php.dist config/autoload/local.php;
sudo chown -R www-data:www-data ./data;
./vendor/bin/doctrine-module orm:schema-tool:create;
npm install
