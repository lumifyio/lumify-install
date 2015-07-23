class lumify::plugins::auth_username_only::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "auth_username_only_lib_dir" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_target_lib_dir}/lumify-web-auth-username-only-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-web-auth-username-only-${lumify_version}.jar",
    require => Macro::Ensure_dir["auth_username_only_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
