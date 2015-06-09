class profile::cloudera::cdh5::zookeeper::node {
  class { '::java': }
  class { '::cloudera::cdh5::zookeeper::zookeeper': }
}