# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bento/centos-7.3'
  config.ssh.forward_agent = true
  config.vm.synced_folder '.', '/home/vagrant/synced'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end

  SWARM_MANAGER_ADDRESS = '192.168.33.10'

  config.vm.define :server do |host|
    _HOSTNAME = 'server'
    _PRIVATE_IP_ADDRESS = SWARM_MANAGER_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network 'private_network', ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: 'provision.sh'
    #host.vm.provision :shell, path: 'provision.sh', privileged: false
  end
end

