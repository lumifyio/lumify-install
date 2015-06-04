class accumulo::gc inherits accumulo {
  $service_name = 'gc'
  file { '/etc/init/accumulo-gc.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }
}
