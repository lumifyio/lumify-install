class cloudera::cdh5::hadoop::namenode {
  include cloudera::cdh5::hadoop::base
  
  package { 'hadoop-hdfs-namenode':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::base::pkg],
  }
}
