node 'lumify_1_hostname' {
  class { 'selinux': } ->
  class { '::ntp': } ->
  class { '::mdadm': } ->
  class { '::sysctl::max_file_descriptors': } ->
  class { '::sysctl::max_map_count': } ->
  class { '::sysctl::swappiness': } ->
  class { '::iptables': } ->
  class { '::ipv6': } ->
  class { '::epel': } ->

  class { '::lumify::config::config': } ->

  class { '::erlang': } ->
  class { '::rabbitmq': } ->

  class { '::cloudera::cdh5::zookeeper::zookeeper': } ->

  class { '::cloudera::cdh5::hadoop::yarn::resourcemanager': } ->
  class { '::cloudera::cdh5::hadoop::namenode': }
}

node 'lumify_2_hostname' {
  class { 'selinux': } ->
  class { '::ntp': } ->
  class { '::mdadm': } ->
  class { '::sysctl::max_file_descriptors': } ->
  class { '::sysctl::max_map_count': } ->
  class { '::sysctl::swappiness': } ->
  class { '::iptables': } ->
  class { '::ipv6': } ->
  class { '::epel': } ->

  class { '::lumify::config::config': } ->

  class { '::erlang': } ->
  class { '::rabbitmq': } ->

  class { '::cloudera::cdh5::zookeeper::zookeeper': } ->

  class { '::cloudera::cdh5::hadoop::secondary_namenode': }
}

node 'lumify_3_hostname' {
  class { 'selinux': } ->
  class { '::ntp': } ->
  class { '::mdadm': } ->
  class { '::sysctl::max_file_descriptors': } ->
  class { '::sysctl::max_map_count': } ->
  class { '::sysctl::swappiness': } ->
  class { '::iptables': } ->
  class { '::ipv6': } ->
  class { '::epel': } ->

  class { '::lumify::config::config': } ->

  class { '::cloudera::cdh5::zookeeper::zookeeper': } ->

  class { '::cloudera::cdh5::hadoop::yarn::historyserver': } ->

  class { '::accumulo::master': } ->
  class { '::accumulo::monitor': } ->
  class { '::accumulo::tracer': } ->
  class { '::accumulo::gc': } ->

  class { '::lumify::tools::deploy': } ->
  class { '::lumify::ontology::deploy': } ->
  class { '::lumify::gpw::deploy': } ->
  class { '::lumify::yarn::deploy': } ->
  class { '::lumify::yarn::run': } ->
  class { '::jetty': } ->
  class { '::lumify::web::deploy': }
}

node 'lumify_4_hostname', 'lumify_5_hostname', 'lumify_6_hostname' {
  class { 'selinux': } ->
  class { '::ntp': } ->
  class { '::mdadm': } ->
  class { '::raid_zero_partition': } ->
  class { '::sysctl::max_file_descriptors': } ->
  class { '::sysctl::max_map_count': } ->
  class { '::sysctl::swappiness': } ->
  class { '::iptables': } ->
  class { '::ipv6': } ->
  class { '::epel': } ->

  class { '::jai': } ->
  class { '::jai_imageio': } ->
  class { '::opencv': } ->
  class { '::tesseract': } ->
  class { '::sphinx': } ->
  class { '::ccextractor': } ->
  class { '::ffmpeg': } ->
  class { '::clavin': } ->

  class { '::lumify::config::config': } ->

  class { '::cloudera::cdh5::hadoop::yarn::nodemanager': } ->
  class { '::cloudera::cdh5::hadoop::journalnode': } ->
  class { '::cloudera::cdh5::hadoop::datanode': } ->

  class { '::elasticsearch': } ->
  class { '::elasticsearch_head_plugin': } ->
  class { '::elasticsearch_hq_plugin': } ->
  class { '::elasticsearch_securegraph_plugin': } ->

  class { '::accumulo::tablet': }
}