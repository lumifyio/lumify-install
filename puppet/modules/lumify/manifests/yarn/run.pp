class lumify::yarn::run inherits lumify{

  exec { 'run-gpw-yarn' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "/bin/su - yarn -c \"yarn jar $target_yarn_jar_location/lumify-long-running-process-yarn-0.5.0-SNAPSHOT-with-dependencies.jar -jar /$target_yarn_jar_location/lumify-long-running-process-yarn-0.5.0-SNAPSHOT-with-dependencies.jar\"",
    require    => [ Class['::lumify::gpw::deploy'], Class['::lumify::yarn::deploy'], ],
  }

  exec { 'run-long-running-yarn' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "/bin/su - yarn -c \"yarn jar $target_yarn_jar_location/lumify-graph-property-worker-yarn-0.5.0-SNAPSHOT-with-dependencies.jar -jar $target_yarn_jar_location/lumify-graph-property-worker-yarn-0.5.0-SNAPSHOT-with-dependencies.jar &\"",
    require    => [  Class['::lumify::gpw::deploy'], Class['::lumify::yarn::deploy'], ],
  }
}
