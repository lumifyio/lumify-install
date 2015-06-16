class accumulo::monitor inherits accumulo {
  $service_name = 'monitor'
  file { '/etc/init/accumulo-monitor.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }

  exec { 'start-accumulo-monitor':
    command => '/sbin/initctl start accumulo-monitor',
    require => [ Class['::accumulo::install', '::accumulo::config'], File['/etc/init/accumulo-monitor.conf'] ],
  }
}
