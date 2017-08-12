# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
   config.vm.box = "debian/jessie64"

   config.vm.box_check_update = false

   # Disable the default /vagrant share
   config.vm.synced_folder "../data", "/vagrant_data" , disabled: true

   config.vm.define "kb8s-master" do |cfg|
    cfg.vm.network "private_network", ip: "192.168.33.101"
    cfg.vm.hostname = "kb8s-master"    
    cfg.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.name = 'kb8s-master'
     vb.memory = "1100"
    end
    cfg.vm.provision :ansible do |ansible|
     ansible.playbook = 'provision.yml'
     ansible.inventory_path = 'vagrant-inventory.ini'
     ansible.limit = 'kb8s-master'
     ansible.verbose = 'v'
    end
   end
end
