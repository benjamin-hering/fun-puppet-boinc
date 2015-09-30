#!/bin/bash
#
# Does basic puppet setup and install on RedHat 6
#
yum install wget -y
wget https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
rpm -ivh puppetlabs-release-el-6.noarch.rpm
yum update -y
yum install puppet-server
puppet resource package puppet-server ensure=latest
puppet master --verbose --no-daemonize
yum install vim htop screen bind-utils -y
yum install httpd httpd-devel mod_ssl ruby-devel rubygems gcc -y
gem install rack passenger
yum install gcc-c++ libcurl-devel openssl-devel zlib-devel -y
yes | passenger-install-apache2-module
mkdir -p /usr/share/puppet/rack/puppetmasterd
mkdir /usr/share/puppet/rack/puppetmasterd/public /usr/share/puppet/rack/puppetmasterd/tmp
cp /usr/share/puppet/ext/rack/config.ru /usr/share/puppet/rack/puppetmasterd/
chown puppet:puppet /usr/share/puppet/rack/puppetmasterd/config.ru
