class clavin (
  $clavin_index_archive   = $clavin::params::clavin_index_archive,
  $clavin_index_dir       = $clavin::params::clavin_index_dir,
  $tmp_dir                = $clavin::params::tmp_dir,
) inherits clavin::params {
  class { '::clavin::install': }
  contain '::clavin::install'
}