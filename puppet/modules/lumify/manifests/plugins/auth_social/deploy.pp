class lumify::plugins::auth_social::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "auth_social_lib_dir" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "auth_social_config_dir" :
    dir     => "${lumify_config_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_target_lib_dir}/lumify-web-auth-social-${lumify_version}-jar-with-dependencies.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-web-auth-social-${lumify_version}-jar-with-dependencies.jar",
    require => Macro::Ensure_dir["auth_social_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }

  file { "${lumify_config_dir}/lumify-oauth.properties" :
    ensure  => file,
    content => template('lumify/lumify-oauth.properties.erb'),
    require => Macro::Ensure_dir["auth_social_config_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
