class lumify::tools::deploy(
  $target_jar_location= $lumify::params::target_jar_location,
  $lumify_gpw_jars= $lumify::params::lumify_gpw_jars,
  $target_yarn_jar_location=$lumify::params::target_yarn_jar_location,
  $lumify_yarn_jars=$lumify::params::lumify_yarn_jars,
  $target_tools_jar_location=$lumify::params::target_tools_jar_location,
  $lumify_tools_jars=$lumify::params::lumify_tools_jars,
  $lumify_hdfs_gpw_directory=$lumify::params::lumify_hdfs_gpw_directory,

)
inherits lumify::params{
  exec { 'deploy-tools' :
    command => "/bin/mkdir /tmp/tools && /bin/cp $lumify_tools_jars/* $target_tools_jar_location"
  }
}