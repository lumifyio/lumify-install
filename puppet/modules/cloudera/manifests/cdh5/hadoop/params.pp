class cloudera::cdh5::hadoop::params {
  $version                          = '9.2.7.v20150116'
  $jetty_insecure_listen_port       = '8080'
  $jetty_confidential_listen_port   = '8443'
  $jetty_confidential_redirect_port = '8443'
  $jetty_key_store_path             = '/opt/jetty/config/jetty.jks'
  $jetty_key_store_password         = 'OBF:1v2j1uum1xtv1zej1zer1xtn1uvk1v1v'
  $jetty_trust_store_path           = '/opt/jetty/config/jetty.jks'
  $jetty_trust_store_password       = 'OBF:1v2j1uum1xtv1zej1zer1xtn1uvk1v1v'
  $jetty_client_auth                = 'false'

  case $architecture {
    'x86_64': { $pkg = 'hadoop.x86_64' }
    'i386':   { $pkg = 'hadoop.i686' }
    default:  { fail "unsupported architecture: ${architecture}" }
  }

  $namenode_ipaddress               = $ipaddress_eth1
  $namenode_rpc_address             = '0.0.0.0:8020'
  $namenode_rpc_bind_host           = '0.0.0.0'
  $namenode_hostname                = 'lumify.vm.local'
  $datanode_address                 = '0.0.0.0:50010'
  $datanode_ipc_address             = '0.0.0.0:50020'
  $hadoop_masters                   = [ "${ipaddress_eth1}", ]
  $hadoop_slaves                    = [ "${ipaddress_eth1}", ]
  $historyserver_hostname           = 'lumify.vm.local'
  $hadoop_ha_enabled                = 'false'
  $data_directories                 = [ '/data0', ]
  $hadoop_replication               = '1'
  $hadoop_ha_cluster_name           = 'lumify.vm.local'
  $hadoop_namenode_rpc_port         = '8020'
  $hadoop_namenode_http_port        = '50070'
  $hadoop_namenodes                 = []
  $hadoop_ha_journalnodes           = []
  $zookeeper_nodes                  = []
  $hadoop_hdfs_log_dir              = '/var/log/hadoop-hdfs'
  $hadoop_yarn_log_dir              = '/var/log/hadoop-yarn'
  $hadoop_mapreduce_log_dir         = '/var/log/hadoop-mapreduce'
  $yarn_resourcemanager_hostname    = 'lumify.vm.local'
  $yarn_nodemanager_resource_memory = '1024'
  $yarn_max_vcores                  = '4'
  $yarn_resourcemanager_min_vcores  = '1'
  $yarn_resourcemanager_max_vcores  = '32'
  $yarn_resourcemanager_incr_vcores = '1'
  $yarn_resourcemanager_min_memory  = '1024'
  $yarn_resourcemanager_max_memory  = '65536'
  $yarn_resourcemanager_incr_memory = '512'
  $mapreduce_map_memory             = '1024'
  $mapreduce_map_vcores             = '1'
  $mapreduce_reduce_memory          = '1024'
  $mapreduce_reduce_vcores          = '1'
  $yarn_mapreduce_am_memory         = '1024'
  $yarn_mapreduce_am_commandopts    = '-Xmx800M'
  $yarn_mapreduce_am_vcores         = '1'
}