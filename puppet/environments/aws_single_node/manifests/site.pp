# management node 1
node '<slave_node_hostname>' {
  class { 'selinux': } ->
  class { '::ntp': } ->
  class { '::sysctl::max_file_descriptors': } ->
  class { '::sysctl::max_map_count': } ->
  class { '::sysctl::swappiness': } ->
  class { '::iptables': } ->
  class { '::ipv6': } ->
  class { '::mdadm': } ->
  class { '::raid_zero_partition': } ->
  class { '::epel': } ->
  class { '::jai': } ->
  class { '::jai_imageio': } ->
  class { '::opencv': } ->
  class { '::tesseract': } ->
  class { '::sphinx': } ->
  class { '::ccextractor': } ->
  class { '::ffmpeg': } ->
  class { '::clavin': } ->
  class { '::erlang': } ->
  class { '::rabbitmq': } ->
  class { '::lumify::config::config': } ->
  class { '::cloudera::cdh5::zookeeper::zookeeper': } ->
  class { '::cloudera::cdh5::hadoop::yarn::nodemanager': } ->
  class { '::cloudera::cdh5::hadoop::yarn::resourcemanager': } ->
  class { '::cloudera::cdh5::hadoop::yarn::historyserver': } ->
  class { '::cloudera::cdh5::hadoop::datanode': } ->
  class { '::cloudera::cdh5::hadoop::namenode': } ->
  class { '::accumulo::tablet': } ->
  class { '::accumulo::master': } ->
  class { '::accumulo::monitor': } ->
  class { '::accumulo::tracer': } ->
  class { '::accumulo::gc': } ->
  class { '::elasticsearch': } ->
  class { '::elasticsearch_head_plugin': } ->
  class { '::elasticsearch_hq_plugin': } ->
  class { '::elasticsearch_securegraph_plugin': } ->
  class { '::lumify::tools::deploy': } ->
  class { '::lumify::gpw::deploy': } ->
  class { '::lumify::ontology::deploy': } ->
  class { '::lumify::yarn::deploy': } ->
  class { '::lumify::yarn::run': } ->
  #  class { '::lumify::plugins::auth_social::deploy': } ->
  class { '::lumify::plugins::auth_username_password::deploy': } ->
  class { '::lumify::plugins::change_email::deploy': } ->
  class { '::lumify::plugins::change_password::deploy': } ->
  #class { '::lumify::plugins::dev_tools::deploy': } ->
  class { '::lumify::plugins::geocoder_bing::deploy': } ->
  class { '::lumify::plugins::google_analytics::deploy': } ->
  #class { '::lumify::plugins::import_export_workspaces::deploy': } ->
  class { '::lumify::plugins::analysts_notebook_export::deploy':} ->
  class { '::jetty': } ->
  class { '::lumify::web::deploy': }
}