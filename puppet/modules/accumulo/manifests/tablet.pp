class accumulo::tablet inherits accumulo {
  $service_name = 'tserver'
  file { '/etc/init/accumulo-tserver.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }

  exec { 'start-accumulo-tablet':
    command => '/sbin/initctl start accumulo-tserver',
    require => [ Class['::accumulo::install', '::accumulo::config'], File['/etc/init/accumulo-tserver.conf'] ],
  }
}
