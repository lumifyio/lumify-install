# Install puppet agent 4
echo "Installing puppet-agent ..."
yum install -y puppet-agent-1.1.1-1.el6

# Install configuration files
echo "Copying configuration files ..."
cp /vagrant/vagrant/client/*.conf /etc/puppetlabs/puppet
cp /vagrant/vagrant/etc/puppet.sh /etc/profile.d

# Revoke client certificate so it is reissued when server is rebuilt
echo "Revoking client certificate ..."
CERT_STATUS=https://puppet:8140/puppet-ca/v1/certificate_status/$HOSTNAME?environment=dev
curl -k -s -S -X PUT -H "Content-Type: text/pson" --data '{"desired_state":"revoked"}' $CERT_STATUS 2>&1 > /dev/null
curl -k -s -S -X DELETE -H "Accept: pson" $CERT_STATUS 2>&1 > /dev/null
find /etc/puppetlabs/puppet/ssl -name $HOSTNAME.pem -delete 2>&1 > /dev/null

# Trigger puppet provisioning
echo "Provisioning with puppet ..."
/opt/puppetlabs/bin/puppet agent -v -t --certname $HOSTNAME

# Detailed exit codes for puppet agent are:
# 0 - No Changes
# 2 - Changes made successfully
# 4 - Agent Failed
# 6 - Changes made and agent failed
PUPPET_EXIT=$?
if [ "$PUPPET_EXIT" == "0" -o "$PUPPET_EXIT" == "2" ]; then
  true
else
  false
fi
