# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
   config.vm.box = "ubuntu/xenial64"

   config.vm.box_check_update = false

   config.vm.network "private_network", ip: "192.168.33.10"

   # Disable the default /vagrant share
   config.vm.synced_folder "../data", "/vagrant_data" , disabled: true

   # Update /etc/hosts 
   config.hostmanager.enabled = true
   config.hostmanager.manage_host = true
   config.hostmanager.include_offline = true

   config.vm.hostname = "kb8s"

   config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.name = 'kb8s'
     vb.memory = "1750"
   end

   config.vm.provision :ansible do |ansible|
    ansible.playbook = 'playbook.yml'
    ansible.groups = {
      "kb8s-servers" => ["kb8s"],
      }
   end


end
