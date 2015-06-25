class sysctl::swappiness (
) inherits sysctl::base {
  exec { "swappiness online" :
    command => "/sbin/sysctl -w vm.swappiness=${vm_swappiness}",
    unless  => "/usr/bin/test $(/sbin/sysctl -n vm_swappiness) -eq ${vm_swappiness}",
  } -> exec { "swappiness persistant" :
    command => "/bin/echo \"vm.swappiness=${vm_swappiness}\" >> /etc/sysctl.conf",
    unless  => "/bin/grep -q vm.swappiness=${vm_swappiness} /etc/sysctl.conf",
  }
}