class accumulo::install inherits accumulo {

  include '::java'
  include '::macro'
  include '::cloudera::cdh5::hadoop::base'
  include '::cloudera::cdh5::zookeeper::zookeeper'

  group { $group :
    ensure => present,
  }

  user { $user :
    ensure  => present,
    gid     => $group,
    home    => $config_link,
    require => Group[$group]
  }

  macro::ensure_dir{ "${log_dir}" :
    owner   => "${user}",
    group   => "${group}",
    mode    => 'u=rwx,g=rwx,o=rx',
    require =>  [ User[$user], Group[$group] ],
  }

  macro::ensure_dir{ "${tmp_dir}" :
    owner   => "${user}",
    group   => "${group}",
    mode    => 'u=rwx,g=rwx,o=rx',
    require =>  [ User[$user], Group[$group] ],
  }

  macro::download { 'download-accumulo':
    url     => "http://archive.apache.org/dist/accumulo/${version}/${download_file}",
    path    => $download_path,
    require => [ User[$user], Group[$group], ],
  } -> macro::extract { 'extract-accumulo':
    file    => $download_path,
    path    => $install_dir,
    creates => "${install_dir}/accumulo-${version}",
  }

  file { $home_link:
    ensure  => link,
    target  => $home_dir,
    force => true,
    require => Macro::Extract['extract-accumulo'],
  }

  exec { "copy-example-accumulo-config" :
    command => "/bin/cp ${home_dir}/conf/examples/${accumulo_example_config}/* ${config_dir}",
    unless  => "/usr/bin/test -f ${config_dir}/accumulo-env.sh",
    require => Macro::Extract['extract-accumulo'],
  }
}