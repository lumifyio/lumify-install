class ipv6 {
  exec { 'disable_ipv6' :
    command => "/sbin/sysctl -w net.ipv6.conf.all.disable_ipv6=1 && /bin/echo \"net.ipv6.conf.all.disable_ipv6 = 1\" >> /etc/sysctl.conf",
  }
}