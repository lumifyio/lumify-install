class cloudera::cdh5::hadoop::datanode {
  include cloudera::cdh5::hadoop::base

  package { 'hadoop-hdfs-datanode':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::base::pkg],
  }

  service { 'hadoop-hdfs-datanode' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [ Package['hadoop-hdfs-datanode'], Service['hadoop-yarn-nodemanager'], ]
  }
}
