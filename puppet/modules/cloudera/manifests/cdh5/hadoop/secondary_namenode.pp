class cloudera::cdh5::hadoop::secondary_namenode {
  include cloudera::cdh5::hadoop::base

  package { 'hadoop-hdfs-secondarynamenode':
    ensure  => installed,
    require => Class['::cloudera::cdh5::hadoop::base'],
  }

  service { 'hadoop-hdfs-secondarynamenode' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [ Package['hadoop-hdfs-secondarynamenode'],  ],
  }
}
