class lumify::auth_x509::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "${lumify_target_lib_dir}" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "$lumify_target_lib_dir}/lumify-auth-x509-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-auth-x509-${lumify_version}.jar",
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
