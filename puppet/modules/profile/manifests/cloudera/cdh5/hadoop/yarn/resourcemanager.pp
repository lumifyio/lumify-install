class profile::cloudera::cdh5::hadoop::yarn::resourcemanager {
  class { '::java': }
  class { '::cloudera::cdh5::hadoop::yarn::resourcemanager': }
}