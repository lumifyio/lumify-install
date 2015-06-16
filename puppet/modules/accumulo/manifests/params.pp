class accumulo::params(
  $version                                        = "1.6.1",
  $user                                           = "accumulo",
  $group                                          = "hadoop",
  $install_dir                                    = "/opt",
  $bin_dir                                        = "/opt/accumulo/bin",
  $log_dir                                        = "/opt/accumulo/logs",
  $tmp_dir                                        = '/tmp',
  $accumulo_instance_name                         = 'accumulo',
  $accumulo_root_password                         = 'password',
  $accumulo_instance_secret                       = 'DEFAULT',
  $accumulo_masters                               = [ "${ipaddress_eth1}", ],
  $accumulo_slaves                                = [ "${ipaddress_eth1}", ],
  $accumulo_example_config                        = '512MB/native-standalone',
  $accumulo_tserver_memory_maps_max               = '2G', # table.compaction.minor.logs.threshold * tserver.walog.max.size >= tserver.memory.maps.max
  $accumulo_tserver_walog_max_size                = '1G', # table.compaction.minor.logs.threshold * tserver.walog.max.size >= tserver.memory.maps.max
  $accumulo_table_compaction_minor_logs_threshold = '3',  # table.compaction.minor.logs.threshold * tserver.walog.max.size >= tserver.memory.maps.max
  $accumulo_tserver_memory_maps_native_enabled    = false,
  $accumulo_tserver_cache_data_size               = '128M',
  $accumulo_tserver_cache_index_size              = '128M',
  $accumulo_trace_user                            = 'root',
  $zookeeper_home                                 = '/usr/lib/zookeeper',
  $zookeeper_nodes                                = { '1' => "${zookeeper_node_ip}:2181" },
  $hadoop_prefix                                  = '/usr/lib/hadoop',
  $namenode_ipaddress                             = [ "${ipaddress_eth1}", ],
  $namenode_hostname                              = 'lumify-vm.lumify.io',
  $java_home                                      = '/usr/java/default',
  $java_heap_size                                 = '2g',
) {
  if $interfaces =~ /eth1/ {
    $accumulo_host_address = $ipaddress_eth1
  } else {
    $accumulo_host_address = $ipaddress_eth0
  }

  $home_dir = "${install_dir}/accumulo-${version}"
  $home_link = "${install_dir}/accumulo"
  $config_dir = "${home_dir}/conf"
  $config_link = "${home_link}/conf"
  $download_file = "accumulo-${version}-bin.tar.gz"
  $download_path = "${tmp_dir}/${download_file}"
}