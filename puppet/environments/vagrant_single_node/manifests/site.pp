# management node 1
node /lumify\d*\.vm\.local/ {
#  include '::iptables'
#  include '::ipv6'
#  include '::swappiness'
#  include '::role::rabbitmq::node'
#  include '::role::cloudera::cdh5::zookeeper::node'
#  include '::role::cloudera::cdh5::hadoop::yarn::nodemanager'
#  include '::role::cloudera::cdh5::hadoop::yarn::resourcemanager'
#  include '::role::cloudera::cdh5::hadoop::yarn::historyserver'
#  include '::role::cloudera::cdh5::hadoop::datanode'
#  include '::role::cloudera::cdh5::hadoop::namenode'
##  include '::role::cloudera::cdh5::hadoop::secondary_namenode'
##  include '::role::cloudera::cdh5::hadoop::journalnode'
#  include '::role::elasticsearch::node'
#  include '::role::accumulo::tablet'
#  include '::role::accumulo::master'
#  include '::role::accumulo::monitor'
#  include '::role::accumulo::tracer'
#  include '::role::accumulo::gc'
#  include '::role::graph_property_worker'
#  include '::role::lumify::jobs'
#  include '::role::lumify::client'
#  include '::role::lumify::webserver'


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
  class { '::erlang': } ->
  class { '::rabbitmq': } ->
  class { '::cloudera::cdh5::zookeeper::zookeeper': } ->
  class { '::cloudera::cdh5::hadoop::yarn::nodemanager': } ->
  class { '::cloudera::cdh5::hadoop::yarn::resourcemanager': } ->
  class { '::cloudera::cdh5::hadoop::yarn::historyserver': } ->
  class { '::cloudera::cdh5::hadoop::datanode': } ->
  class { '::cloudera::cdh5::hadoop::namenode': } ->
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
  class { '::lumify::gpw::deploy': } ->
  class { '::lumify::yarn::deploy': } ->
  class { '::lumify::yarn::run': } ->
  class { '::lumify::web::config': } ->
  class { '::lumify::web::deploy': }
}