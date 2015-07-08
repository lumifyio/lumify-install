node 'lumify1.vm.local' {
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

  class { '::erlang': } ->
  class { '::rabbitmq': } ->

  class { '::cloudera::cdh5::zookeeper::zookeeper': } ->

  class { '::cloudera::cdh5::hadoop::yarn::nodemanager': } ->
  class { '::cloudera::cdh5::hadoop::yarn::resourcemanager': } ->
  class { '::cloudera::cdh5::hadoop::journalnode': } ->
  class { '::cloudera::cdh5::hadoop::datanode': } ->
  class { '::cloudera::cdh5::hadoop::namenode': } ->

  class { '::elasticsearch': } ->
  class { '::elasticsearch_head_plugin': } ->
  class { '::elasticsearch_hq_plugin': } ->
  class { '::elasticsearch_securegraph_plugin': } ->

  class { '::accumulo::tablet': }
#  ->
#
#  class { '::lumify::tools::deploy': } ->
#  class { '::lumify::ontology::deploy': } ->
#  class { '::lumify::gpw::deploy': } ->
#  class { '::lumify::yarn::deploy': } ->
#  class { '::lumify::yarn::run': } ->
#  class { '::lumify::web::deploy': }
}

node 'lumify2.vm.local' {
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

  class { '::erlang': } ->
  class { '::rabbitmq': } ->

  class { '::cloudera::cdh5::zookeeper::zookeeper': } ->

  class { '::cloudera::cdh5::hadoop::yarn::nodemanager': } ->
  class { '::cloudera::cdh5::hadoop::journalnode': } ->
  class { '::cloudera::cdh5::hadoop::datanode': } ->

  class { '::cloudera::cdh5::hadoop::yarn::historyserver': } ->
  class { '::cloudera::cdh5::hadoop::secondary_namenode': } ->

  class { '::elasticsearch': } ->
  class { '::elasticsearch_head_plugin': } ->
  class { '::elasticsearch_hq_plugin': }
  class { '::elasticsearch_securegraph_plugin': } ->

  class { '::accumulo::tablet': }
}

node 'lumify3.vm.local' {
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

  class { '::cloudera::cdh5::zookeeper::zookeeper': } ->

  class { '::cloudera::cdh5::hadoop::yarn::nodemanager': } ->
  class { '::cloudera::cdh5::hadoop::journalnode': } ->
  class { '::cloudera::cdh5::hadoop::datanode': } ->

  class { '::elasticsearch': } ->
  class { '::elasticsearch_head_plugin': } ->
  class { '::elasticsearch_hq_plugin': } ->
  class { '::elasticsearch_securegraph_plugin': } ->

  class { '::accumulo::tablet': } ->
  class { '::accumulo::master': } ->
  class { '::accumulo::monitor': } ->
  class { '::accumulo::tracer': } ->
  class { '::accumulo::gc': } ->

  class { '::lumify::tools::deploy': } ->
  class { '::lumify::ontology::deploy': } ->
  class { '::lumify::gpw::deploy': } ->
  class { '::lumify::yarn::deploy': } ->
  class { '::lumify::yarn::run': } ->
  class { '::lumify::web::deploy': }
}