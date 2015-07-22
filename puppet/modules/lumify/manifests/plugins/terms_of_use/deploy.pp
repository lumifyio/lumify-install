class lumify::opennlp_dictionary_extractor::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "${lumify_target_lib_dir}" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  macro::ensure_dir{ "${lumify_config_dir}" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "${lumify_config_dir}/lumify-opennlp-dictionary-extractor.properties" :
    ensure  => file,
    content => template('lumify/lumify-opennlp-dictionary-extractor.properties.erb'),
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }

  file { "$lumify_target_lib_dir}/lumify-opennlp-dictionary-extractor-${lumify_version}.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-opennlp-dictionary-extractor-${lumify_version}.jar",
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
