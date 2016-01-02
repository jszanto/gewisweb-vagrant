# -*- mode: ruby -*-
# vi: set ft=ruby :

webpath = "/var/www/gewisweb/"
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.host_name = "gewisweb.dev"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.42.42"

  config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
     vb.memory = "1024"
     vb.cpus = 2
   end
  
  #config.vm.synced_folder ".", "/vagrant", type: "rsync",
    #rsync__exclude: ".git/"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "puppet/modules"
  end

  config.vm.provision :shell do |shell|
    shell.path = "puppet/post-puppet.sh"
  end

  config.vm.provision "shell", run: "always" do |shell|
    shell.path = "puppet/post-up.sh"
  end
end
