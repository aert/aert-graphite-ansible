# -*- mode: ruby; -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "wheezy64"
  config.vm.box_url = "http://downloads.shadoware.org/wheezy64.box"


  # Network
  config.vm.network :private_network, ip: "192.168.111.226"
  config.vm.hostname = "graphite.vagrant.local"
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 5432, host: 5432

  #config.vm.synced_folder "../", "/home/vagrant/PROJECT"

  # Provision
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.inventory_path = "inventory.ini"
  end

  # Customize the box
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 512, "--name", "graphite"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end

end

