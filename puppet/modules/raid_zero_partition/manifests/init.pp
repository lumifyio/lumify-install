class raid_zero_partition (
  $drives     = $raid_zero_partition::params::drives,
  $mount_dir  = $raid_zero_partition::params::mount_dir,
) inherits raid_zero_partition::params {
  class { '::raid_zero_partition::install': }
  contain '::raid_zero_partition::install'
}