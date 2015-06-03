class cloudera::cdh5::zookeeper::config inherits cloudera::cdh5::zookeeper::zookeeper {

  file { "${zookeeper_log_dir}":
    ensure => "directory",
    owner  => "zookeeper",
    require => Class['::cloudera::cdh5::zookeeper::install'],
  }

  file { "${zookeeper_config_dir}/zoo.cfg":
    ensure  => file,
    content => template('cloudera/cdh5/zookeeper/zoo.cfg.erb'),
    require => Class['::cloudera::cdh5::zookeeper::install'],
  }
}