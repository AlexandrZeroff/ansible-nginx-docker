# -*- mode: ruby -*-
# vi: set ft=ruby :

class Cfg
  def initialize(i)
    @name = "node#{i}"
    @ip = "192.168.56.#{100 + i}"
    @host_ssh_port = 22100+i
    @host_http_port = 8000+i
  end
  
  def configure(config)

    config.vm.define @name do |node|
    
      node.vm.provider "virtualbox" do |vb|
        vb.name = @name
      end
      
      node.vm.hostname = @name
      node.vm.box = "ubuntu/bionic64"
      node.vm.box_url = "ubuntu/bionic64"

      node.vm.network :private_network, ip: @ip
      node.vm.network :forwarded_port, guest: 22, host: @host_ssh_port, id: "ssh"
      node.vm.network :forwarded_port, guest: 80, host: @host_http_port
    end
  end
end

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--memory", 1024]
    vb.customize ["modifyvm", :id, "--cpus", 1]
  end
  
  config.vm.synced_folder ".", "/home/vagrant/share", disabled: true

  for i in 1..3
    cfg = Cfg.new(i)
    cfg.configure(config)
  end
end




