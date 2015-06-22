class lumify::yarn::deploy(
  $target_jar_location= $lumify::params::target_jar_location,
  $lumify_gpw_jars= $lumify::params::lumify_gpw_jars,
  $target_yarn_jar_location=$lumify::params::target_yarn_jar_location,
  $lumify_yarn_jars=$lumify::params::lumify_yarn_jars,
  $target_tools_jar_location=$lumify::params::target_tools_jar_location,
  $lumify_tools_jars=$lumify::params::lumify_tools_jars,
  $lumify_hdfs_gpw_directory=$lumify::params::lumify_hdfs_gpw_directory,

)
inherits lumify::params{

  #include 'cloudera::cdh5::hadoop::datanode'

  exec { 'copy-yarn-jars' :
    command => "/bin/mkdir /tmp/yarn && /bin/cp $lumify_yarn_jars/* $target_yarn_jar_location"
  }

  exec { 'deploy-lumify-yarn' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -put $target_yarn_jar_location/* $lumify_hdfs_gpw_directory",
    require    => [  Class['::cloudera::cdh5::hadoop::namenode'], ],
  }

  exec { 'chmod-lumify-hdfs-directories' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -chmod -R a+w /lumify/",
     require    => [  Class['::cloudera::cdh5::hadoop::namenode'], ],
  }

 }

