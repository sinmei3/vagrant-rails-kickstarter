# vagrant-rails-kickstarter

## Introduction

create a vagrant + rails + mysql environment in one shot.      
rails project is built in **/vagrant** at guest machine (shared directory) after **vagrant up**

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)


## box

[centos65-x86_64-20140116.box](https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box)

## Instration

```
$ vagrant up
```

## What's In The Box

* Git

* rbenv

* Bundler

* MySQL

## provision setting
default at provision/bootstrap.sh

```
#!/bin/sh

## setting variables
RUBY_VERSION="2.1.0"
RAILS_VERSION="4.1.0"
APP_NAME="new-app"
MYSQL_PASSWORD="password"
・・・
```

