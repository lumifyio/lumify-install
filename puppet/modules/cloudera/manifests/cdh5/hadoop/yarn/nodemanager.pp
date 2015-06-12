class cloudera::cdh5::hadoop::yarn::nodemanager {
  include cloudera::cdh5::hadoop::yarn::base

  package { 'hadoop-yarn-nodemanager':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::yarn::base::yarn_pkg],
  }

  service { 'hadoop-yarn-nodemanager' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['hadoop-yarn-nodemanager']
  }

}
