class cloudera::cdh5::zookeeper::install inherits cloudera::cdh5::zookeeper::zookeeper {

  include '::java'
  include '::cloudera::cdh5::repo'

  package { 'zookeeper-server':
    ensure  => installed,
    require => Class['java', 'cloudera::cdh5::repo'],
  }

  macro::ensure_dir{ "${$zookeeper_config_dir}" :
    owner   => 'root',
    group   => 'root',
    mode    => 'u=rwx,go=rx',
    require => Package['zookeeper-server'],
  }

  macro::ensure_dir{ "${$zookeeper_log_dir}" :
    owner   => $user,
    group   => $group,
    mode    => 'u=rwx,go=rx',
    require => Package['zookeeper-server'],
  }

  macro::ensure_dir{ "${$zookeeper_data_dir}" :
    owner   => $user,
    group   => $group,
    mode    => 'u=rwx,go=rx',
    require => Package['zookeeper-server'],
  }


}