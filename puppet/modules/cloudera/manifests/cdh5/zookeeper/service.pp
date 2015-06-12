class cloudera::cdh5::zookeeper::service inherits cloudera::cdh5::zookeeper::zookeeper {

  exec { 'initialize-zookeeper' :
    path => "/sbin",
    command => 'service zookeeper-server init --force',
    creates => '/var/lib/zookeeper/version-2',
    require => Class['::cloudera::cdh5::zookeeper::install', '::cloudera::cdh5::zookeeper::config'],
  }

  file { "${zookeeper_data_dir}/myid":
    ensure  => file,
    content => template('cloudera/cdh5/zookeeper/myid.erb'),
    mode    => 'u=rw,go=r',
    require => [ Class['::cloudera::cdh5::zookeeper::install', '::cloudera::cdh5::zookeeper::config'], Exec['initialize-zookeeper'], ],
  }

  service { 'zookeeper-server' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Exec['initialize-zookeeper']
  }
}