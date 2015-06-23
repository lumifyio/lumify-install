node /lumify1\d*\.vm\.local/ {
  class { '::iptables': } ->
  class { '::ipv6': } ->
  class { '::swappiness': } ->
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

  class { '::accumulo::tablet': } ->

  class { '::lumify::tools::deploy': } ->
  class { '::lumify::gpw::deploy': } ->
  class { '::lumify::yarn::deploy': } ->
  class { '::lumify::yarn::run': } ->
  class { '::lumify::web::config': } ->
  class { '::elasticsearch_securegraph_plugin': } ->
  class { '::lumify::web::deploy': }
}

node /lumify2\d*\.vm\.local/ {
  class { '::iptables': } ->
  class { '::ipv6': } ->
  class { '::swappiness': } ->
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
  class { '::elasticsearch_hq_plugin': } ->

  class { '::accumulo::tablet': }
}

node /lumify3\d*\.vm\.local/ {
  class { '::iptables': } ->
  class { '::ipv6': } ->
  class { '::swappiness': } ->
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

  class { '::accumulo::tablet': } ->
  class { '::accumulo::master': } ->
  class { '::accumulo::monitor': } ->
  class { '::accumulo::tracer': } ->
  class { '::accumulo::gc': }
}