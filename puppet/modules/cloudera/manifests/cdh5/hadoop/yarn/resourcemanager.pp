class cloudera::cdh5::hadoop::yarn::resourcemanager {
  include cloudera::cdh5::hadoop::yarn::base

  package { 'hadoop-yarn-resourcemanager':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::yarn::base::yarn_pkg],
  }
}
