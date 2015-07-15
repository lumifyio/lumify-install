class mdadm::install inherits mdadm {
  package { 'mdadm':
    ensure => installed
  }
}