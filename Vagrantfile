# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "centos6.5.3"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/" +
    "releases/download/v6.5.3/centos65-x86_64-20140116.box"
  config.vm.hostname = 'rails-dev'
  config.vm.network "forwarded_port", guest: 3000, host: 4000
  config.vm.provision :shell, path: "provision/bootstrap.sh", keep_color: true, :privileged => false
end
