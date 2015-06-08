class profile::cloudera::cdh5::hadoop::namenode {
  class { '::java': }
  class { '::cloudera::cdh5::hadoop::namenode': }
}