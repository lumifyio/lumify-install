class lumify::opennlp-dictionary-extractor::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "${lumify_target_lib_dir}" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rwx,g=rx,o=rx',
    require => [ User['lumify'], Group['lumify'], ],
  }

  file { "$lumify_target_lib_dir}/lumify-opennlp-dictionary-extractor-${lumify_version}-jar-with-dependencies.jar" :
    ensure  => file,
    source  => "${lumify_deployed_libs}/lumify-opennlp-dictionary-extractor-${lumify_version}-jar-with-dependencies.jar",
    require => Macro::Ensure_dir["${lumify_config_dir}"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rw,go=r',
  }
}
