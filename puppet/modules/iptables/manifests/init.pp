class iptables {
  exec { 'disable_iptables' :
    command => "/sbin/chkconfig iptables off && /sbin/service iptables stop",
  }
}