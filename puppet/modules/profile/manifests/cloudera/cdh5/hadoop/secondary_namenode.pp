class profile::cloudera::cdh5::hadoop::secondary_namenode {
  class { '::java': }
  class { '::cloudera::cdh5::hadoop::secondary_namenode': }
}