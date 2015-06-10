class cloudera::cdh5::hadoop::secondary_namenode {
  include cloudera::cdh5::hadoop::base

  package { 'hadoop-hdfs-secondarynamenode':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::base::pkg],
  }
}
