class sysctl::sysctl (
) inherits sysctl::base {
  exec { "sysctl reload" :
    command => "/sbin/sysctl -p",
  }
}
