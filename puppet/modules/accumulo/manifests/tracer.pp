class accumulo::tracer inherits accumulo {
  $service_name = 'tracer'
  file { '/etc/init/accumulo-tracer.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }

  exec { 'start-accumulo-tracer':
    command => '/sbin/initctl start accumulo-tracer',
    require => [ Class['::accumulo::install', '::accumulo::config'], File['/etc/init/accumulo-tracer.conf'] ],
  }
}
