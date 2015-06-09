class profile::cloudera::cdh5::hadoop::yarn::historymanager {
  class { '::java': }
  class { '::cloudera::cdh5::hadoop::yarn::historymanager': }
}