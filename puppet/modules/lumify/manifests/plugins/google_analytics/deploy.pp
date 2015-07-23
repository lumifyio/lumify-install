class lumify::plugins::google_analytics::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "google_analytics_lib_dir" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "google_analytics_config_dir" :
    dir     => "${lumify_config_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_config_dir}/google-analytics.properties" :
    ensure  => file,
    content => template('lumify/google-analytics.properties.erb'),
    require => Macro::Ensure_dir["google_analytics_config_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }

  file { "${lumify_target_lib_dir}/lumify-google-analytics-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-google-analytics-${lumify_version}.jar",
    require => Macro::Ensure_dir["google_analytics_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
