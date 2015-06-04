class accumulo::master inherits accumulo {
  $service_name = 'master'
  file { '/etc/init/accumulo-master.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb")
  }
}
