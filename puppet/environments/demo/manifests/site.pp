node /demo\d*\.vm\.local/ {
  # management node 1
  include '::role::cloudera::cdh5::hadoop::namenode'
  include '::role::cloudera::cdh5::hadoop::yarn::resourcemanager'
  include '::role::cloudera::cdh5::hadoop::yarn::historyserver'
  include '::role::rabbitmq::node'

  # management node 2
  include '::role::cloudera::cdh5::hadoop::secondary_namenode'
  include '::role::accumulo::master'
  include '::role::accumulo::monitor'
  include '::role::accumulo::tracer'
  include '::role::accumulo::gc'
  include '::role::rabbitmq::node'

  # hadoop datanode 1
  include '::role::cloudera::cdh5::hadoop::datanode'
  include '::role::cloudera::cdh5::hadoop::yarn::nodemanager'
  include '::role::accumulo::tablet'
  include '::role::cloudera::cdh5::zookeeper::node'
  include '::role::graph_property_worker'
  #include '::role::lumify::webserver'

  # elastic search data node 1
  include '::role::elasticsearch::node'
}