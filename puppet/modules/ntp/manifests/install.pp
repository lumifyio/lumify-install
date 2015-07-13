class ntp::install inherits ntp {
  package { 'ntp':
    ensure   => installed,
  }
}