class accumulo::master inherits accumulo {

  include '::accumulo::install'
  include '::accumulo::config'

  $service_name = 'master'
  file { '/etc/init/accumulo-master.conf':
    ensure  => file,
    content => template("accumulo/upstart.conf.erb"),
  }

  exec { 'initialize-accumulo':
    command => "/usr/bin/sudo -u ${user} ${bin_dir}/accumulo init --clear-instance-name --instance-name ${accumulo_instance_name} --password ${accumulo_root_password}",
    require => [ Class['accumulo::install', 'accumulo::config'], File['/etc/init/accumulo-master.conf'], ],
  }

  exec { 'start-accumulo-master':
    command => "/sbin/initctl start accumulo-master",
    require => [ Class['accumulo::install', 'accumulo::config'], File['/etc/init/accumulo-master.conf'], Exec['initialize-accumulo'], ],
  }
}
