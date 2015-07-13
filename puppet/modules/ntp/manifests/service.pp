class ntp::service inherits ntp {

  include '::java'

  service { 'ntpd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['ntp'],
  }
}