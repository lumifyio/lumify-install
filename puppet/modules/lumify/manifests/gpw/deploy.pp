class lumify::gpw::deploy(
  $target_jar_location= $lumify::params::target_jar_location,
  $lumify_gpw_jars= $lumify::params::lumify_gpw_jars,
  $target_yarn_jar_location=$lumify::params::target_yarn_jar_location,
  $lumify_yarn_jars=$lumify::params::lumify_yarn_jars,
  $target_tools_jar_location=$lumify::params::target_tools_jar_location,
  $lumify_tools_jars=$lumify::params::lumify_tools_jars,
  $lumify_hdfs_gpw_directory=$lumify::params::lumify_hdfs_gpw_directory,

)
inherits lumify::params{

  include 'cloudera::cdh5::hadoop::datanode'

  exec { 'copy-gpw-jars' :
    command => "/bin/mkdir /tmp/gpw && /bin/cp $lumify_gpw_jars/* $target_gpw_jar_location"
  }

  exec { 'copy-config' :
    command => "/bin/mkdir /tmp/config && /bin/cp $lumify_config/lumify.properties $target_config_location && /bin/cp $lumify_config/log4j.xml $target_config_location && /bin/cp -R $lumify_config/knownEntities $target_config_location && /bin/cp -R $lumify_config/opencv $target_config_location && /bin/cp -R $lumify_config/opennlp $target_config_location"
  }

  exec { 'cleanup-lumify-hdfs-directories' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -rmr -p /lumify",
    require    => [  Class['::cloudera::cdh5::hadoop::datanode'], ],
  }
  exec { 'create-lumify-hdfs-directories' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -mkdir -p /lumify && hadoop fs -mkdir -p /lumify/libcache ",
    require    => [  Class['::cloudera::cdh5::hadoop::datanode'], ],
  }

  exec { 'deploy-lumify-gpw' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -put $target_gpw_jar_location/* $lumify_hdfs_gpw_directory",
    require    => [  Class['::cloudera::cdh5::hadoop::datanode'], ],
  }

  exec { 'deploy-lumify-config' :
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "hadoop fs -put $target_config_location /lumify/",
    require    => [  Class['::cloudera::cdh5::hadoop::datanode'], ],
  }

 }

