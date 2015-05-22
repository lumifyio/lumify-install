# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'puppetlabs/centos-6.6-64-nocm'
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '4096']
    vb.customize ['modifyvm', :id, '--cpus', '2']
  end

  $install_puppet = <<SCRIPT
rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
yum install -y puppetserver
cat > /etc/profile.d/puppet.sh <<'EOF'
PUPPET_HOME=/opt/puppetlabs
PATH=$PUPPET_HOME/bin:$PATH
export PUPPET_HOME PATH
EOF
SCRIPT
  config.vm.provision :shell, inline: $install_puppet

  # Must use shell provisioner workaround until Puppet 4 support PR is merged into
  # Vagrant: https://github.com/mitchellh/vagrant/issues/5601
  # config.vm.provision 'puppet' do |puppet|
  #   puppet.environment_path = 'puppet/environments'
  #   puppet.environment = 'dev'
  #   puppet.module_path = 'puppet/modules'
  # end
  $puppet_provision = <<EOF
echo Provisioning with puppet...
/opt/puppetlabs/bin/puppet apply \
  --environment=dev \
  --environmentpath=/vagrant/puppet/environments \
  --modulepath=/vagrant/puppet/modules \
  -v \
  /vagrant/puppet/environments/dev/manifests
EOF
  config.vm.provision :shell, inline: $puppet_provision
end
