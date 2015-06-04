class cloudera::cdh5::hadoop::zkfc {
  include cloudera::cdh5::hadoop::base

  package { 'hadoop-hdfs-zkfc':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::base::pkg],
  }
}
