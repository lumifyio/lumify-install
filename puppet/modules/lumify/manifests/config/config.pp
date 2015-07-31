class lumify::config::config inherits lumify {

  group { 'lumify' :
    ensure => present,
  }

  user { 'lumify' :
    ensure  => present,
    gid     => 'lumify',
    home    => '/lumify',
    require => Group['lumify'],

  }


  macro::ensure_dir{ "${lumify_dir}" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "${lumify_config_dir}" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "${lumify_logs_dir}" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,go=rwx',
    require => [ User['lumify'], Group['lumify'], ],
  }



  macro::ensure_dir{ "${lumify_target_lib_dir}" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_config_dir}/lumify.properties" :
    ensure  => file,
    content => template('lumify/lumify.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,go=rx',
  }

  file { "${lumify_config_dir}/lumify-clavin.properties" :
    ensure  => file,
    content => template('lumify/lumify-clavin.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,go=rx',
  }

  #file { "${lumify_config_dir}/lumify-oauth.properties" :
  #  ensure  => file,
  #  content => template('lumify/lumify-oauth.properties.erb'),
  #  require => Macro::Ensure_dir["${lumify_config_dir}"],
  #  owner   => 'lumify',
  #  group   => 'lumify',
  #  mode    => 'u=rwx,go=rx',
  #}

  file { "${lumify_config_dir}/bingTranslate.properties" :
    ensure  => file,
    content => template('lumify/bingTranslate.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,go=rx',
  }

  file { "${lumify_config_dir}/google-analytics.properties" :
    ensure  => file,
    content => template('lumify/google-analytics.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,go=rx',
  }

  file { "${lumify_config_dir}/log4j.xml" :
    ensure  => file,
    content => template('lumify/log4j.xml.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,go=rx',
  }
}