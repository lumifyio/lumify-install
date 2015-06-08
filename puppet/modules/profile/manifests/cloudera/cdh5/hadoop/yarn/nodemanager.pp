class profile::cloudera::cdh5::hadoop::yarn::nodemanager {
  class { '::java': }
  class { '::cloudera::cdh5::hadoop::yarn::nodemanager': }
}