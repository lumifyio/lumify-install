class selinux {
  exec { 'selinux-disable' :
    command => '/usr/sbin/setenforce 0',
    onlyif  => '[ /usr/sbin/getenforce == "Enforcing" ]',
    provider => shell,
  }

  exec { 'selinux-sysconfig' :
    command => "sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux",
    onlyif  => '[ /usr/sbin/getenforce == "Enforcing" ]',
    provider => shell,
  }
}