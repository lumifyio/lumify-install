class lumify::web::deploy inherits lumify{

  include '::jetty'
  include '::macro'
  include '::lumify_global'

  file {$target_war_location :
    ensure  => file,
    source => $lumify_war_file,
    owner   => 'jetty',
    group   => 'jetty',
  }

}