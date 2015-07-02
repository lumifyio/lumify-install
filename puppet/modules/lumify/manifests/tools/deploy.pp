class lumify::tools::deploy inherits lumify{
  exec { 'deploy-tools' :
    command => "/bin/mkdir -p /tmp/tools && /bin/cp $lumify_tools_jars/* $target_tools_jar_location"
  }
}