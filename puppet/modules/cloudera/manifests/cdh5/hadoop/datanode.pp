class cloudera::cdh5::hadoop::datanode {
  include cloudera::cdh5::hadoop::base

  package { 'hadoop-hdfs-datanode':
    ensure  => installed,
    require => Class['::cloudera::cdh5::hadoop::base'],
  }

  service { 'hadoop-hdfs-datanode' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [ Package['hadoop-hdfs-datanode'], Service['hadoop-yarn-nodemanager'], ]
  }
}
