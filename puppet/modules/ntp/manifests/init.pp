class ntp {
  class { '::ntp::install': } ->
  class { '::ntp::service': }
  contain '::ntp::install'
  contain '::ntp::service'
}