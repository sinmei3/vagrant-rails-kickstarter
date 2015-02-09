#!/bin/sh

## setting variables
RUBY_VERSION="2.1.0"
RAILS_VERSION="4.1.0"
APP_NAME="new-app"
MYSQL_PASSWORD="password"

## Dependency RPM Package installation
sudo yum install git -y
sudo yum install gcc make automake autoconfig -y
sudo yum install libyaml libyaml-devel zlib zlib-devel readline readline-devel openssl openssl-devel libxml2 libxml2-devel libxslt libxslt-devel -y

## rbenv installation
cd $HOME
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
if [ $? != 0 ]; then
    echo "FAILED: git clone rbenv"
    exit 1
fi

## ruby-build installation
cd $HOME
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
if [ $? != 0 ]; then
    echo "FAILED: git clone rbenv-build"
    exit 1
fi

## Setting System Environment
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

## ruby installation and setting global version
rbenv install ${RUBY_VERSION}
if [ $? != 0 ]; then
    echo "FAILED: rbenv install"
    exit 1
fi
rbenv global ${RUBY_VERSION}
rbenv rehash

## rubygem update
gem update --system

## bundler installation
gem install bundler --no-document
if [ $? != 0 ]; then
    echo "FAILED: install bundler gem"
    exit 1
fi

## rails installation
gem install rails -v ${RAILS_VERSION} --no-document

## MySQL installation
if [[ ! -f /usr/sbin/mysqld ]]; then
sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
sudo yum install -y mysql-server mysql-devel
sudo service mysqld start
sudo chkconfig mysqld on
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_PASSWORD}')"
fi

## create rails project
rails new ${APP_NAME} -d mysql --skip-test-unit
cp -rT ${APP_NAME} /vagrant && rm -rf ~/${APP_NAME}
