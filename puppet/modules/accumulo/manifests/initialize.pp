class accumulo::initialize inherits accumulo {
  include '::accumulo::install'
  include '::accumulo::config'

  package { 'expect':
    ensure => installed,
  }

  file { '/tmp/initialize-accumulo-script.sh':
    ensure => file,
    content => template("accumulo/initialize-accumulo-script.sh.erb"),
  }

  exec { 'initialize-accumulo':
    command => "/usr/bin/expect /tmp/initialize-accumulo-script.sh ${accumulo_instance_name} ${accumulo_root_password}",
    require => [ Class['accumulo::install', 'accumulo::config'], Package['expect'], File['/tmp/initialize-accumulo-script.sh'], ],
  }
}