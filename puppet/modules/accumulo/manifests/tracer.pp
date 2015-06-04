class accumulo::tracer inherits accumulo {
  $service_name = 'tracer'
  file { '/etc/init/accumulo-tracer.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }
}
