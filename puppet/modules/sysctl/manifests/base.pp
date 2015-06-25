class sysctl::base (
  $vm_swappiness                = $sysctl::params::vm_swappiness,
  $vm_max_map_count             = $sysctl::params::vm_max_map_count,
  $fs_max_open_file_descriptors = $sysctl::params::fs_max_open_file_descriptors,
) inherits sysctl::params {
}
