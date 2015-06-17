class lumify::web::deploy inherits lumify{

  include '::jetty'

  file {$target_war_location :
    ensure  => file,
    source => $lumify_war_file,
    owner   => 'jetty',
    group   => 'jetty',
  }

  exec { 'copy-lumify-lib' :
    command => "/bin/cp $lumify_deployed_libs/* $lumify_target_lib_dir && /bin/chown -R jetty:jetty $lumify_target_lib_dir"
  }

}