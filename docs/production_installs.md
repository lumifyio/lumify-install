# Lumify Puppet Installation
The following instructions describe installing Lumify into a production environment with Puppet Server.  

## Setup the Puppet Master
Perform the following steps to configure the Lumify Puppet Master.

### From Puppet Server
Disable the firewall on the puppet master.

	$
	$ chkconfig iptables off
	$ service iptables stop
	$

Install the Puppet Labs Yum repository

	$
	$ rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
	$
	
Install the puppet agent, followed by the puppet server. Note that agent must be installed first to ensure the correct version is installed.
	
	$
	$ yum install -y puppet-agent-1.1.1-1.el6
	$ yum install -y puppetserver-2.1.1-1.el6
	$

### From Deployment System

Copy the Lumify puppet modules and configuration files to the Puppet Master.

	$
	$ scp <install_dir>/vagrant/server/*.conf root@<puppet_server>:/etc/puppetlabs/puppet
	$ scp <install_dir>/vagrant/server/conf.d/*.conf root@<puppet_server>:/etc/puppetlabs/puppetserver/conf.d
	$ scp <install_dir>/vagrant/etc/puppet.sh root@<puppet_server>:/etc/profile.d
	$
	$ ### modify the environment/hieradata for the deoployment before copying to the puppet master
	$ scp -r <install_dir>/puppet/* root@<puppet_server>:/etc/puppetlabs/code

### From Puppet Server

Start the Puppet Server on the Puppet Master server.

	$
	$ chkconfig puppetserver on
	$ service puppetserver start
	$
 
## Setup puppet agent / cluster node

### From Puppet Agent / Node

Disable the firewall on the Puppet Agent server.

	$
	$ chkconfig iptables off
	$ service iptables stop
	$
	
Install the Puppet Labs Yum repository
	
	$
	$ rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
	$ yum install -y puppet-agent-1.1.1-1.el6
	$

### From Deployment System

Copy the puppet agent configuration on to the Puppet Agent server.

	$
	$ ### modify puppet.conf to set the environment you choose to deploy before copying to the puppet agent
	$
	$ scp <install_dir>/vagrant/client/*.conf root@<puppet_agent>:/etc/puppetlabs/puppet
	$ scp /vagrant/vagrant/etc/puppet.sh root@<puppet_agent>:/etc/profile.d
	$
	
If the puppet agent will be hosting the Lumify Web app then install the lumify deployment artifacts on the Puppet Agent server.
	
	$	
	$ scp -r <install_dir>/deploy/deployment root@<puppet_agent>:/opt/lumify-deployment
	$

### From Puppet Agent

On each Puppet Agent execute the following command to install the Lumify.

	$
	$ /opt/puppetlabs/bin/puppet agent -v -t --server <puppet_master_hostname> --certname <puppet_agent_hostname>
	$