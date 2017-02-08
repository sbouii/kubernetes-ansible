# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
   config.vm.box = "ubuntu/xenial64"

   config.vm.box_check_update = false

   # Disable the default /vagrant share
   config.vm.synced_folder "../data", "/vagrant_data" , disabled: true

   # Update /etc/hosts 
   config.hostmanager.enabled = true
   config.hostmanager.manage_host = true
   config.hostmanager.include_offline = true

   config.vm.define "kb8s_master" do |cfg|
    cfg.vm.network "private_network", ip: "192.168.33.10"
    cfg.vm.hostname = "kb8s_master"    
    cfg.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.name = 'kb8s_master'
     vb.memory = "1750"
    end
   # hostname -i must return a routable address on second (non-NATed) network interface
    cfg.vm.provision :shell, :inline => "sed 's/127.0.0.1.*kube-master/192.168.33.10 kb8s_master/' -i /etc/hosts"
    cfg.vm.provision :ansible do |ansible|
     ansible.playbook = 'tasks/main_master.yml'
     ansible.groups = {
      "kb8s-servers" => ["kb8s_master"],
      }
    end
    config.vm.define "kb8s_slave" do |cfg|
     cfg.vm.network "private_network", ip: "192.168.33.11"
     cfg.vm.hostname = "kb8s_slave"
     cfg.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = 'kb8s_slave'
      vb.memory = "950"
     end
     cfg.vm.provision :shell, :inline => "sed 's/127.0.0.1.*kube-master/192.168.33.11 kb8s_slave/' -i /etc/hosts"
     cfg.vm.provision :ansible do |ansible|
      ansible.playbook = 'tasks/main_slave.yml'
      ansible.groups = {
       "kb8s-servers" => ["kb8s_slave"],
       }
     end
    end
end
