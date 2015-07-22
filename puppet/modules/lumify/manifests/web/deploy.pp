class lumify::web::deploy inherits lumify{

  exec { 'add-jetty-lumify-group' :
    command => "/usr/sbin/usermod -a -G lumify jetty"  }

  file {$target_war_location :
    ensure  => file,
    source => $lumify_war_file,
    owner   => 'jetty',
    group   => 'jetty',
  }

  file { $target_lumify_context :
    ensure  => file,
    owner   => 'jetty',
    group   => 'jetty',
    content => template('lumify/lumify.xml.erb'),
    require    => [  Class['::jetty::service'],]
  }
}