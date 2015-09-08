class lumify::plugins::auth_x509ldap::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "auth_x509ldap_lib_dir}" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "auth_x509ldap_config_dir" :
    dir     => "${lumify_config_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_config_dir}/ldap.properties" :
    ensure  => file,
    content => template('lumify/ldap.properties.erb'),
    require => Macro::Ensure_dir["auth_x509ldap_config_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }

  file { "${lumify_target_lib_dir}/lumify-web-auth-x509ldap-${lumify_version}-jar-with-dependencies.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-web-auth-x509ldap-${lumify_version}-jar-with-dependencies.jar",
    require => Macro::Ensure_dir["auth_x509ldap_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
