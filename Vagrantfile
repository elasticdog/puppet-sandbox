# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = 'example.com'

Vagrant::Config.run do |config|
  config.vm.define :master do |master_config|
    master_config.vm.box = 'centos57'
    master_config.vm.box_url = 'http://yum.mnxsolutions.com/vagrant/centos57_64.box'
    master_config.vm.host_name = "puppet.#{domain}"
    master_config.vm.network :hostonly, '172.16.32.10'

    master_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end

  config.vm.define :client1 do |client_config|
    client_config.vm.box = 'centos57'
    client_config.vm.box_url = 'http://yum.mnxsolutions.com/vagrant/centos57_64.box'
    client_config.vm.host_name = "client1.#{domain}"
    client_config.vm.network :hostonly, '172.16.32.11'

    client_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end

  config.vm.define :client2 do |client_config|
    client_config.vm.box = 'centos57'
    client_config.vm.box_url = 'http://yum.mnxsolutions.com/vagrant/centos57_64.box'
    client_config.vm.host_name = "client2.#{domain}"
    client_config.vm.network :hostonly, '172.16.32.12'

    client_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end
end
