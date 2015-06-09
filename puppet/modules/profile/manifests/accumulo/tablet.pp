class profile::cloudera::cdh5::hadoop::datanode {
  class { '::java': }
  class { '::cloudera::cdh5::hadoop::datanode': }
  class { '::cloudera::cdh5::hadoop::yarn::nodemanager': }
  class { '::accumulo': }
  class { '::accumulo::tablet': }
}