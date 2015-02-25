#!/bin/bash
cd /var/www/gewisweb
php composer.phar install
cp -n config/autoload/doctrine.local.php.dist config/autoload/doctrine.local.php
cp -n config/autoload/zdt.local.php.dist config/autoload/zdt.local.php
sudo chown -R www-data:www-data ./data
./vendor/bin/doctrine-module orm:schema-tool:create
./vendor/bin/doctrine-module orm:schema-tool:update --force


