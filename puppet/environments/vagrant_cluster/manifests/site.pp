# management node 1
node /vc-m1\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::rabbitmq::node'
  include '::role::cloudera::cdh5::zookeeper::node'
  include '::role::cloudera::cdh5::hadoop::namenode'
  include '::role::cloudera::cdh5::hadoop::journalnode'
  include '::role::cloudera::cdh5::hadoop::yarn::resourcemanager'
#  include '::role::lumify_backend'
#  include '::role::accumulo::master'
}

# management node 2
node /vc-m2\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::rabbitmq::node'
  include '::role::cloudera::cdh5::zookeeper::node'
  include '::role::cloudera::cdh5::hadoop::secondary_namenode'
  include '::role::cloudera::cdh5::hadoop::journalnode'
  include '::role::cloudera::cdh5::hadoop::yarn::historyserver'
#  include '::role::cloudera::cdh5::hadoop::yarn::resourcemanager'
#  include '::role::lumify::jobs'
}

# management node 3
node /vc-m3\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::cloudera::cdh5::zookeeper::node'
  include '::role::cloudera::cdh5::hadoop::journalnode'
  include '::role::accumulo::master'
  include '::role::accumulo::monitor'
  include '::role::accumulo::tracer'
  include '::role::accumulo::gc'
}

# hadoop datanode 1
node /vc-hdn1\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::graph_property_worker'
  include '::role::cloudera::cdh5::hadoop::yarn::nodemanager'
  include '::role::cloudera::cdh5::hadoop::datanode'
  include '::role::accumulo::tablet'
#  include '::role::lumify::jobs'
#  include '::role::lumify'
}

# hadoop datanode 2
node /vc-hdn2\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::graph_property_worker'
  include '::role::cloudera::cdh5::hadoop::yarn::nodemanager'
  include '::role::cloudera::cdh5::hadoop::datanode'
  include '::role::accumulo::tablet'
#  include '::role::lumify::webserver'
}

# hadoop datanode 3
node /vc-hdn3\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::graph_property_worker'
  include '::role::cloudera::cdh5::hadoop::yarn::nodemanager'
  include '::role::cloudera::cdh5::hadoop::datanode'
  include '::role::accumulo::tablet'
#  include '::role::lumify::client'
}

# elasticsearch node 1
node /vc-esn1\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::elasticsearch::node'
}

# elasticsearch node 2
node /vc-esn2\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::elasticsearch::node'
}

# elasticsearch node 3
node /vc-esn3\d*\.vm\.local/ {
  include '::iptables'
  include '::ipv6'
  include '::swappiness'
  include '::role::elasticsearch::node'
}