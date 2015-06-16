class swappiness (
  $vm_swappiness = $swappiness::params::vm_swappiness,
) inherits swappiness::params {

  exec { "vm.swappiness online" :
    command => "/sbin/sysctl -w vm.swappiness=${vm_swappiness}",
    unless  => "/usr/bin/test $(/sbin/sysctl -n vm.swappiness) -eq ${vm_swappiness}",
  }

  exec { "vm.swappiness persistant" :
    command => "/bin/echo \"vm.swappiness=${vm_swappiness}\" >> /etc/sysctl.conf",
    unless  => "/bin/grep -q vm.swappiness=${vm_swappiness} /etc/sysctl.conf",
  }
}