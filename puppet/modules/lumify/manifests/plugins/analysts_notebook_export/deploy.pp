class lumify::plugins::analysts_notebook_export::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "analysts_notebook_export_lib_dir}" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "analysts_notebook_export_config_dir" :
    dir     => "${lumify_config_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_config_dir}/lumify-analysts-notebook-export.properties" :
    ensure  => file,
    content => template('lumify/analysts-notebook-export.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }

  file { "$lumify_target_lib_dir}/lumify-analysts-notebook-export-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-analysts-notebook-export-${lumify_version}.jar",
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
