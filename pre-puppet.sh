#!/bin/bash
sudo puppet module install --modulepath /etc/puppet/modules puppetlabs-mysql;
sudo puppet module install --modulepath /etc/puppet/modules puppetlabs-apache
