class cloudera::cdh5::hadoop::datanode {
  include cloudera::cdh5::hadoop::base

  package { 'hadoop-hdfs-datanode':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::base::pkg],
  }
}
