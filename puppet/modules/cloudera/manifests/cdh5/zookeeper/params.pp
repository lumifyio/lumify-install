class cloudera::cdh5::zookeeper::params {
  $zookeeper_config_dir = '/etc/zookeeper/conf'
  $zookeeper_log_dir    = '/var/log/zookeeper'
  $zookeeper_data_dir   = '/var/lib/zookeeper'

  if $interfaces =~ /bond0/ {
    $zookeeper_node_ip = $ipaddress_bond0
  } elsif $interfaces =~ /eth1/ {
    $zookeeper_node_ip = $ipaddress_eth1
  } elsif $interfaces =~ /em2/ {
    $zookeeper_node_ip = $ipaddress_em2
  } else {
    $zookeeper_node_ip = $ipaddress_eth0
  }

  $zookeeper_nodes      = { '1' => "${zookeeper_node_ip}:2181" }
}