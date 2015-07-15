class lumify::gpw::deploy inherits lumify{

  exec { 'copy-gpw-jars' :
    command => "/bin/mkdir -p $target_gpw_jar_location && /bin/cp $lumify_gpw_jars/* $target_gpw_jar_location"
  }

  exec { 'copy-gpw-config' :
    command => "/bin/mkdir -p $target_config_location && /bin/cp -R $lumify_config_src_dir/knownEntities $target_config_location && /bin/cp -R $lumify_config_src_dir/opencv $target_config_location && /bin/cp -R $lumify_config_src_dir/opennlp $target_config_location"
  }


  exec { 'create-lumify-hdfs-directories' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -mkdir -p /lumify && hadoop fs -mkdir -p /lumify/libcache ",
  }

  exec { 'deploy-lumify-gpw' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -put $target_gpw_jar_location/* $lumify_hdfs_gpw_directory",

  }

  exec { 'deploy-lumify-gpw-config' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -put $target_config_location /lumify/",

  }
}

