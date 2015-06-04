class cloudera::cdh5::hadoop::yarn::historyserver {
  include cloudera::cdh5::hadoop::yarn::base

  package { 'hadoop-mapreduce-historyserver':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::yarn::base::mapred_pkg],
  }
}
