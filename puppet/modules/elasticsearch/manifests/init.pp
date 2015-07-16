class elasticsearch (
  $elasticsearch_version        = $elasticsearch::params::elasticsearch_version,
  $elasticsearch_rpm_version    = $elasticsearch::params::elasticsearch_rpm_version,
  $user                         = $elasticsearch::params::user,
  $group                        = $elasticsearch::params::group,
  $install_dir                  = $elasticsearch::params::install_dir,
  $config_dir                   = $elasticsearch::params::config_dir,
  $data_dirs                    = $elasticsearch::params::data_dirs,
  $log_dir                      = $elasticsearch::params::log_dir,
  $plugin_dir                   = $elasticsearch::params::plugin_dir,
  $work_dir                     = $elasticsearch::params::work_dir,
  $tmp_dir                      = $elasticsearch::params::tmp_dir,
  $number_of_shards             = $elasticsearch::params::number_of_shards,
  $number_of_replicates         = $elasticsearch::params::number_of_replicates,
  $es_heap_size                 = $elasticsearch::params::es_heap_size,
  $indices_fielddata_cache_size = $elasticsearch::params::indices_fielddata_cache_size,
  $max_open_file_descriptors    = $elasticsearch::params::max_open_file_descriptors,
  $mlockall                     = $elasticsearch::params::mlockall,
  $cluster_name                 = $elasticsearch::params::cluster_name,
  $elasticsearch_locations      = $elasticsearch::params::elasticsearch_locations,
) inherits elasticsearch::params {
  class { '::elasticsearch::repo': } ->
  class { '::elasticsearch::install': } ->
  class { '::elasticsearch::config': } ->
  class { '::elasticsearch::service': }
  contain '::elasticsearch::repo'
  contain '::elasticsearch::install'
  contain '::elasticsearch::config'
  contain '::elasticsearch::service'
}
