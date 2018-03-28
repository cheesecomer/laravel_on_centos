# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "bento/centos-7.4"
  config.vm.box_download_insecure = true
  config.vm.network 'forwarded_port', guest: 80, host: 8080, auto_correct: true
  config.vm.synced_folder '.', '/vagrant/laravel', create: true, owner: 'vagrant', group: 'vagrant'

  config.vm.provision :shell, path: './provision.sh', privileged: true
end
