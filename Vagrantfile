# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Define the puppet client VM configurations in this hash.
#
# Keys are used as both the VM name for Vagrant and
# to generate the hostname for the VM (e.g. #{key}.vm.local).
#
# Values are a hash of the following options:
# - :ip   => The IP address of the client; required
# - :mem  => The amount of RAM for the client; defaults to 4096
# - :cpus => The number of CPUs for the client; defaults to 2
#
# All clients will be added to the hosts file for each VM
$clients = {
    :gpw            => { ip: '192.168.33.101', },
    :es             => { ip: '192.168.33.102', },
    :rmq            => { ip: '192.168.33.103', },
    :clavin         => { ip: '192.168.33.104', },
    :zk             => { ip: '192.168.33.105', },
    :ac             => { ip: '192.168.33.106', },
    :jetty          => { ip: '192.168.33.107', },
    :hadoop         => { ip: '192.168.33.108', },
    :lumify         => { ip: '192.168.33.109', },
    :demo           => { ip: '192.168.33.110', mem: '8192', cpus: '4', },
    :'vc-m1'        => { ip: '192.168.33.11',  mem: '2048', cpus: '2' },
    :'vc-m2'        => { ip: '192.168.33.12',  mem: '2048', cpus: '2' },
    :'vc-hdn1'      => { ip: '192.168.33.111', mem: '2048', cpus: '2' },
    :'vc-hdn2'      => { ip: '192.168.33.112', mem: '2048', cpus: '2' },
    :'vc-hdn3'      => { ip: '192.168.33.113', mem: '2048', cpus: '2' },
    :'vc-esn1'      => { ip: '192.168.33.211', mem: '2048', cpus: '2' },
    :'vc-esn2'      => { ip: '192.168.33.212', mem: '2048', cpus: '2' },
    :'vc-esn3'      => { ip: '192.168.33.213', mem: '2048', cpus: '2' },
}

def config_client(vm, name, ip_addr, mem, cpus)
  vm.define name do |client|
    client.vm.hostname = "#{name}.vm.local"
    client.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', "#{mem}"]
      vb.customize ['modifyvm', :id, '--cpus', "#{cpus}"]
    end
    client.vm.network :private_network, ip: ip_addr
    client.vm.provision :shell, path: 'vagrant/install_client.sh'
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'puppetlabs/centos-6.6-64-nocm'

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # Configure puppet yum repository; add 'echo' statement so provisioning is always
  # successful since rpm has a non-0 exit code if the repository has already
  # been added.
  config.vm.provision :shell do |s|
    s.inline = 'rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm; \
                echo "Configured puppet repository..."'
  end
  # Configure hosts file
  config.vm.provision :shell do |s|
    s.inline = 'echo "Configuring /etc/hosts" && cp /vagrant/vagrant/etc/hosts /etc/hosts'
  end
  $clients.each { |host, params|
    $update_hosts = "echo #{params[:ip]} #{host} #{host}.vm.local >> /etc/hosts"
    config.vm.provision :shell, inline: $update_hosts
    config_client(config.vm, host, params[:ip], params[:mem]||4096, params[:cpus]||2)
  }

  config.vm.define :puppet do |puppet|
    puppet.vm.hostname = 'puppet.vm.local'
    puppet.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', '4096' ]
      vb.customize ['modifyvm', :id, '--cpus', '1' ]
    end

    puppet.vm.network :private_network, ip: '192.168.33.100'
    puppet.vm.synced_folder 'puppet', '/etc/puppetlabs/code'

    puppet.vm.provision :shell, path: 'vagrant/install_server.sh'
  end

end
