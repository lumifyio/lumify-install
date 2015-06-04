class accumulo::config inherits accumulo {

  include '::macro'

  file { "${config_dir}/accumulo-env.sh" :
    ensure => file,
    content => template("accumulo/accumulo-env.sh.erb"),
    require => Class['accumulo::install'],
  }

  file { "${config_dir}/accumulo-site.xml" :
    ensure => file,
    content => template("accumulo/accumulo-site.xml.erb"),
    require => Class['accumulo::install'],
  }

  file { "${config_dir}/masters" :
    ensure => file,
    content => template("accumulo/masters.erb"),
    require => Class['accumulo::install'],
  }

  file { "${config_dir}/monitor" :
    ensure => file,
    content => template("accumulo/monitor.erb"),
    require => Class['accumulo::install'],
  }

  file { "${config_dir}/gc" :
    ensure => file,
    content => template("accumulo/gc.erb"),
    require => Class['accumulo::install'],
  }

  file { "${config_dir}/tracers" :
    ensure => file,
    content => template("accumulo/tracers.erb"),
    require => Class['accumulo::install'],
  }

  file { "${config_dir}/slaves" :
    ensure => file,
    content => template("accumulo/slaves.erb"),
    require => Class['accumulo::install'],
  }

  file { "${config_dir}/generic_logger.xml" :
    ensure => file,
    source => "puppet:///modules/accumulo/generic_logger.xml",
    require => Class['accumulo::install'],
  }

  file { "${config_dir}/monitor_logger.xml" :
    ensure => file,
    source => "puppet:///modules/accumulo/monitor_logger.xml",
    require => Class['accumulo::install'],
  }

  exec { "vm.swappiness=10 online" :
    command => "/sbin/sysctl -w vm.swappiness=10",
    unless  => "/usr/bin/test $(/sbin/sysctl -n vm.swappiness) -eq 10",
  }

  exec { "vm.swappiness=10 persistant" :
    command => '/bin/echo "vm.swappiness=10" >> /etc/sysctl.conf',
    unless  => "/bin/grep -q vm.swappiness=10 /etc/sysctl.conf",
  }

  file { "${config_dir}/.ssh":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0755',
    require => Class['accumulo::install'],
  }

  macro::setup_passwordless_ssh { $user :
    sshdir  => "${config_dir}/.ssh",
    require => File["${config_dir}/.ssh"],
  }
}