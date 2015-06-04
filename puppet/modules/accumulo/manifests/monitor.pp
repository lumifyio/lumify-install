class accumulo::monitor inherits accumulo {
  $service_name = 'monitor'
  file { '/etc/init/accumulo-monitor.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }
}
