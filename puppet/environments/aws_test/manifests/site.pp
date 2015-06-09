# management node 1
node 'ip-10-0-4-11' {
  include '::role::cloudera::cdh5::hadoop::namenode'
  include '::role::cloudera::cdh5::hadoop::yarn::resourcemanager'
  include '::role::cloudera::cdh5::hadoop::yarn::historyserver'
  include '::role::rabbitmq::node'
}

# management node 2
node 'ip-10-0-4-12' {
  include '::role::cloudera::cdh5::hadoop::secondary_namenode'
  include '::role::accumulo::master'
  include '::role::accumulo::monitor'
  include '::role::accumulo::tracer'
  include '::role::accumulo::gc'
  include '::role::rabbitmq::node'
}




# hadoop datanode 1
node 'ip-10-0-4-111' {
  include '::role::cloudera::cdh5::hadoop::datanode'
  include '::role::cloudera::cdh5::hadoop::yarn::nodemanager'
  include '::role::accumulo::tablet'
  include '::role::cloudera::cdh5::zookeeper::node'
  include '::role::graph_property_worker'
  include '::role::lumify::webserver'
}

# hadoop datanode 2
node 'ip-10-0-4-112' {
  include '::role::cloudera::cdh5::hadoop::datanode'
  include '::role::cloudera::cdh5::hadoop::yarn::nodemanager'
  include '::role::accumulo::tablet'
  include '::role::cloudera::cdh5::zookeeper::node'
  include '::role::graph_property_worker'
}

# hadoop datanode 3
node 'ip-10-0-4-113' {
  include '::role::cloudera::cdh5::hadoop::datanode'
  include '::role::cloudera::cdh5::hadoop::yarn::nodemanager'
  include '::role::accumulo::tablet'
  include '::role::cloudera::cdh5::zookeeper::node'
  include '::role::graph_property_worker'
}




# elasticsearch node 1
node 'ip-10-0-4-114' {
  include '::role::elasticsearch::node'
}

# elasticsearch node 2
node 'ip-10-0-4-115' {
  include '::role::elasticsearch::node'
}

# elasticsearch node 3
node 'ip-10-0-4-116' {
  include '::role::elasticsearch::node'
}