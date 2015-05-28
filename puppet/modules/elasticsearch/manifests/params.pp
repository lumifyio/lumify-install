class elasticsearch::params {
  $elasticsearch_version      = '1.4.1'
  $elasticsearch_rpm_version  = '1.4.1-1'
  $user                       = 'elasticsearch'
  $group                      = 'elasticsearch'
  $installdir                 = '/usr/share'
  $configdir                  = '/etc/elasticsearch'
  $datadirs                   = [ "/var/lib/elasticsearch", ]
  $logdir                     = '/var/log/elasticsearch'
  $plugindir                  = '/usr/share/elasticsearch/plugins'
  $workdir                    = '/tmp/elasticsearch'
  $tmpdir                     = '/tmp'
  $number_of_shards           = '1'
  $number_of_replicates       = '0'
  $es_heap_size               = '2g'
  $mlockall                   = 'true'
  $cluster_name               = 'lumify_elasticsearch'

  case $architecture {
    'x86_64': {
      $package_arch = 'x64'
    }
    'i386': {
      $package_arch = 'i586'
    }
    default: {
      fail "unsupported architecture: ${architecture}"
    }
  }

  if $interfaces =~ /bond0/ {
    $es_node_ip = $ipaddress_bond0
  } elsif $interfaces =~ /eth1/ {
    $es_node_ip = $ipaddress_eth1
  } else {
    $es_node_ip = $ipaddress_eth0
  }

  $elasticsearch_locations = [ "${$es_node_ip}:9300", ]
}
