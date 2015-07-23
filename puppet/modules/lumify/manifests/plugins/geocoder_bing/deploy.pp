class lumify::plugins::geocoder_bing::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "geocoder_bing_lib_dir" :
    dir     => "${lumify_target_lib_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "geocoder_bing_config_dir" :
    dir     => "${lumify_config_dir}",
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_config_dir}/bingMaps.properties" :
    ensure  => file,
    content => template('lumify/bingMaps.erb'),
    require => Macro::Ensure_dir["geocoder_bing_config_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }

  file { "${lumify_target_lib_dir}/lumify-geocoder-bing-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-geocoder-bing-${lumify_version}.jar",
    require => Macro::Ensure_dir["geocoder_bing_lib_dir"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
