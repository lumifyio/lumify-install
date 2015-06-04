class cloudera::cdh5::hadoop::yarn::nodemanager {
  include cloudera::cdh5::hadoop::yarn::base

  package { 'hadoop-yarn-nodemanager':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::yarn::base::yarn_pkg],
  }
}
