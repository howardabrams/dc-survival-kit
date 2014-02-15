# -*- mode: ruby -*-

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The following gives us a CentOS 6.4 Environment:
  config.vm.define :centos64 do |node|

    # All Vagrant configuration is done here. The most common configuration
    # options are documented and commented below. For a complete reference,
    # please see the online documentation at vagrantup.com.

    node.vm.box = 'CentOS-6.4-x86_64-v20130427'
    node.vm.box_url = 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box'
    node.vm.hostname = "cent64.dc-survival.vm"

    # To make it easy to play with box, we could give it a static IP:
    node.vm.network :private_network, ip: "192.168.33.10"
    # node.vm.network :public_network

    # We sync our current directory as the home directory when we issue
    # a 'vagrant ssh':
    node.vm.synced_folder ".", "/home/vagrant/dc-survival-kit", :nfs => true, id: "vagrant"

    # Enable provisioning with chef solo, specifying a cookbooks path, roles
    # path, and data_bags path (all relative to this Vagrantfile), and adding
    # some recipes and/or roles.
    #
    # node.vm.provision :chef_solo do |chef|
    #   chef.cookbooks_path = "../my-recipes/cookbooks"
    #   chef.roles_path = "../my-recipes/roles"
    #   chef.data_bags_path = "../my-recipes/data_bags"
    #   chef.add_recipe "mysql"
    #   chef.add_role "web"
    #
    #   # You may also specify custom JSON attributes:
    #   chef.json = { :mysql_password => "foo" }
    # end

    # Finally, let's kick off all of the "build" scripts we want...
    node.vm.provision :shell, :inline => "yum install git"

    # We can run a shell script specific to CentOS:
    # config.vm.provision :shell, :path => "bootstrap.sh"

    # We can also write them with Ruby and require that shit, as in:
    #
    # require File.join(File.dirname(__FILE__),'lib/foo.rb')
    # node.vm.provision :shell, :inline => Foo.openports_centos
    #
    # Or we can make them with lovely but limited shell:

  end
end
