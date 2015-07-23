class lumify::plugins::auth_username_password::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "auth_username_password_lib_dir" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "auth_username_password_config_dir" :
    dir     => "${lumify_config_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_config_dir}/forgot-password.properties" :
    ensure  => file,
    content => template('lumify/forgot-password.properties.erb'),
    require => Macro::Ensure_dir["auth_username_password_config_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }

  file { "${lumify_target_lib_dir}/lumify-web-auth-username-password-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-web-auth-username-password-${lumify_version}.jar",
    require => Macro::Ensure_dir["auth_username_password_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
