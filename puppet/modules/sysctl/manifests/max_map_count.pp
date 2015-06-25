class sysctl::max_map_count (
) inherits sysctl::base {
  exec { "max_map_count online" :
    command => "/sbin/sysctl -w vm.max_map_count=${vm_max_map_count}",
    unless  => "/usr/bin/test $(/sbin/sysctl -n vm.max_map_count) -eq ${vm_max_map_count}",
  } -> exec { "max_map_count persistant" :
    command => "/bin/echo \"vm.max_map_count=${vm_max_map_count}\" >> /etc/sysctl.conf",
    unless  => "/bin/grep -q vm.max_map_count=${vm_max_map_count} /etc/sysctl.conf",
  }
}