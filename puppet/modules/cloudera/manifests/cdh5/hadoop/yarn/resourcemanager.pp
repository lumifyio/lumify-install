class cloudera::cdh5::hadoop::yarn::resourcemanager {
  include cloudera::cdh5::hadoop::yarn::base

  package { 'hadoop-yarn-resourcemanager':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::yarn::base::yarn_pkg],
  }

  service { 'hadoop-yarn-resourcemanager' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['hadoop-yarn-resourcemanager']
  }
}
