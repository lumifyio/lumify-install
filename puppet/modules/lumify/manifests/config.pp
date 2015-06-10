class lumify::config inherits lumify {

  file { "${lumify_dir}" :
    ensure  => directory,
    owner   => 'jetty',
    group   => 'jetty',
    recurse => true,
    require => [ User['jetty'] ],
  }

  file { [ "${lumify_config_dir}", "${lumify_logs_dir}", "${$clavin_index_dir}" ] :
    ensure  => directory,
    owner   => 'jetty',
    group   => 'jetty',
    recurse => true,
    require => [ User['jetty'], File["${lumify_dir}"] ]
  }

  file { "${lumify_config_dir}/lumify.properties" :
    ensure  => file,
    content => template('lumify/lumify.properties.erb'),
    require => File["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/lumify-clavin.properties" :
    ensure  => file,
    content => template('lumify/lumify-clavin.properties.erb'),
    require => File["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/lumify-oauth.properties" :
    ensure  => file,
    content => template('lumify/lumify-oauth.properties.erb'),
    require => File["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/lumify-terms-of-use.properties" :
    ensure  => file,
    content => template('lumify/lumify-terms-of-use.properties.erb'),
    require => File["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/bingTranslate.properties" :
    ensure  => file,
    content => template('lumify/bingTranslate.properties.erb'),
    require => File["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/google-analytics.properties" :
    ensure  => file,
    content => template('lumify/google-analytics.properties.erb'),
    require => File["${lumify_config_dir}"],
  }

  file { "${lumify_config_dir}/log4j.xml" :
    ensure  => file,
    content => template('lumify/log4j.xml.erb'),
    require => File["${lumify_config_dir}"],
  }
}