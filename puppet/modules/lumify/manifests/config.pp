class lumify::config inherits lumify {

  file { "${lumify_dir}" :
    ensure  => directory,
    owner   => 'jetty',
    group   => 'jetty',
    recurse => true,
    require => [ User['jetty'] ],
  }

  file { "${lumify_config_dir}" :
    ensure  => directory,
    owner   => 'jetty',
    group   => 'jetty',
    recurse => true,
    require => [ User['jetty'] ],
  }

  file { "${lumify_config_dir}/lumify.properties" :
    ensure  => file,
    content => template('lumify/lumify.properties.erb'),
    require => File['/opt/lumify/config'],
  }
}