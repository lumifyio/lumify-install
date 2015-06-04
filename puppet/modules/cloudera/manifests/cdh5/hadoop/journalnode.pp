class cloudera::cdh5::hadoop::journalnode {
  include cloudera::cdh5::hadoop::base

  package { 'hadoop-hdfs-journalnode':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::base::pkg],
  }
}
