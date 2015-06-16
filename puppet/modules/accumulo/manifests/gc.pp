class accumulo::gc inherits accumulo {
  $service_name = 'gc'
  file { '/etc/init/accumulo-gc.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }

  exec { 'start-accumulo-gc':
    command => '/sbin/initctl start accumulo-gc',
    require => [ Class['::accumulo::install', '::accumulo::config'], File['/etc/init/accumulo-gc.conf'] ],
  }
}
