class elasticsearch (
  $elasticsearch_version      = $elasticsearch::params::elasticsearch_version,
  $elasticsearch_rpm_version  = $elasticsearch::params::elasticsearch_rpm_version,
  $user                       = $elasticsearch::params::user,
  $group                      = $elasticsearch::params::group,
  $installdir                 = $elasticsearch::params::installdir,
  $configdir                  = $elasticsearch::params::configdir,
  $logdir                     = $elasticsearch::params::logdir,
  $workdir                    = $elasticsearch::params::workdir,
  $tmpdir                     = $elasticsearch::params::tmpdir,
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
}
