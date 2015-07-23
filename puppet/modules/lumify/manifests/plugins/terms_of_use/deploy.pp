class lumify::plugins::terms_of_use::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "terms_of_use_lib_dir" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "terms_of_use_config_dir" :
    dir     => "${lumify_config_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_config_dir}/lumify-terms-of-use.properties" :
    ensure  => file,
    content => template('lumify/lumify-terms-of-use.properties.erb'),
    require => Macro::Ensure_dir["terms_of_use_config_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }

  file { "${lumify_target_lib_dir}/lumify-terms-of-use-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-terms-of-use-${lumify_version}.jar",
    require => Macro::Ensure_dir["terms_of_use_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
