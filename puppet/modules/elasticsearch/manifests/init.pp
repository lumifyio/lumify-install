class elasticsearch (
  $elasticsearch_version      = $elasticsearch::params::elasticsearch_version,
  $elasticsearch_rpm_version  = $elasticsearch::params::elasticsearch_rpm_version,
  $user                       = $elasticsearch::params::user,
  $group                      = $elasticsearch::params::group,
  $install_dir                = $elasticsearch::params::installdir,
  $config_dir                 = $elasticsearch::params::configdir,
  $log_dir                    = $elasticsearch::params::logdir,
  $work_dir                   = $elasticsearch::params::workdir,
  $tmp_dir                    = $elasticsearch::params::tmpdir,
  $elasticsearch_locations    = $elasticsearch::params::elasticsearch_locations,
  $number_of_shards           = $elasticsearch::params::number_of_shards,
  $number_of_replicates       = $elasticsearch::params::number_of_replicates,
  $es_heap_size               = $elasticsearch::params::es_heap_size,
  $mlockall                   = $elasticsearch::params::mlockall,
  $cluster_name               = $elasticsearch::params::cluster_name,
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
