class lumify::yarn::deploy inherits lumify{

  #include 'cloudera::cdh5::hadoop::datanode'

  exec { 'copy-yarn-jars' :
    command => "/bin/mkdir -p $target_yarn_jar_location && /bin/cp $lumify_yarn_jars/* $target_yarn_jar_location"
  }

  exec { 'deploy-lumify-yarn' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -put $target_yarn_jar_location/* $lumify_hdfs_gpw_directory",
  }

  exec { 'chmod-lumify-hdfs-directories' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -chmod -R a+w /lumify/",

  }

 }

