class lumify::plugins::auth_x509::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "auth_x509_lib_dir}" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_target_lib_dir}/lumify-web-auth-x509-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-web-auth-x509-${lumify_version}.jar",
    require => Macro::Ensure_dir["auth_x509_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
