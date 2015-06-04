class accumulo::tablet inherits accumulo {
  $service_name = 'tserver'
  file { '/etc/init/accumulo-tserver.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }
}
