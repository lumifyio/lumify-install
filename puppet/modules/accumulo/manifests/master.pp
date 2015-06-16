class accumulo::master inherits accumulo {
  $service_name = 'master'
  file { '/etc/init/accumulo-master.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }

  exec { 'start-accumulo-master':
    command => "/sbin/initctl start accumulo-master",
    require => [ Class['::accumulo::install', '::accumulo::config', '::accumulo::initialize'], File['/etc/init/accumulo-master.conf'] ],
  }
}
