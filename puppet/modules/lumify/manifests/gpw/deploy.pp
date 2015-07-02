class lumify::gpw::deploy inherits lumify{

  #include 'cloudera::cdh5::hadoop::datanode'

  exec { 'copy-gpw-jars' :
    command => "/bin/mkdir -p /tmp/gpw && /bin/cp $lumify_gpw_jars/* $target_gpw_jar_location"
  }

  exec { 'copy-config' :
    command => "/bin/mkdir -p /tmp/config && /bin/cp $lumify_config_dir/lumify.properties $target_config_location && /bin/cp $lumify_config_dir/log4j.xml $target_config_location && /bin/cp -R $lumify_config_dir/knownEntities $target_config_location && /bin/cp -R $lumify_config_dir/opencv $target_config_location && /bin/cp -R $lumify_config_dir/opennlp $target_config_location"
  }


  exec { 'create-lumify-hdfs-directories' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -mkdir -p /lumify && hadoop fs -mkdir -p /lumify/libcache ",
   require    => [  Class['::cloudera::cdh5::hadoop::namenode'], ],
  }

  exec { 'deploy-lumify-gpw' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -put $target_gpw_jar_location/* $lumify_hdfs_gpw_directory",
    require    => [  Class['::cloudera::cdh5::hadoop::namenode'], ],
  }

  exec { 'deploy-lumify-config' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -put $target_config_location /lumify/",
   require    => [  Class['::cloudera::cdh5::hadoop::namenode'], ],
  }

 }

