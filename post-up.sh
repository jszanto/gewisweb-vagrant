#!/bin/bash
cd /var/www/gewisweb
php composer.phar install
./vendor/bin/doctrine-module orm:schema-tool:update --force
grunt css

