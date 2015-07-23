class lumify::plugins::dev_tools::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "dev_tools_lib_dir}" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_target_lib_dir}/dev-tools-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/dev-tools-${lumify_version}.jar",
    require => Macro::Ensure_dir["dev_tools_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
