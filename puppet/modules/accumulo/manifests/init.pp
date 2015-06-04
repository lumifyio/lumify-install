class accumulo (
  $version                                        = $accumulo::params::version,
  $user                                           = $accumulo::params::user,
  $group                                          = $accumulo::params::group,
  $install_dir                                    = $accumulo::params::install_dir,
  $bin_dir                                        = $accumulo::params::bin_dir,
  $log_dir                                        = $accumulo::params::log_dir,
  $tmp_dir                                        = $accumulo::params::tmp_dir,
  $accumulo_root_password                         = $accumulo::params::accumulo_root_password,
  $accumulo_instance_secret                       = $accumulo::params::accumulo_instance_secret,
  $accumulo_masters                               = $accumulo::params::accumulo_masters,
  $accumulo_slaves                                = $accumulo::params::accumulo_slaves,
  $accumulo_example_config                        = $accumulo::params::accumulo_example_config,
  $accumulo_tserver_memory_maps_max               = $accumulo::params::accumulo_tserver_memory_maps_max,
  $accumulo_tserver_walog_max_size                = $accumulo::params::accumulo_tserver_walog_max_size,
  $accumulo_table_compaction_minor_logs_threshold = $accumulo::params::accumulo_table_compaction_minor_logs_threshold,
  $accumulo_tserver_memory_maps_native_enabled    = $accumulo::params::accumulo_tserver_memory_maps_native_enabled,
  $accumulo_tserver_cache_data_size               = $accumulo::params::accumulo_tserver_cache_data_size,
  $accumulo_tserver_cache_index_size              = $accumulo::params::accumulo_tserver_cache_index_size,
  $accumulo_trace_user                            = $accumulo::params::accumulo_trace_user,
  $zookeeper_home                                 = $accumulo::params::zookeeper_home,
  $zookeeper_nodes                                = $accumulo::params::zookeeper_nodes,
  $hadoop_prefix                                  = $accumulo::params::hadoop_prefix,
  $namenode_ipaddress                             = $accumulo::params::namenode_ipaddress,
  $namenode_hostname                              = $accumulo::params::namenode_hostname,
  $java_home                                      = $accumulo::params::java_home,
  $java_heap_size                                 = $accumulo::params::java_heap_size,
) inherits accumulo::params {
  class { '::accumulo::install': } ->
  class { '::accumulo::config': }
  contain '::accumulo::install'
  contain '::accumulo::config'
}
