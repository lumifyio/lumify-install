class lumify::web::config inherits lumify {

  include '::jetty'


  macro::ensure_dir{ "${lumify_dir}" :
    owner   => 'jetty',
    group   => 'jetty',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['jetty'], Group['jetty'], ],
  }

  macro::ensure_dir{ "${lumify_config_dir}" :
    owner   => 'jetty',
    group   => 'jetty',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['jetty'], Group['jetty'], ],
  }

  macro::ensure_dir{ "${lumify_logs_dir}" :
    owner   => 'jetty',
    group   => 'jetty',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['jetty'], Group['jetty'], ],
  }

  macro::ensure_dir{ "${clavin_index_dir}" :
    owner   => 'jetty',
    group   => 'jetty',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['jetty'], Group['jetty'], ],
  }

  macro::ensure_dir{ "${lumify_target_lib_dir}" :
    owner   => 'jetty',
    group   => 'jetty',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['jetty'], Group['jetty'], ],
  }

  file { "${lumify_config_dir}/lumify.properties" :
    ensure  => file,
    content => template('lumify/lumify.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/lumify-clavin.properties" :
    ensure  => file,
    content => template('lumify/lumify-clavin.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/lumify-oauth.properties" :
    ensure  => file,
    content => template('lumify/lumify-oauth.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/lumify-terms-of-use.properties" :
    ensure  => file,
    content => template('lumify/lumify-terms-of-use.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/bingTranslate.properties" :
    ensure  => file,
    content => template('lumify/bingTranslate.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/google-analytics.properties" :
    ensure  => file,
    content => template('lumify/google-analytics.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/log4j.xml" :
    ensure  => file,
    content => template('lumify/log4j.xml.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
  }
}