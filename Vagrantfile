# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'puppetlabs/centos-6.6-64-nocm'

  # Configure puppet yum repository; add 'echo' statement so provisioning is always
  # successful since rpm has a non-0 exit code if the repository has already
  # been added.
  config.vm.provision :shell do |s|
    s.inline = 'rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm; \
                echo "Configured puppet repository..."'
  end
  # Configure hosts file
  config.vm.provision :shell, inline: 'cp /vagrant/vagrant/etc/hosts /etc/hosts && echo "Configured /etc/hosts"'

  config.vm.define :master do |master|
    master.vm.hostname = 'puppet.vm.local'
    master.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', '4096' ]
      vb.customize ['modifyvm', :id, '--cpus', '1' ]
    end

    master.vm.network :private_network, ip: '192.168.33.100'
    master.vm.synced_folder 'puppet', '/opt/lumify/puppet/environments/dev'

    master.vm.provision :shell, path: 'vagrant/install_server.sh'
  end

  config.vm.define :lumify do |lumify|
    lumify.vm.hostname = 'lumify-dev.vm.local'
    lumify.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', '4096']
      vb.customize ['modifyvm', :id, '--cpus', '2']
    end
    lumify.vm.network :private_network, ip: '192.168.33.101'

    lumify.vm.provision :shell, path: 'vagrant/install_client.sh'
  end
end
