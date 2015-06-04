class cloudera::cdh5::config::pseudo {
  require cloudera::cdh5::hadoop::base

  package { 'hadoop-conf-pseudo':
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::base::pkg],
  }
}
