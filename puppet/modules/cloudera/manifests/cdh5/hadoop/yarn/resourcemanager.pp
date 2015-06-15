class cloudera::cdh5::hadoop::yarn::resourcemanager {
  include cloudera::cdh5::hadoop::yarn::base

  package { 'hadoop-yarn-resourcemanager':
    ensure  => installed,
    require => Class['::cloudera::cdh5::hadoop::yarn::base'],
  }

  service { 'hadoop-yarn-resourcemanager' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['hadoop-yarn-resourcemanager']
  }
}
