class cloudera::cdh5::hadoop::journalnode {
  include cloudera::cdh5::hadoop::base

  package { 'hadoop-hdfs-journalnode':
    ensure  => installed,
    require => Class['::cloudera::cdh5::hadoop::base'],
  }

  service { 'hadoop-hdfs-journalnode' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['hadoop-hdfs-journalnode']
  }
}
