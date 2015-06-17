class lumify::yarn::run(
  $target_jar_location= $lumify::params::target_jar_location,
  $lumify_gpw_jars= $lumify::params::lumify_gpw_jars,
  $target_yarn_jar_location=$lumify::params::target_yarn_jar_location,
  $lumify_yarn_jars=$lumify::params::lumify_yarn_jars,
  $target_tools_jar_location=$lumify::params::target_tools_jar_location,
  $lumify_tools_jars=$lumify::params::lumify_tools_jars,
  $lumify_hdfs_gpw_directory=$lumify::params::lumify_hdfs_gpw_directory,

)
inherits lumify::params{

  exec { 'run-gpw-yarn' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "sudo su - yarn && yarn jar $target_yarn_jar_location/lumify-long-running-process-yarn-0.5.0-SNAPSHOT-with-dependencies.jar -jar /$target_yarn_jar_location/lumify-long-running-process-yarn-0.5.0-SNAPSHOT-with-dependencies.jar",
    require    => [ Class['::lumify::gpw::deploy'], Class['::lumify::yarn::deploy'], ],
  }

  exec { 'run-long-running-yarn' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "sudo su - yarn && yarn jar $target_yarn_jar_location/lumify-graph-property-worker-yarn-0.5.0-SNAPSHOT-with-dependencies.jar -jar $target_yarn_jar_location/lumify-graph-property-worker-yarn-0.5.0-SNAPSHOT-with-dependencies.jar &",
    require    => [  Class['::lumify::gpw::deploy'], Class['::lumify::yarn::deploy'], ],
  }

}
