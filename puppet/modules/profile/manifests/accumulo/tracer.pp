class profile::cloudera::cdh5::hadoop::datanode {
  class { '::java': }
  class { '::accumulo': }
  class { '::accumulo::tracer': }
}